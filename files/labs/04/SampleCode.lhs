CSCI 239 - Discrete Structures of Computer Science

Lab 4 - Haskell Functions 1

Run ghci in a terminal window in the same directory as this file,
which should be in your CS239/Lab04 directory. The instructions for
the lab are in the separate write-up file, as usual.

This file contains all supplied Haskell code for the lab, and this is
where you can add your own code for the lab.


Part 1: Domains and co-domains in Haskell function

This function determines whether one of its two parameters divides the other.
Both parameters can not be zero. The type will be determined in lab.

>    oneDividesTheOther n m = n `mod` m == 0 || m `mod` n == 0


Part 2: The domain of functions on lists

This function returns the minimum element in a non-empty list of ordinal values.

>    minList :: Ord a => [a] -> a
>    minList (x:[])  = x
>    minList (x:xs)
>      | x < minRest = x
>      | otherwise   = minRest
>      where minRest = minList xs


Part 3: Sorting a list

This function sorts a list of ordinal values.
It uses to auxiliary functions splitList and mergeLists, which must be
implemented before this function can be compiled.
NOTE: ADD A > SIGN TO THE BEGINNING OF EACH OF THE LINES OF THE FUNCTION TO MAKE
IT VISIBLE TO THE COMPILER. (You may then remove this note.)

    mergeSort :: Ord a => [a] -> [a]
    mergeSort []     = []
    mergeSort (x:[]) = x:[]
    mergeSort (x:xs) =
      mergeLists sl1 sl2
      where
        (l1, l2) = splitList (x:xs)
        sl1      = mergeSort l1
        sl2      = mergeSort l2

