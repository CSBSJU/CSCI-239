module TestCode where

import System.IO
import Test.HUnit

import Solutions
import StarterCode

checkNaN1 (a, b) = isNaN a && isNaN b || a == b
checkNaN2 ((a, b), (c, d)) = isNaN a && isNaN c || a == c

makeTestList valList impl sol = TestList (map makeTest valList)
  where makeTest val = show val ~: impl val ~?= sol val

makeTestList' valList impl sol = TestList (map makeTest valList)
  where makeTest (a, b, c) = show (a, b, c) ~: impl a b c ~?= sol a b c

makeTestList'' valList impl sol = TestList (map makeTest valList)
  where makeTest (xs, ys) = show (xs, ys) ~: impl xs ys ~?= sol xs ys

quadRoots1 = makeTestList' inputList
  (\a b c -> checkNaN1 (StarterCode.quadRoots1 a b c))
  (\a b c -> checkNaN1 (Solutions.quadRoots1 a b c))
 where inputList = [ (1, 5, 4), (1, 4, 4), (1, 6, 10) ]

quadRoots2 = makeTestList' inputList
  (\a b c -> checkNaN2 (StarterCode.quadRoots2 a b c))
  (\a b c -> checkNaN2 (Solutions.quadRoots2 a b c))
 where inputList = [ (1, 5, 4), (1, 4, 4), (1, 6, 10) ]

quadRoots3 = makeTestList' inputList
  (\a b c -> checkNaN2 (StarterCode.quadRoots3 a b c))
  (\a b c -> checkNaN2 (Solutions.quadRoots3 a b c))
 where inputList = [ (1, 5, 4), (1, 4, 4), (1, 6, 10), (0, 6, 10), (6, 0, 10)
                   , (0, 0, 10) ]

maxList = makeTestList inputList StarterCode.maxList Solutions.maxList
  where inputList = [ [1..10], [-10..10], [n/3 | n <- [1..12]] ]

median1st3 = makeTestList inputList StarterCode.median1st3 Solutions.median1st3
  where inputList = [ [x, y, z] | x <- [-3..3]
                                , y <- [n/3 | n <- [1..12]]
                                , z <- [-3..3] ]

medianAll3s = makeTestList inputList StarterCode.medianAll3s
                Solutions.medianAll3s
  where inputList = [ [1..10], [-10..10], [n/3 | n <- [1..12]] ]

medianOfMedian3s = makeTestList inputList StarterCode.medianOfMedian3s
                    Solutions.medianOfMedian3s
  where inputList = [ [1..10], [-10..10], [n/3 | n <- [1..12]] ]

splitList = makeTestList inputList StarterCode.splitList Solutions.splitList
  where inputList = [ [1..10], [-10..10], [n/3 | n <- [1..12]] ]

mergeLists = makeTestList'' inputList StarterCode.mergeLists
              Solutions.mergeLists
  where inputList = [ ([1..10], [10,9..1]), ([-10..10], [10,9..(-10)])
                    , ([n/3 | n <- [1..12]], [n/3 | n <- [12,11..1]]) ]

mergeSort = makeTestList inputList StarterCode.mergeSort Solutions.mergeSort
  where inputList = [ [1..10], [10,9..(-10)]
                    , [if n `mod` 2 == 0 then n else -n | n <- [1..9]] ]

runTests' part = do
                  runTestText (putTextToHandle stderr False) part
                  putStr ""

runTests       = do
                  putStr "quadRoots1:       "
                  runTests' TestCode.quadRoots1
                  putStr "quadRoots2:       "
                  runTests' TestCode.quadRoots2
                  putStr "quadRoots3:       "
                  runTests' TestCode.quadRoots3
                  putStr "maxList:          "
                  runTests' TestCode.maxList
                  putStr "median1st3:       "
                  runTests' TestCode.median1st3
                  putStr "medianAll3s:      "
                  runTests' TestCode.medianAll3s
                  putStr "medianOfMedian3s: "
                  runTests' TestCode.medianOfMedian3s
                  putStr "splitList:        "
                  runTests' TestCode.splitList
                  putStr "mergeLists:       "
                  runTests' TestCode.mergeLists
                  putStr "mergeSort:        "
                  runTests' TestCode.mergeSort
