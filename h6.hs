import H5
--import Data.Bool
list = [1,2,3,4,5,5,6,6,7,7]
main = do
    print (pal "!hello, ,olleh!")

pal :: Eq a => [a] -> Bool
pal list = (list == (xreverse list))

xreverse :: [a] -> [a]
xreverse [] = []
xreverse (x:xs) = (xreverse xs)++[x]