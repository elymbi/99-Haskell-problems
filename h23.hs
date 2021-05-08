import Data.List
import System.Random

iolist :: a -> IO a
iolist a = pure a

list = "notaverylongstring"

randomels :: Int -> [a] -> IO [a] 
randomels int [] = iolist []  --return []
randomels int list 
    | int<= 0 = iolist []
    | otherwise = (getOneInt 1 (length list))>>= \gen -> 
    let (Just a, alist) = xremove list gen in
        (randomels (int-1) alist) >>= \xx -> iolist (a:xx)

main = 
    randomels (5) list >>= print 

getOneInt :: Int -> Int -> IO Int
getOneInt f s = getStdRandom (randomR (f,s))

-- trapOneInt :: IO Int -> Int
-- trapOneInt ioint = ioint >>= \int -> int


xremove :: [a] -> Int -> (Maybe a, [a])
xremove [] int = (Nothing, [])
xremove (x:xs) int 
    | (int==1) = (Just x, xs)
    | int<1 = error "nonexistent element"
    | int>1 = case (xremove xs (int-1)) of
        (Nothing, []) -> error "nonexistent el"
        (Just a, as) -> (Just a, x:as)
    | otherwise = error "impossible"