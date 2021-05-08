import System.Random (randomRIO)
import Data.List

list = "abcde"

rndpermu :: [a] -> IO [a]
rndpermu [] = return []
rndpermu list = do {
    r <- (randomRIO (1, length list)) 
    ; let (Just a, rest) = (xremove list r) in
        rndpermu rest >>= \rest2 -> return (a:rest2)
        }

main = rndpermu list >>= print

xremove :: [a] -> Int -> (Maybe a, [a])
xremove [] int = (Nothing, [])
xremove (x:xs) int 
    | (int==1) = (Just x, xs)
    | int<1 = error "nonexistent element"
    | int>1 = case (xremove xs (int-1)) of
        (Nothing, []) -> error "nonexistent el"
        (Just a, as) -> (Just a, x:as)
    | otherwise = error "impossible"


    
