
module Lib
    ( universeAtom
    , byline
    , testConstantsContributeUniverse
    , testVariablesDoNotContributeUniverse
    , testTupleUniverse
    , testUniverseBody
    ) where

import qualified Data.List (nub)

type VariableName = String
type ConstantName = String
type Universe = [ConstantName]
type PredicateName = String
type Tuple = (PredicateName, [Atom])
type Literal = (Bool, Tuple)
type Body = [Literal]
type Head = Tuple
data Rule = Fact Tuple
          | ComplexRule Head Body

nameOfConstant :: Atom -> ConstantName
nameOfConstant (Constant constantName) = constantName

data Atom = Constant ConstantName
          | Variable VariableName

testConstantsContributeUniverse :: Universe
testConstantsContributeUniverse = universeAtom (Constant "abc")

testVariablesDoNotContributeUniverse :: Universe
testVariablesDoNotContributeUniverse = universeAtom (Variable "X")

testUniverseBody :: Universe
testUniverseBody = universeBody [(True, ("f", [Constant "abc", Variable "X"])),
                                 (True, ("g", [Constant "def", Variable "Y"])),
                                 (False, ("f", [Variable "X", Variable "Y"]))]

testTupleUniverse :: Universe
testTupleUniverse = universeTuple ("pred", [(Constant "abc"), (Variable "X"), (Constant "xyz"), (Variable "Y")])

universeAtom :: Atom -> Universe
universeAtom (Constant constant) = [constant]
universeAtom (Variable variable) = []

isConstant :: Atom -> Bool
isConstant (Constant _) = True
isConstant (Variable _) = False

tupleConstants :: Tuple -> [Atom]
tupleConstants (predName, atoms) = filter isConstant atoms

universeLiteral :: Literal -> Universe
universeLiteral (_, tuple) = universeTuple tuple

universeBody :: Body -> Universe
universeBody literals = foldr (++) [] (map universeLiteral literals)

--universeRule :: Rule -> Universe
--universeRule (Fact tuple) = universeTuple tuple
--universeRule (ComplexRule tuple [literal]) = Data.List.nub $ (universeTuple tuple) ++ (universe

universeTuple :: Tuple -> Universe
universeTuple tuple = map nameOfConstant (tupleConstants tuple) 

byline :: String
byline = "Datalog engine"
