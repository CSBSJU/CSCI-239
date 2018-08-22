TestSet.lhs
This file provides tests for the Set.lhs module
J. Andrew Whitford Holey, October 2015

The TestSet module imports the Set module and provides various test cases.
None of the elements of this module are exported, since it is intended for test purposes only.
The tests in this suite are not exhaustive, so passing all the tests doesn't guarantee that
the Set module is correct.
Feel free to add more tests if you find them necessary.

To use the tests, load this file into ghci, then run the test functions: showSets,
showMembers, showCombinations, showSubsets.
Note that this file will not load without errors until you have implementations of all the
functions in the Set module.
Consider implementing stub versions (such as a function that always returns False if its
return type is Bool) if you want to test the constructor functions first, etc.


>   module TestSet where

>   import Set


Definitions of several test sets, use showSets to view the sets and their sizes

>   -- emptySet is defined in Sets
>   zeroSet     = singleton 0
>   oneSet      = singleton 1
>   evens20     = setFromList [0, 2 .. 20]
>   odds20      = setFromList [1, 3 .. 20]
>   threes20    = setFromList [0, 3 .. 20]
>   nonThrees20 = setFromList [ n | n <- [0 .. 20], n `mod` 3 /= 0 ]
>   duplicates  = setFromList [1, 1, 1, 2, 3, 4, 2, 3, 4, 5, 6, 1, 2]
>   aSet        = singleton 'a'
>   lettersSet  = setFromList ['a' .. 'z']
>   wordSet     = setFromList ["the", "eye", "of", "the", "storm"]


showSets tests the set constructors and the size function on newly constructed sets

>   showSets = do
>      putStr "emptySet:    "
>      putStr (show (emptySet :: Set Integer))
>        -- type declaration needed to allow show to know what kind of list it has
>      putStr "  size: "
>      putStr (show (size (emptySet :: Set Integer)))
>      putStr " - 0 expected\n"
>      putStr "zeroSet:     "
>      putStr (show zeroSet)
>      putStr "  size: "
>      putStr (show (size zeroSet))
>      putStr " - 1 expected\n"
>      putStr "oneSet:      "
>      putStr (show oneSet)
>      putStr "  size: "
>      putStr (show (size oneSet))
>      putStr " - 1 expected\n"
>      putStr "evens20:     "
>      putStr (show evens20)
>      putStr "  size: "
>      putStr (show (size evens20))
>      putStr " - 11 expected\n"
>      putStr "odds20:      "
>      putStr (show odds20)
>      putStr "  size: "
>      putStr (show (size odds20))
>      putStr " - 10 expected\n"
>      putStr "threes20:    "
>      putStr (show threes20)
>      putStr "  size: "
>      putStr (show (size threes20))
>      putStr " - 7 expected\n"
>      putStr "nonThrees20: "
>      putStr (show nonThrees20)
>      putStr "  size: "
>      putStr (show (size nonThrees20))
>      putStr " - 14 expected\n"
>      putStr "duplicates:  "
>      putStr (show duplicates)
>      putStr "  size: "
>      putStr (show (size duplicates))
>      putStr " - 6 expected\n"
>      putStr "aSet:        "
>      putStr (show aSet)
>      putStr "  size: "
>      putStr (show (size aSet))
>      putStr " - 1 expected\n"
>      putStr "lettersSet:  "
>      putStr (show lettersSet)
>      putStr "  size: "
>      putStr (show (size lettersSet))
>      putStr " - 26 expected\n"
>      putStr "wordSet:     "
>      putStr (show wordSet)
>      putStr "  size: "
>      putStr (show (size wordSet))
>      putStr " - 4 expected\n"


showMembers tests the setMember function by trying a few members and non-members of
several of the test sets.

