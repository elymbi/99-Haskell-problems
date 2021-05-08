list = [1,2,3,4,5,5,6,6,7,7]
main = do
    print (llen "hello, world!")

llen :: [a] -> Int
llen [] = 0
llen (x:xs) = 1+llen xs
