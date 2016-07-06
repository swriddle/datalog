import Test.HUnit
import Test.Framework
import Test.Framework.Providers.HUnit

import Lib

constantsContribute :: Assertion
constantsContribute = testConstantsContributeUniverse  @=? ["abc"]

variablesDoNotContribute :: Assertion
variablesDoNotContribute = testVariablesDoNotContributeUniverse @=? []

tupleUniverseRight :: Assertion
tupleUniverseRight = testTupleUniverse @=? ["abc", "xyz"]

main :: IO ()
main = defaultMain [testCase "universe contribution of 'abc' is ['abc']" constantsContribute
                  , testCase "universe contribution of 'X' is []" variablesDoNotContribute
                  , testCase "tuple universe is right" tupleUniverseRight]
