Haskell module for a Set data type
J. Andrew Whitford Holey, October, 2015
***your name and today's date here


Module declaration is the interface for the Set data type

>   module Set
>    ( Set           , -- type defined by this module
>       emptySet     , -- Set a
>       singleton    , -- a -> Set a
>       setFromList  , -- Eq a => [a] -> Set a
>       setMember    , -- Eq a => a -> Set a -> Bool
>       union        , -- Eq a => Set a -> Set a -> Set a
>       intersection , -- Eq a => Set a -> Set a -> Set a
>       difference   , -- Eq a => Set a -> Set a -> Set a
>       subset       , -- Eq a => Set a -> Set a -> Bool
>       size         , -- Set a -> Int
>    ) where


Define the Set data type

>   newtype Set a = MakeSet [a]


Define Set as an equality type

>   instance Eq a => Eq (Set a ) where
>     (==) set1 set2 = (subset set1 set2) && (subset set2 set1)


Define Set as a showable type

>   instance Show a => Show (Set a) where
>     show (MakeSet ys) = "{" ++ (showRest ys)


showRest creates the ending part of a set show string;
this function is not exported

>   showRest :: Show a => [a] -> [Char]
>   showRest []     = "}"
>   showRest (x:[]) = (show x) ++ "}"
>   showRest (x:xs) = (show x) ++ "," ++ (showRest xs)


The emptySet is a set with no elements

>   emptySet :: Set a
>   emptySet =  MakeSet []


singleton makes a set with one element

>   singleton :: a -> Set a
>   singleton x = MakeSet [x]


setFromList makes a set from a list of elements, removing duplicates

>   setFromList :: Eq a => [a] -> Set a
>   setFromList xs = MakeSet (cleanList xs)


cleanList removes duplicates from a list; this function is not exported

>   cleanList :: Eq a => [a] -> [a]
>   cleanList []     = []
>   cleanList (x:xs)
>     | elem x xs = cleanList xs
>     | otherwise = x : (cleanList xs)    


setMember determines whether an element is a member of a set

>   setMember :: Eq a => a -> Set a -> Bool
>   -- *** put your code here


makes a new set containing all the elements of either of two existing sets

>   union :: Eq a => Set a -> Set a -> Set a
>   union (MakeSet xs) (MakeSet ys) = MakeSet (listUnion xs ys)


listUnion adds the elements of one list to another, without duplicating elements;
it assumes both lists have no duplicates; this function is not exported

>   listUnion :: Eq a => [a] -> [a] -> [a]
>   listUnion [] ys     = ys
>   listUnion xs []     = xs
>   listUnion (x:xs) ys
>     | elem x ys       = listUnion xs ys
>     | otherwise       = x : (listUnion xs ys)


intersection makes a new set containing all the elements of both of two existing sets

>   intersection :: Eq a => Set a -> Set a -> Set a
>   -- *** put your code here


listIntersection makes a list of the elements two lists have in common, without
duplicating elements; it assumes both lists have no duplicates;
this function is not exported

>   listIntersection :: Eq a => [a] -> [a] -> [a]
>   -- *** put your code here


difference makes a new set containing all the elements in the first set not in the second

>   difference :: Eq a => Set a -> Set a -> Set a
>   -- *** put your code here


listDifference makes a list of the elements in the first list that are not in the second;
it assumes both lists have no duplicates; this function is not exported

>   listDifference :: Eq a => [a] -> [a] -> [a]
>   -- *** put your code here


subset determines if the elements of set1 are in set2

>   subset :: Eq a => Set a -> Set a -> Bool
>   -- *** put your code here


size returns the number of elements in a set

>   size :: Set a -> Int
>   -- *** put your code here

