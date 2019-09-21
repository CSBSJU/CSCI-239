StarterCode.lhs

Haskell Code for CSCI 239, Lab 4

> module StarterCode where

This function determines whether one of its two parameters divides the other.
Both parameters can not be zero. The type will be determined in lab.

> oneDividesTheOther n m = n `mod` m == 0 || m `mod` n == 0

This function returns the minimum element in a non-empty list of ordinal values.

> minList :: Ord a => [a] -> a
> minList (x:[])  = x
> minList (x:xs)
>   | x < minRest = x
>   | otherwise   = minRest
>   where minRest = minList xs

This function sorts a list of ordinal values. It uses to auxiliary functions
splitList and mergeLists, which must be implemented before this function can be
compiled. NOTE: ADD A > SIGN TO THE BEGINNING OF EACH OF THE LINES OF THE
FUNCTION TO MAKE IT VISIBLE TO THE COMPILER. (You may then remove this note.)

    mergeSort :: Ord a => [a] -> [a]
    mergeSort []     = []
    mergeSort (x:[]) = x:[]
    mergeSort (x:xs) =
      mergeLists sl1 sl2
      where
        (l1, l2) = splitList (x:xs)
        sl1      = mergeSort l1
        sl2      = mergeSort l2

