module Parent.Lib (g) where

import Prelude
import Child.Lib (f)

g :: Int -> Int
g x = (f x * x) / 2


