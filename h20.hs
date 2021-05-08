import Data.List

list = "abcd"

xremove :: [a] -> Int -> (Maybe a, [a])
xremove [] int = (Nothing, [])
xremove (x:xs) int 
    | (int==1) = (Just x, xs)
    | int<1 = error "nonexistent element"
    | int>1 = case (xremove xs (int-1)) of
        (Nothing, []) -> error "nonexistent el"
        (Just a, as) -> (Just a, x:as)
    | otherwise = error "impossible"

main = do
    print (xremove list (-3))