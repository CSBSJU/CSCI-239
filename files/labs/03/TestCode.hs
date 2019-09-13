import System.IO
import Test.HUnit

import Solutions
import StarterCode

makeTestList impl sol valList = TestList
  (map makeTest valList)
  where makeTest val = show val ~: impl val ~?= sol val

part2 = TestList
  [ "list2_1" ~: StarterCode.list2_1 ~?= Solutions.list2_1
  , "list2_2" ~: StarterCode.list2_2 ~?= Solutions.list2_2
  , "list2_3" ~: StarterCode.list2_3 ~?= Solutions.list2_3
  , "list2_4" ~: StarterCode.list2_4 ~?= Solutions.list2_4
  , "list2_5" ~: StarterCode.list2_5 ~?= Solutions.list2_5
  , "list2_6" ~: StarterCode.list2_6 ~?= Solutions.list2_6
  , "list2_7" ~: StarterCode.list2_7 ~?= Solutions.list2_7 ]

part3 = TestList
  [ "list3_1" ~: StarterCode.list3_1 ~?= Solutions.list3_1
  , "list3_2" ~: StarterCode.list3_2 ~?= Solutions.list3_2
  , "list3_3" ~: StarterCode.list3_3 ~?= Solutions.list3_3 ]

part4 = TestList
  [ "list4_1" ~: StarterCode.list4_1 ~?= Solutions.list4_1
  , "list4_2" ~: StarterCode.list4_2 ~?= Solutions.list4_2
  , "list4_3" ~: StarterCode.list4_3 ~?= Solutions.list4_3
  , "list4_4" ~: StarterCode.list4_4 ~?= Solutions.list4_4 ]

part5 = TestList
  [ "list5_1" ~: StarterCode.list5_1 ~?= Solutions.list5_1
  , "list5_2" ~: StarterCode.list5_2 ~?= Solutions.list5_2
  , "list5_3" ~: StarterCode.list5_3 ~?= Solutions.list5_3 ]

part6 = TestList
  [ "list6_1" ~: StarterCode.list6_1 ~?= Solutions.list6_1
  , "list6_2" ~: StarterCode.list6_2 ~?= Solutions.list6_2
  , "list6_3" ~: StarterCode.list6_3 ~?= Solutions.list6_3 ]

part7 = makeTestList StarterCode.mySum Solutions.mySum inputList
  where inputList = [ [], [-10 .. 10] ]

part8 = makeTestList StarterCode.myMean Solutions.myMean inputList
  where inputList = [ [], [-1 .. 10] ]

part9 = makeTestList StarterCode.vowelCount1 Solutions.vowelCount1 inputList
  where inputList = [ [], ['a' .. 'z'], ['a' .. 'z'] ++ ['A' .. 'Z' ] ]

part10 = makeTestList StarterCode.vowelCount2 Solutions.vowelCount2 inputList
  where inputList = [ [], ['a' .. 'z'], ['a' .. 'z'] ++ ['A' .. 'Z' ] ]

part11 = makeTestList StarterCode.squaresDown Solutions.squaresDown inputList
  where inputList = [ 5, 10 ]

part12 = makeTestList StarterCode.negList Solutions.negList inputList
  where inputList = [ [], [-10 .. 10] ]

runTests' part = do
                  runTestText (putTextToHandle stderr False) part
                  putStr ""

runTests       = do
                  putStr "Part 2:  "
                  runTests' part2
                  putStr "Part 3:  "
                  runTests' part3
                  putStr "Part 4:  "
                  runTests' part4
                  putStr "Part 5:  "
                  runTests' part5
                  putStr "Part 6:  "
                  runTests' part6
                  putStr "Part 7:  "
                  runTests' part7
                  putStr "Part 8:  "
                  runTests' part8
                  putStr "Part 9:  "
                  runTests' part9
                  putStr "Part 10: "
                  runTests' part10
                  putStr "Part 11: "
                  runTests' part11
                  putStr "Part 12: "
                  runTests' part12
