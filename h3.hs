list = [1]
main = do
    print (xelement list 1)


xelement :: [a] -> Int -> a
xelement [] el = error "no such element"
xelement (x:xs) 1 = x
xelement (x:xs) el = xelement xs (el-1)
