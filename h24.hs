import System.Random (randomRIO)
import Data.List

ioa :: a -> IO a --return does that
ioa a = pure a 

randnums :: Integer -> Integer -> IO [Integer]
randnums fin iter = randnums2 [1..fin] iter

randnums2 :: [Integer] -> Integer -> IO [Integer]
randnums2 list 0 = return []
randnums2 [] int = return []
randnums2 xx int  
        | int<1 = return []
        | otherwise = do
            ran <- (randomRIO (1, length xx))
            let (Just a, rest) = xremove xx ran in 
                randnums2 rest (int-1) >>= \niorest -> return (a:niorest)
               
main = randnums 5 2 >>= print 


xremove :: [a] -> Int -> (Maybe a, [a])
xremove [] int = (Nothing, [])
xremove (x:xs) int 
    | (int==1) = (Just x, xs)
    | int<1 = error "nonexistent element"
    | int>1 = case (xremove xs (int-1)) of
        (Nothing, []) -> error "nonexistent el"
        (Just a, as) -> (Just a, x:as)
    | otherwise = error "impossible"
