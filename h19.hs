import Data.List

list = "abcdefgh"

lrotate :: [a] -> Int -> [a]
lrotate [] int = []
lrotate (x:xs) int
    | (int == 0) = x:xs
    | int < 0 = (lrotate (xs++[x]) (int-1+(length (x:xs))))
    | int>0 = (lrotate (xs++[x]) (int-1))

emptylist :: [Int]
emptylist = []

main = do
    print (lrotate list (-5))