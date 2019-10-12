module declaration is the interface for the set data type

> module StarterCode
>   ( empty
>   , singleton
>   , fromList
>   , isSubsetOf
>   , member
>   , size
>   , union
>   , intersection
>   , difference
>   ) where

Define the Set data type with a single constructor

> newtype Set a = Set [a]

=========
Instances
=========

Define Set as a showable type

> instance Show a => Show (Set a) where
>   show (Set ys) = "{" ++ (showList ys)
>     where showList :: Show a => [a] -> [Char]
>           showList []     = "}"
>           showList (x:[]) = (show x) ++ "}"
>           showList (x:xs) = (show x) ++ "," ++ (showList xs)

============
Constructors
============

The empty set.

> empty :: Set a
> empty = Set []

Create a singleton set.

> singleton :: a -> Set a
> singleton x = Set [x]

Create a set from a list of elements.

> fromList :: Eq a => [a] -> Set a
> fromList xs = Set (cleanList xs)
>   where cleanList :: Eq a => [a] -> [a]
>         cleanList [] = []
>         cleanList (x:xs)
>           | elem x xs = cleanList xs
>           | otherwise = x : (cleanList xs)

=====
Query
=====

Is one set a subset of another?

> isSubsetOf :: Eq a => Set a -> Set a -> Bool
> -- *** put your code here

Is the element in the set?

> member :: Eq a => a -> Set a -> Bool
> -- *** put your code here

The number of elements in the set.

> size :: Set a -> Int
> size (Set xs) = length xs

=========
Operators
=========

The union of two sets --- a new set containing all the elements of either of two
existing sets.

> union :: Eq a => Set a -> Set a -> Set a
> -- *** put your code here

The intersection of two sets --- a new set containing all the elements of both
of two existing sets.

> intersection :: Eq a => Set a -> Set a -> Set a
> -- *** put your code here

The difference of two sets --- a new set containing all the elements in the
first set that are not in the second set.

> difference :: Eq a => Set a -> Set a -> Set a
> -- *** put your code here

The Cartesian product of two sets --- a new set containing all pairs of elements
(a,b) where a is in the first set and b is in the second set.

> cartesianProduct :: Set a -> Set b -> Set (a,b)
> -- *** put your code here
