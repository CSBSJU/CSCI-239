StarterCode.lhs

Haskell Code for CSCI 239, Lab 2

Andrew Whitford Holey
August, 2015
Tabs replaced with spaces September, 2016

Collect functions into a module for testing

> module StarterCode where

List of truth values

> truthList :: [Bool]
> truthList =  [True, False]


Map truth values for functions of one boolean variable

> mapTruth1 :: (Bool -> a) -> [a]
> mapTruth1 f = map f truthList


Map truth values for functions of two boolean variables

> mapTruth2 :: (Bool -> Bool -> a) -> [a]
> mapTruth2 f = mapThem2Them (map f truthList) truthList

Map truth values for functions of three boolean variables

> mapTruth3 :: (Bool -> Bool -> Bool -> a) -> [a]
> mapTruth3 f = mapThem2Them (mapThem2Them (map f truthList)
>                                          truthList)
>                            truthList

Map truth values for functions of four boolean variables

> mapTruth4 :: (Bool -> Bool -> Bool -> Bool -> a) -> [a]
> mapTruth4 f = mapThem2Them (mapThem2Them (mapThem2Them (map f truthList)
>                                                        truthList)
>                                          truthList)
>                            truthList

Map a list of functions to a list of parameters

> mapThem2Them :: [t -> a] -> [t] -> [a]
> mapThem2Them [] xs     = []
> mapThem2Them fs []     = []
> mapThem2Them (f:fs) xs = mapOnto f xs (mapThem2Them fs xs)


Map a function and a list of parameters onto an existing list of return values

> mapOnto :: (t -> a) -> [t] -> [a] -> [a]
> mapOnto f [] ys        = ys
> mapOnto f (x:xs) ys    = (f x) : mapOnto f xs ys


This function is an example of the kind of function you can apply mapTruth3 to;
it shows a simple boolean expression implemented as a Haskell function

> test3 :: Bool -> Bool -> Bool -> Bool
> test3 x y z = (x && y) || (not x && z)
