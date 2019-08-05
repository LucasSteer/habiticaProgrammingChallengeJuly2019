import Data.List.Split -- for splitOn

main = do
  problem <- getLine
  let elements = parseProblem problem
  print (solveProblem elements)

solveProblem [left, op, right] = performOp left op right
solveProblem elements =
  solveProblem (solveSubProblem elements)

solveSubProblem elements =
  show (solveProblem (exceptLastTwo elements)) : (lastTwo elements)

exceptLastTwo list =
  take (length list - 2) list

lastTwo list =
  drop (length list - 2) list

parseProblem problem =
  filter (/= "by") (splitOn " " (init (drop (length "What is ") problem)))

performOp left op right =
  (parseOperator op) (parseFloat left) (parseFloat right)

parseFloat str =
  read str :: Float

parseOperator op
  | op == "plus" = (+)
  | op == "minus" = (-)
  | op == "multiplied" = (*)
  | op == "divided" = (/)
  | otherwise = error "wordProblemParser error - unknown operand"