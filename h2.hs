list = [1,24,-3,5]
main = do
    print (seclastelement list)


seclastelement :: [a] -> a
seclastelement [] = error "empty list"
seclastelement [x,y] = x
seclastelement (x:xs) = lastelement xs