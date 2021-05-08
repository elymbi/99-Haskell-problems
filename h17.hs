import Data.List

list = "skdhfsodjkmsdf"

splitn :: [a] -> Int -> ([a],[a])
splitn [] int = ([],[])
splitn list int 
    | (length list) > int = 
        (take int list, drop int list)
    | otherwise = (list,[])


main = do 
    print (splitn list 55)


recsplit :: [a] -> Int -> ([a],[a])
recsplit [] int = ([],[])
recsplit list 0 = ([],list)
recsplit (x:xs) int = 
    let (l,r) = recsplit xs (int-1) in (x:l,r)
    