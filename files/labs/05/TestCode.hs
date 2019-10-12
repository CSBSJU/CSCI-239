import System.IO
import Test.HUnit

import qualified Solutions as Sol
import qualified StarterCode as Stu

list1       = [0, 2 .. 20]
list2       = [1, 3 .. 20]
list3       = [0, 2 .. 40]
list4       = list1

stuSet1     = Stu.fromList list1
stuSet2     = Stu.fromList list2
stuSet3     = Stu.fromList list3
stuSet4     = Stu.fromList list4

solSet1     = Sol.fromList list1
solSet2     = Sol.fromList list2
solSet3     = Sol.fromList list3
solSet4     = Sol.fromList list4

-- ================
-- Helper functions
-- ================

makeTest'' impl sol = show impl ~?= show sol

makeTest' impl sol val = makeTest'' (impl val) (sol val)

makeTest impl sol val = show val ~: makeTest' impl sol val

makeTestList valList impl sol = (map (makeTest impl sol) valList)

-- ==========
-- Unit tests
-- ==========

empty = TestList
  [ "empty" ~: Stu.size Stu.empty ~?= Sol.size Sol.empty ]

singleton = TestList
  [ makeTest Stu.singleton Sol.singleton 1
  , makeTest Stu.singleton Sol.singleton 'c'
  , makeTest Stu.singleton Sol.singleton "string"
  , makeTest Stu.singleton Sol.singleton [1,2,3]  ]

fromList = TestList
  [ makeTest Stu.fromList Sol.fromList [1]
  , makeTest Stu.fromList Sol.fromList ['c']
  , makeTest Stu.fromList Sol.fromList ["string"]
  , makeTest Stu.fromList Sol.fromList [1,2,3]    ]

size = TestList
  ( (makeTestList numbers (Stu.size . Stu.fromList) (Sol.size . Sol.fromList))
 ++ (makeTestList chars   (Stu.size . Stu.fromList) (Sol.size . Sol.fromList))
 ++ (makeTestList bools   (Stu.size . Stu.fromList) (Sol.size . Sol.fromList))
  )
  where numbers = [ [], [1], [1,2,3], [1,1,2,2,3,3] ]
        chars   = [ [], "a", "abc", "abccba" ]
        bools   = [ [], [True], [True,False], [True,True,False] ]

member = TestList
  [ "0 `member`" ++ (show solSet1) ~: t1
  , "1 `member`" ++ (show solSet1) ~: t2 ]
  where t1 = makeTest' (flip Stu.member stuSet1) (flip Sol.member solSet1) 0
        t2 = makeTest' (flip Stu.member stuSet1) (flip Sol.member solSet1) 1

isSubsetOf = TestList
  [ (show solSet1) ++ " `isSubsetOf` " ++ (show solSet2) ~: t1
  , (show solSet1) ++ " `isSubsetOf` " ++ (show solSet3) ~: t2
  , (show solSet1) ++ " `isSubsetOf` " ++ (show solSet4) ~: t3 ]
  where t1 = Stu.isSubsetOf stuSet1 stuSet2 ~?= Sol.isSubsetOf solSet1 solSet2
        t2 = Stu.isSubsetOf stuSet1 stuSet3 ~?= Sol.isSubsetOf solSet1 solSet3
        t3 = Stu.isSubsetOf stuSet1 stuSet4 ~?= Sol.isSubsetOf solSet1 solSet4

-- TODO: Add a test for the union of .empty with .empty
union = TestList
  [ (show solSet1) ++ " `union` " ++ (show solSet2) ~: t1
  , (show solSet1) ++ " `union` " ++ (show solSet3) ~: t2
  , (show solSet1) ++ " `union` " ++ (show solSet4) ~: t3
  , (show solSet1) ++ " `union` {}"                 ~: t4
  , "{} `union` " ++ (show solSet1)                 ~: t5 ]
  where t1 = makeTest'' (Stu.union stuSet1 stuSet2) (Sol.union solSet1 solSet2)
        t2 = makeTest'' (Stu.union stuSet1 stuSet3) (Sol.union solSet1 solSet3)
        t3 = makeTest'' (Stu.union stuSet1 stuSet4) (Sol.union solSet1 solSet4)
        t4 = makeTest'' (Stu.union stuSet1 Stu.empty) (Sol.union solSet1 Sol.empty)
        t5 = makeTest'' (Stu.union Stu.empty stuSet1) (Sol.union Sol.empty solSet1)

-- TODO: Add a test for the intersection of .empty with .empty
intersection = TestList
  [ (show solSet1) ++ " `intersection` " ++ (show solSet2) ~: t1
  , (show solSet1) ++ " `intersection` " ++ (show solSet3) ~: t2
  , (show solSet1) ++ " `intersection` " ++ (show solSet4) ~: t3
  , (show solSet1) ++ " `intersection` {}"                 ~: t4
  , "{} `intersection` " ++ (show solSet1)                 ~: t5 ]
  where t1 = makeTest'' (Stu.intersection stuSet1 stuSet2) (Sol.intersection solSet1 solSet2)
        t2 = makeTest'' (Stu.intersection stuSet1 stuSet3) (Sol.intersection solSet1 solSet3)
        t3 = makeTest'' (Stu.intersection stuSet1 stuSet4) (Sol.intersection solSet1 solSet4)
        t4 = makeTest'' (Stu.intersection stuSet1 Stu.empty) (Sol.intersection solSet1 Sol.empty)
        t5 = makeTest'' (Stu.intersection Stu.empty stuSet1) (Sol.intersection Sol.empty solSet1)

-- TODO: Add a test for the intersection of .empty with .empty
difference = TestList
  [ (show solSet1) ++ " `difference` " ++ (show solSet2) ~: t1
  , (show solSet1) ++ " `difference` " ++ (show solSet3) ~: t2
  , (show solSet1) ++ " `difference` " ++ (show solSet4) ~: t3
  , (show solSet1) ++ " `difference` {}"                 ~: t4
  , "{} `difference` " ++ (show solSet1)                 ~: t5 ]
  where t1 = makeTest'' (Stu.difference stuSet1 stuSet2) (Sol.difference solSet1 solSet2)
        t2 = makeTest'' (Stu.difference stuSet1 stuSet3) (Sol.difference solSet1 solSet3)
        t3 = makeTest'' (Stu.difference stuSet1 stuSet4) (Sol.difference solSet1 solSet4)
        t4 = makeTest'' (Stu.difference stuSet1 Stu.empty) (Sol.difference solSet1 Sol.empty)
        t5 = makeTest'' (Stu.difference Stu.empty stuSet1) (Sol.difference Sol.empty solSet1)

-- ============
-- Test runners
-- ============

runTests' part = do
                  runTestText (putTextToHandle stderr False) part
                  putStr ""

runTests       = do
                  putStr "empty:           "
                  runTests' empty
                  putStr "singleton:       "
                  runTests' singleton
                  putStr "fromList:        "
                  runTests' fromList
                  putStr "size:            "
                  runTests' size
                  putStr "member:          "
                  runTests' member
                  putStr "isSubsetOf:      "
                  runTests' isSubsetOf
                  putStr "union:           "
                  runTests' union
                  putStr "intersection:    "
                  runTests' intersection
                  putStr "difference:      "
                  runTests' difference
