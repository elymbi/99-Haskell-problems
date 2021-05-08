import System.Random

main :: IO String
main = guessingGameInit

-- main = getOneInt >>= \n -> putStrLn (show n)
-- main = do
--    gen <- newStdGen
--    let ns = randoms gen :: [Int]
--    print $ take 1 ns

-- instance Random Num where
--     randomR (a, b) g =
--       case randomR (fromEnum a, fromEnum b) g of
--         (x, g') -> (toEnum x, g')
--     random g = randomR (minBound, maxBound) g

getOneInt :: IO Int
getOneInt = getStdRandom (randomR (1,100))

guessingGame :: Int -> Int -> IO String
guessingGame guess orig = 
    if(orig==guess) then 
        return "Correct" 
    else if (orig<guess) then
        putStrLn "Guess lower" >>
        getLine >>= \newguess ->
            let var = read newguess :: Int in
                    guessingGame var orig
    else
        putStrLn "Guess higher" >>
        getLine >>= \newguess ->
            let var = read newguess :: Int in
                    guessingGame var orig

guessingGameInit :: IO String
guessingGameInit =
    getOneInt >>= \orig ->
        -- orig is now an int!
        putStrLn "Guess" >>
            getLine >>= \guess ->
                let guessvar = read guess :: Int in
                    guessingGame guessvar orig
                    -- guessvar is now an int!