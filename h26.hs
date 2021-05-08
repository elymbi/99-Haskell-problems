import Data.Int

list = "abcdefghijkl"
intlist = [2,3]

comb :: Eq a => [a] -> Int -> ([[a]], Int)
comb _ 0 = ([[]],0)
comb [] num = ([],0)
comb (x:xs) num =
--    | num < 0 = error "num <  0"
--    | num ==1 = let r = map (\a -> [a]) (x:xs) in (r, length r)
--    | num == 0 = ([[]],0)
        let rest = comb xs num --rest = [[3]], unfinished = [[]]
            unfinished = comb xs (num-1) 
            r = (map (\a -> x:a) (fst unfinished))++(fst rest) 
            in
                 (r, length r)

-- comb "l" 2
--     comb l:[] 2
--         let rest = comb [] 2 
--                    [[]], 0
--             unfinished a comb [] 1
--                     [[]], 0
--             r = [l:[]]++[[]] === [[l],[]]
    
-- comb "l" 1 
--     comb l:[] 1
--         let rest = comb [] 1
--                     [[]], 0
--             unfinished = comb [] 0 
--                     [[]], 0
--             r = l:[] ++ [[]] === [[l],[]] 

-- comb "kl" 2
--     comb k:l 2
--         let rest = comb "l" 2 === [[l],[]]
--             unfinished = comb "l" 1 === [[l],[]] 
--             r = k:[l] ++ [[l]] ==== [[k,l],[l]]

    -- 1,2,3,4,5 2
    --     rest = 23,24,25,34,35,45
    --     unifished = comb 2,3,4,5 1
    --          rest = 3,4,5
    --          unfin = [[]]

    --         map ( \a -> 2:a) unfin) ++ rest 
    --         !!! [[2]] + rest 

    --     map func 12,13,14,15,    23,24,25,34,35,45


    -- 2,3 1
    --     rest = comb 3 1 
    --            rest = comb [] 1 = []
    --            unfin = comb [] 0 = []
    --            [] ++ [] = []
    --     unifished = comb 3 0
    --          rest = comb [] 0 =   []
    --          unfin = []
    --          map func [] ++ rest
    --          [] ++ []
    --          []

    --     map ( \a -> 2:a) []) ++ 3 
    --     = [] ++ 3 

    --     map func 12,13,14,15,    23,24,25,34,35,45
    

main = do
    print $ comb list 1



combinations :: Int -> [a] -> [[a]]
combinations 0 _ = [[]]
combinations _ [] = []
combinations n (x:xs) = (map (x:) (combinations (n-1) xs)) ++ (combinations n xs)
        --   1 (1:2,3) = map 1: (combinations 0 (2,3)) ++ (combinations 1 (2,3))
        --             = map 1: [[]] ++ 