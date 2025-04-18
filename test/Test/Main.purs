module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Class (liftEffect)
import Parent.Lib as Parent.Lib
import Test.QuickCheck (quickCheck, (===))
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner.Node (runSpecAndExitProcess)
import Test.Spec (Spec, describe, it)

main :: Effect Unit
main = runSpecAndExitProcess [ consoleReporter ] spec

spec :: Spec Unit
spec = do
  describe "Parent tests" do
    it "should match the unfolded def" $ liftEffect do
      quickCheck \n -> 
        Parent.Lib.g n === (n * (n + 1)) / 2

