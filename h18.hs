import Data.List

list = "ksdjfsoeljf"

xslice :: Int -> Int -> [a] -> [a] 
xslice start fin list =
    let (l,r) = recsplit list start
        (le,ri) = recsplit r (fin-start)
    in le
        
xslice2 :: Int -> Int -> [a] -> [a] 
xslice2 start fin list = 
    snd (recsplit (fst (recsplit list fin)) start)
        
        --head (recsplit (tail (recsplit list start)) (fin-start))

recsplit :: [a] -> Int -> ([a],[a])
recsplit [] int = ([],[])
recsplit list 0 = ([],list)
recsplit (x:xs) int = 
    let (l,r) = recsplit xs (int-1) in (x:l,r)

main = do
    print (xslice2 5 10 list)