import Test.HUnit
import StarterCode

t = True
f = False

test3_1 = TestCase (assertEqual "function: prop3_1"
  [f, t, t, f]
  (mapTruth2 prop3_1))

test3_2 = TestCase (assertEqual "function: prop3_2"
  [t, t, t, t, f, f, t, f]
  (mapTruth3 prop3_2))

test3_3 = TestCase (assertEqual "function: prop3_3"
  [t, f, t, f, t, t, f, f]
  (mapTruth3 prop3_3))

test3_4 = TestCase (assertEqual "function: prop3_4"
  [t, t, f, t, t, t, f, t, f, f, f, f, t, t, f, t]
  (mapTruth4 prop3_4))

test4_implies = TestCase (assertEqual "function: implies"
  [t, f, t, t]
  (mapTruth2 implies))

test4_iff = TestCase (assertEqual "function: iff"
  [t, f, f, t]
  (mapTruth2 iff))

test4_1 = TestCase (assertEqual "function: prop4_1"
  [f, f, t, t, f, t, f, f, t, f, t, t, t, f, t, t]
  (mapTruth4 prop4_1))

test5_predictSky = TestCase (assertEqual "function: predictSky"
  [ "You can see the sun, but not any stars"
  , "You cannot see the sun, but you can see the stars"
  , "You can see neither the sun nor any stars"
  , "You can see neither the sun nor any stars" ]
  (mapTruth2 predictSky))


tests = TestList
  [ test3_1
  , test3_2
  , test3_3
  , test3_4
  , test4_implies
  , test4_iff
  , test4_1
  , test5_predictSky ]

runTests = runTestTT tests
