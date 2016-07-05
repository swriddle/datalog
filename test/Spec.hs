import Test.HUnit
import Test.Framework
import Test.Framework.Providers.HUnit

main :: IO ()
main = defaultMain [testCase "Successful test" simpleAssertion
                  , testCase "Failed test" wrongAssertion]
simpleAssertion :: Assertion
simpleAssertion = 5 @=? 5

wrongAssertion :: Assertion
wrongAssertion = 5 @=? 4

