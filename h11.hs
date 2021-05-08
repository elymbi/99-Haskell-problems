import Data.List 

list = [1,1,1,2,2,2,2,3,3,3,3,3,3,3,3,3,4,5,5]

runlen1 :: [[a]] -> [(Int, a)]
runlen1 list = map (\x -> (length x, head x)) list

data Tlist a = Single a | Multiple Int a
runlen2 :: [(Int, a)] -> [Tlist a]
runlen2 [] = []
runlen2 (x:xs) =
    case x of
        (1,a) -> (Single a):(runlen2 xs)
        (int,a) -> (Multiple int a):(runlen2 xs)

main = do
    print (runlen2 (runlen1 (group list)))