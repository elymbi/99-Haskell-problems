import Data.List

list = [1,1,1,2,2,3]

xpack :: Eq a => [a] -> [[a]]
xpack [] = []
xpack list = group list
--xpack [x] = [x]
--xpack (x:y:xs) = if(x!==y) then x:(xpack(y:xs)) 
--              else [xy(xpack(xs))]

zpack :: Eq a => [a] -> [[a]]
zpack [] = [[]] 
zpack (x:xs) = --[1,1,1,2,2,3]
    case (zpack xs) of
        [[]] -> [[x]]
        y:ys --[[1,1,1]:[2,2][3]]
            | ((head y)==x) -> (x:y):ys --1==1 then [(1:[1,1,1]):[2,2],[3]]
            | otherwise -> [x]:y:ys

main = do
    print (zpack list)

-- pack :: Eq a => [a] -> [[a]]
-- pack [] = []
-- pack (x:xs) = (x:first) : pack rest
--          where
--            getReps [] = ([], [])
--            getReps (y:ys)
--                    | y == x = let (f,r) = getReps ys in (y:f, r)
--                    | otherwise = ([], (y:ys))
--            (first,rest) = getReps xs