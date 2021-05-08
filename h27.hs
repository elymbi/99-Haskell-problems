list = "abcdef"

xgroup3 :: [a] -> Int -> Int -> Int -> [[a]]
xgroup3 [] i j k = []
xgroup3 [x] i j k = [x]
xgroup3 x:y:xs 0 0 0 = [] 
xgroup3 x:y:xs i j k 
    | i+j+k != (lengh x:y:ys) = error "wrong numbers"
    | i==0 = xgroup3 x:y:xs j k 0
    | otherwise = 
        if (length (xgroup3 xs (i-1) j k)==3) then 
            [x:(head ((xgroup3 xs (i-1) j k)), tail(xgroup3 xs (i-1) j k))]
        else [x, (xgroup3 xs (i-1) j k)]


combinations :: Int -> [a] -> [[a]]
combinations 0 _ = [[]]
combinations _ [] = []
combinations n (x:xs) = (map (x:) (combinations (n-1) xs)) ++ (combinations n xs)

nine234combos :: [a] -> [[[a]]]
nine234combos [] = []
nine234combos (x:y) = error "two els"
nine234combos (x:y:xs) = (map (x:) (combinations (n-1) xs)) ++ (combinations n xs)

leftover :: [a] -> [a] -> [a]
leftover elems list = filter (combinations )


-- abcdef 1 2 3 a bc def 
-- 1. comb a list 2. comb b (list-a) 3. comb c (list-a-b) 4. a x b x c

--         12345
--         1 2 3

--         1    2     3     4   5
--         23 24 25 34 35 45

-- find all i-digit combinations
-- for each i-digit combination, 
--     find all j-digit rest-combinations and 
--         for each j-digit combination,
--             return the i-digit combination ,
--             the j-digit combination and 
--             the rest


        



