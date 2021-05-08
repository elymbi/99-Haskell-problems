import Data.List

f a = a+1

list = [2,3,5,6]

reverseList :: [Int] -> [[Int]]
reverseList l =
    let list2 = [] in
        map (\x ->  (x:list2)) l

main :: IO ()
main = do
    print "(f 2)"
    print (f 2)
    print (list)
    print $ reverseList list