
main = do
    print (xflatten list)
--    print (ll)

data Nestedlist a = Elem a | Madeupthing [Nestedlist a]

list = Madeupthing [Elem 1, Madeupthing [Elem 2],Elem 3]
--list = Madeupthing ([]::[Nestedlist Int])
--list = Elem 2

ll = []::[Int]

xflatten :: Nestedlist a -> [a]
xflatten  (Madeupthing []) = []
xflatten  (Elem x) = [x]
xflatten (Madeupthing (x:xs)) = (xflatten x)++(xflatten (Madeupthing xs))
--xflatten ((Madeupthing x):xs) = x:(xflatten xs)

