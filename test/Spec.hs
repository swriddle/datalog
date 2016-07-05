import Test.HUnit
import Test.Framework
import Test.Framework.Providers.HUnit

import Lib

simpleAssertion5 :: Assertion
simpleAssertion5 = number5 @=? 5

simpleAssertion4 :: Assertion
simpleAssertion4 = number4 @=? 4

main :: IO ()
main = defaultMain [testCase "5 is itself" simpleAssertion5
                  , testCase "4 is itself" simpleAssertion4]