>   showMembers = do
>      putStr " setMember  0 zeroSet: "
>      putStr (show (setMember 0 zeroSet))
>      putStr "  - True expected\n"
>      putStr " setMember 10 zeroSet: "
>      putStr (show (setMember 10 zeroSet))
>      putStr " - False expected\n"
>      putStr " setMember  0 evens20: "
>      putStr (show (setMember 0 evens20))
>      putStr "  - True expected\n"
>      putStr " setMember 11 evens20: "
>      putStr (show (setMember 11 evens20))
>      putStr " - False expected\n"
>      putStr " setMember  5 odds20:  "
>      putStr (show (setMember 5 odds20))
>      putStr "  - True expected\n"
>      putStr " setMember 21 odds20:  "
>      putStr (show (setMember 21 odds20))
>      putStr " - False expected\n"
>      putStr " setMember \"eye\" wordSet: "
>      putStr (show (setMember "eye" wordSet))
>      putStr "  - True expected\n"
>      putStr " setMember \"Eye\" wordSet: "
>      putStr (show (setMember "Eye" wordSet))
>      putStr " - False expected\n"


Definitions of the union, intersection, and difference of several sets

>   union1        = union evens20 odds20
>   intersection1 = intersection evens20 odds20
>   difference1   = difference evens20 odds20
>   union2        = union odds20 threes20
>   intersection2 = intersection odds20 threes20
>   difference2   = difference odds20 threes20
>   union3        = union aSet emptySet
>   intersection3 = intersection aSet emptySet
>   difference3   = difference aSet emptySet


showCombinations displays the results and sizes of the union, intersection, and
difference of several set combinations

>   showCombinations = do
>      putStr "union1:        "
>      putStr (show union1)
>      putStr "  size: "
>      putStr (show (size union1))
>      putStr " - 21 expected\n"
>      putStr "intersection1: "
>      putStr (show intersection1)
>      putStr "  size: "
>      putStr (show (size intersection1))
>      putStr " - 0 expected\n"
>      putStr "difference1:   "
>      putStr (show difference1)
>      putStr "  size: "
>      putStr (show (size difference1))
>      putStr " - 11 expected\n"
>      putStr "union2:        "
>      putStr (show union2)
>      putStr "  size: "
>      putStr (show (size union2))
>      putStr " - 14 expected\n"
>      putStr "intersection2: "
>      putStr (show intersection2)
>      putStr "  size: "
>      putStr (show (size intersection2))
>      putStr " - 3 expected\n"
>      putStr "difference2:   "
>      putStr (show difference2)
>      putStr "  size: "
>      putStr (show (size difference2))
>      putStr " - 7 expected\n"
>      putStr "union3:        "
>      putStr (show union3)
>      putStr "  size: "
>      putStr (show (size union3))
>      putStr " - 1 expected\n"
>      putStr "intersection3: "
>      putStr (show intersection3)
>      putStr "  size: "
>      putStr (show (size intersection3))
>      putStr " - 0 expected\n"
>      putStr "difference3:   "
>      putStr (show difference3)
>      putStr "  size: "
>      putStr (show (size difference3))
>      putStr " - 1 expected\n"


showSubsets tests the subset relationship for various sets

>   showSubsets = do
>      putStr " subset zeroSet evens20: "
>      putStr (show (subset zeroSet evens20))
>      putStr "  - True expected\n"
>      putStr " subset zeroSet odds20: "
>      putStr (show (subset zeroSet odds20))
>      putStr " - False expected\n"
>      putStr " subset evens20 union1: "
>      putStr (show (subset evens20 union1))
>      putStr "  - True expected\n"
>      putStr " ubset threes20 evens20: "
>      putStr (show (subset threes20 evens20))
>      putStr " - False expected\n"
>      putStr " subset threes20 union1:  "
>      putStr (show (subset threes20 union1))
>      putStr "  - True expected\n"
>      putStr " subset emptySet union1:  "
>      putStr (show (subset emptySet union1))
>      putStr " - True expected\n"
>      putStr " subset union1 emptySet: "
>      putStr (show (subset union1 emptySet))
>      putStr "  - False expected\n"
>      putStr " setMember \"Eye\" wordSet: "

