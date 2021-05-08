import Data.List

list = "1"

xinsert :: a -> [a] -> Int -> [a]
xinsert el [] at = [el]
xinsert el list 1 = el:list
xinsert el (x:xs) at = x:(xinsert el xs (at-1))

main = do
    print (xinsert 'a' list 3)