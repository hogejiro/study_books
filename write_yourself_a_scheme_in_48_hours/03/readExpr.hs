import Text.ParserCombinators.Parsec
import System.Environment
import Control.Monad
import Numeric
import Data.Char hiding (isNumber)
import Data.Ratio
import Data.Complex
import Data.Array

symbol :: Parser Char
symbol = oneOf "!$%&|*+-/:<=>?@^_~"

spaces1 :: Parser ()
spaces1 = skipMany1 space

readExpr :: String -> LispVal
readExpr input = case parse parseExpr "lisp" input of
    Left  err -> String $ "No match:" ++ show err
    Right val -> val

data LispVal = Atom String
            | Vector (Array Int LispVal)
            | List [LispVal]
            | DottedList [LispVal] LispVal
            | Number Integer
            | Float Double
            | String String
            | Bool Bool
            | Character Char
            | Ratio Rational
            | Complex (Complex Double)

showVal :: LispVal -> String
showVal (List contents)        = "(" ++ unwordsList contents ++ ")"
showVal (DottedList head tail) = "(" ++ unwordsList head ++ "." ++ showVal tail ++ ")"
showVal (String contents)      = "\"" ++ contents ++ "\""
showVal (Atom name)            = name
showVal (Number contents)      = show contents
showVal (Bool True)            = "#t"
showVal (Bool False)           = "#f"

unwordsList :: [LispVal] -> String
unwordsList = unwords . map showVal

instance Show LispVal where show = showVal

escapedChars :: Parser Char
escapedChars = do c <- char '\\' >> oneOf "\\\"nrt"
                  return $ case c of
                    'n' -> '\n'
                    'r' -> '\r'
                    't' -> '\t'
                    _   -> c

parseString :: Parser LispVal
parseString = do char '"'
                 x <- many (noneOf "\"" <|> escapedChars)
                 char '"'
                 return $ String x

-- variable
parseAtom :: Parser LispVal
parseAtom = do
    first <- letter <|> symbol
    rest  <- many (letter <|> digit <|> symbol)
    return $ Atom (first:rest)

parseComplex :: Parser LispVal
parseComplex = do
    realPart <- try parseFloat <|> parseNumber
    spaces >> char '+' >> spaces
    imagPart <- try parseFloat <|> parseNumber
    char 'i'
    return $ Complex ((toDouble realPart) :+ (toDouble imagPart))
        where toDouble (Float  f) = f
              toDouble (Number n) = fromIntegral n

parseFloat :: Parser LispVal
parseFloat = do
    integerPart <- many1 digit
    char '.'
    fractionalPart <- many1 digit
    return $ Float (fst . head $ readFloat (integerPart ++ "." ++ fractionalPart))

parseRational :: Parser LispVal
parseRational = do
    numerator <- many1 digit
    spaces >> char '/' >> spaces
    denominator <- many1 digit
    return $ Ratio ((read numerator) % (read denominator))

parseNumber :: Parser LispVal
parseNumber = do
    num <- parseInt <|> parseDecimal <|> parseHex <|> parseOct <|> parseBin
    return num

parseInt :: Parser LispVal
parseInt = do
    int <- many1 digit
    return $ (Number . read) int

parseDecimal :: Parser LispVal
parseDecimal = do
    try $ string "#d"
    int <- many1 digit
    return $ (Number . read) int

parseHex :: Parser LispVal
parseHex = do
    try $ string "#x"
    hex <- many1 hexDigit
    return $ Number (hex2dig hex)

hex2dig x = fst $ head $ readHex x

parseOct :: Parser LispVal
parseOct = do
    try $ string "#o"
    oct <- many1 octDigit
    return $ Number (oct2dig oct)

oct2dig x = fst $ head $ readOct x

parseBin :: Parser LispVal
parseBin = do
    try $ string "#b"
    bin <- many1 (oneOf "01")
    return $ Number (bin2dig bin)

bin2dig bs = toInteger $ foldr (\x y -> x + y * 2) 0 (map c2i bs)
            where c2i n = ord n - 48

parseBool :: Parser LispVal
parseBool = do
    char '#'
    b <- oneOf "tf"
    return $ case b of
        't' -> Bool True
        'f' -> Bool False

