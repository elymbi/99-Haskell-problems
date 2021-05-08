import Data.Bool

noftimes :: Eq a => a -> [a] -> Int
noftimes el [] = 0
noftimes el (a:as) = (bool 0 1 (el==a)) + noftimes el as


noftimes2 :: Eq a => a -> [a] -> Int
noftimes2 el  = length . filter (== el) 

