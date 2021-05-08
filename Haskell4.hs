go-- https://wiki.haskell.org/Introduction_to_IO
import Data.Foldable



main :: IO ()
main = do
    -- putStrLn (string ++ "Hello world" ++show(int))
    -- putStrLn (question name)
    -- putStrLn "p"
    --putStrLn (show(int))
    --putStrLn (show(head (forM list quiz)))
    let var::IO (Int)
        var = (loop list quiz)
    var >>= \fin -> putStrLn (show fin)
        --in putStrLn (var >>= (\v -> show(v)))
    --return ()
        --in putStrLn show(var)
    --do {putStrLn "hi"; return "yes"}
--main = do { putStrLn "hello"; return "yes" }

    
string = "odhf"
--foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b
-- (a->b->(a+b)) 0 -> [a] -> int
    
    
-- forM :: (Monad m) => [a] -> (a -> m b) -> m [b]
-- forM [] f = return []
-- forM (x:xs) f = f x >>= \r -> forM xs f >>= \rs -> return (r:rs)

loop::[a] -> (a->IO (Int)) -> IO (Int)
loop [] f = return(0)
loop list f = 
    let lint = (map f list) 
    in foldl ((\ioa iob -> ioa >>= \a -> iob >>= \b -> return (b + a))) (pure 0) lint 
    
    
    --(f x) >>= \r -> r:(loop xs f)
    
    --loop xs f >>= \rs -> (r:rs:[])

-- i want to create a quiz
-- that means asking questions, comparing the answer to a list of answers, 
-- adjusting the score and returning the final score
-- i need
-- a list of question and answer
-- comparison and score function

func::Int->[Bool]
func anything = [True,False,False]



data Question = Bla
  { question :: String
  , answer :: [String]
  }

-- create Instance

int::Int
int = 2

list::[Question]
list = [name,name2,name3]

name::Question
name = Bla "bla" ["b","c"]

name2::Question
name2 = Bla "bla2" ["b2","c2"]

name3::Question
name3 = Bla "bla3" ["b3","c3"]


quiz :: Question -> IO (Int)
quiz q = do
    putStrLn (question q) 
    input <- getLine
    if input == head (answer q)
        then do
          putStrLn "Correct!" 
          pure 1
        else do 
          putStrLn "Incorrect!"
          pure 0