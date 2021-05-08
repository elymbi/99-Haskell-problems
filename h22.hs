import Data.List

rangelist :: Int -> Int -> [Int]
rangelist start end | end>=start =start:(rangelist (start+1) end)
                    | otherwise = []

main = do
    print (rangelist 7 4)