parseCharacter :: Parser LispVal
parseCharacter = do
    try $ string "#\\"
    char <- try (string "newline" <|> string "space") <|> do { x <- anyChar; notFollowedBy alphaNum; return [x] }
    return $ Character $ case char of
        "space"   -> ' '
        "newline" -> '\n'
        _         -> (char !! 0)

parseQuoted :: Parser LispVal
parseQuoted = do
    char '\''
    x <- parseExpr
    return $ List [Atom "quote", x]

parseQuasiQuoted :: Parser LispVal
parseQuasiQuoted = do
    char '`'
    quoted <- parseExpr
    return $ List [Atom "quasiquote", quoted]

parseUnQuote :: Parser LispVal
parseUnQuote = do
    char ','
    unquoted <- parseExpr
    return $ List [Atom "unquote", unquoted]

parseVector :: Parser LispVal
parseVector = do arrayValues <- sepBy parseExpr spaces
                 return $ Vector (listArray (0, (length arrayValues - 1)) arrayValues)

parseList :: Parser LispVal
parseList = do
    char '(' >> spaces
    head <- parseExpr `sepEndBy` spaces1
    do char '.' >> spaces1
       tail <- parseExpr
       spaces >> char ')'
       return $ DottedList head tail
       <|> do spaces >> char ')'
              return $ List head

parseExpr :: Parser LispVal
parseExpr = parseAtom
        <|> parseString
        <|> try parseComplex
        <|> try parseFloat
        <|> try parseRational
        <|> try parseNumber
        <|> try parseBool
        <|> try parseCharacter
        <|> try parseQuoted
        <|> try parseQuasiQuoted
        <|> try parseUnQuote
        <|> try (do string "#("
                    vector <- parseVector
                    char ')'
                    return vector)
        <|> try parseList

eval :: LispVal -> LispVal
eval val @ (String _) = val
eval val @ (Number _) = val
eval val @ (Bool   _) = val
eval (List [Atom "quote", val]) = val
eval (List (Atom func : args))  = apply func $ map eval args

apply :: String -> [LispVal] -> LispVal
apply func args = maybe (Bool False) ($ args) $ lookup func primitives

primitives :: [(String, [LispVal] -> LispVal)]
primitives = [("+",              numericBinop (+)),
              ("-",              numericBinop (-)),
              ("*",              numericBinop (*)),
              ("/",              numericBinop div),
              ("mod",            numericBinop mod),
              ("quotient",       numericBinop quot),
              ("remainder",      numericBinop rem),
              ("atom?",          unaryOp isAtom),
              ("string?",        unaryOp isString),
              ("number?",        unaryOp isNumber),
              ("bool?",          unaryOp isBool),
              ("list?",          unaryOp isLisp),
              ("symbol->string", unaryOp symbol2string),
              ("string->symbol", unaryOp string2symbol)]

numericBinop :: (Integer -> Integer -> Integer) -> [LispVal] -> LispVal
numericBinop op params = Number $ foldl1 op $ map unpackNum params

unpackNum :: LispVal -> Integer
unpackNum (Number n) = n
unpackNum (String n) = let parsed = reads n in
                        if null parsed
                            then 0
                            else fst $ parsed !! 0
unpackNum (List [n]) = unpackNum n
unpackNum _ = 0

unaryOp :: (LispVal -> LispVal) -> [LispVal] -> LispVal
unaryOp f [v] = f v

isAtom :: LispVal -> LispVal
isAtom (Atom _) = Bool True
isAtom _        = Bool False

isString :: LispVal -> LispVal
isString (String _) = Bool True
isString _          = Bool False

isNumber :: LispVal -> LispVal
isNumber (Number _) = Bool True
isNumber _          = Bool False

isBool :: LispVal -> LispVal
isBool (Bool _) = Bool True
isBool _        = Bool False

isList :: LispVal -> LispVal
isList (List _)       = Bool True
isList (DottedList _) = Bool True
isList _              = Bool False

symbol2string :: LispVal -> LispVal
symbol2string (Atom s) = String s
symbol2string _        = String ""

string2symbol :: LispVal -> LispVal
string2symbol (String s) = Atom s
string2symbol _          = Atom ""

main :: IO ()
main = getArgs >>= print . eval . readExpr . head
