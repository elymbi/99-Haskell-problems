module H5 where 

list = [1,2,3,4,5,5,6,6,7,7]
main = do
    print (xreverse "hello, world!")

xreverse :: [a] -> [a]
xreverse [] = []
xreverse (x:xs) = (xreverse xs)++[x]