StarterCode.lhs

Haskell Code for CSCI 239, Lab 3

> module StarterCode where

Count the number of elements in a list.

> count :: Num a => [t] -> a
> count []     = 0
> count (x:xs) = 1 + (count xs)

Count the number of times an element occurs in a list.

> elemCount :: (Eq a1, Num a) => a1 -> [a1] -> a
> elemCount elem []     = 0
> elemCount elem (x:xs)
>   | elem == x         = 1 + (elemCount elem xs)
>   | otherwise         = elemCount elem xs

Return a list of numbers starting at n, increasing by one, up to m.

> range :: (Num a, Ord a) => a -> a -> [a]
> range n m
>   | n > m     = []
>   | otherwise = n : (range (n + 1) m)
