-- ??? import h9.hs
import Data.List 

list = [1,1,1,2,2,2,2,3,3,3,3,3,3,3,3,3]

zpack :: Eq a => [a] -> [[a]]
zpack [] = [[]] 
zpack (x:xs) = 
    case (zpack xs) of
        [[]] -> [[x]]
        y:ys 
            | ((head y)==x) -> (x:y):ys 
            | otherwise -> [x]:y:ys

xrunlength :: [[a]] -> [(Int, a)]
xrunlength list = case list of
    [] -> []
    x:xs -> (length x, head x):(xrunlength xs)

usemap :: Eq a => [a] -> [(Int, a)]
usemap list = map (\x -> (length x, head x)) (group list)
            
main = do
    print (usemap list)
