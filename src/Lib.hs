
module Lib
    ( universeAtom
    , byline
    , testConstantsContributeUniverse
    , testVariablesDoNotContributeUniverse
    , testTupleUniverse
    ) where

type VariableName = String
type ConstantName = String
type Universe = [ConstantName]
type PredicateName = String
type Tuple = (PredicateName, [Atom])

nameOfConstant :: Atom -> ConstantName
nameOfConstant (Constant constantName) = constantName

data Atom = Constant ConstantName
          | Variable VariableName

testConstantsContributeUniverse :: Universe
testConstantsContributeUniverse = universeAtom (Constant "abc")

testVariablesDoNotContributeUniverse :: Universe
testVariablesDoNotContributeUniverse = universeAtom (Variable "X")

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

universeTuple :: Tuple -> Universe
universeTuple tuple = map nameOfConstant (tupleConstants tuple) 

byline :: String
byline = "Datalog engine"
