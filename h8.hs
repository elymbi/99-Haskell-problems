list = [1,1,1,2,2,3]

nodupl :: Eq a => [a] -> [a]
nodupl [] = []
nodupl [x] = [x]
nodupl (x:y:xs) = if(x==y) then nodupl (y:xs) else x:(nodupl(y:xs))

main = do
    print (nodupl list)