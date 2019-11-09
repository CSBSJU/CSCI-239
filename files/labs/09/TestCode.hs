import System.IO
import Test.HUnit

import qualified Solutions as Sol
import qualified StarterCode as Stu

-- ================
-- Helper functions
-- ================

makeTest''' impl sol = show impl ~?= show sol

makeTest'' impl sol val = makeTest''' (impl val) (sol val)

makeTest' impl sol val = show val ~: makeTest'' impl sol val

makeTest valList impl sol = (map (makeTest' impl sol) valList)

-- ==========
-- Unit tests
-- ==========

relF = TestList ( makeTest [1..10] Stu.relF Sol.relF )

relG = TestList ( makeTest  [0..9] Stu.relG Sol.relG )

relH = TestList ( makeTest  [0..9] Stu.relH Sol.relH )

relJ = TestList ( makeTest [1..10] Stu.relJ Sol.relJ )

relL = TestList ( makeTest [1..10] Stu.relL Sol.relL )

relQ = TestList ( makeTest  [0..9] Stu.relQ Sol.relQ )

relT = TestList ( makeTest [1..10] Stu.relT Sol.relT )

-- ============
-- Test runners
-- ============

runTests' part = do
                  runTestText (putTextToHandle stderr False) part
                  putStr ""

runTests       = do
                  putStr "relF:  "
                  runTests' relF
                  putStr "relG:  "
                  runTests' relG
                  putStr "relH:  "
                  runTests' relH
                  putStr "relJ:  "
                  runTests' relJ
                  putStr "relL:  "
                  runTests' relL
                  putStr "relQ:  "
                  runTests' relQ
                  putStr "relT:  "
                  runTests' relT
