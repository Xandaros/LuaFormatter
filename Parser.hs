module Parser where
import Text.ParserCombinators.Parsec

type Block = [Statement]

data Conditional = Conditional Expression Block -- Condition Body

data Statement = Assignment Bool [Var] [Expression] -- Local Name Value
               | While Conditional
               | Repeat Conditional
               | If Conditional [Conditional] (Maybe Conditional) -- If [elseif] (Maybe else)
               | Return Expression
               | Break
               | NumericFor (String, Expression) Expression (Maybe Expression) Block -- Var Limit Step Body
               | GenericFor [String] [Expression] Block

data Var = ListAccess Var Expression -- Name Index
         | Name String

data Expression = Nil
                | False
                | True
                | Number Double
                | Str String
                | FunctionDef String [String] Block -- Name Args Body
                | TableDef String [Expression] -- Name Values
                | Varargs
                | UnaryOperation UnaryOperator Expression
                | BinaryOperation BinaryOperator Expression Expression
                | FunctionCall Expression [Expression] -- Name Args

data FieldList = NameField String Expression
               | NumberField Integer Expression

data UnaryOperator = Negate
                   | Length

data BinaryOperator = Addition
                    | Subtraction
                    | Multiplication
                    | Division
                    | Modulo
                    | Exponentiation
                    | Equality
                    | Inequality
                    | Less
                    | Greater
                    | LessEquals
                    | GreaterEquals
                    | Or
                    | And
                    | Concatenation

block :: Parser Statement
block = many statement

statement :: Parser Statement
statement = undefined
