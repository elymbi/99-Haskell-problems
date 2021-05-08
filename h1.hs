list = [1,24,3,5]
main = do
    print (lastelement list)


lastelement :: [a] -> a
lastelement [] = error "empty list"
lastelement [x] = x
lastelement (x:xs) = lastelement xs