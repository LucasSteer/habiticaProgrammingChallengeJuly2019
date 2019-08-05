import Data.List.Split -- for splitOn

main = do
  problem <- getLine
  let elements = parseProblem problem
  print (solveProblem elements)

solveProblem elements =
  (let [left, op, right] = getElements elements in performOp left op right)

getElements parsedProblem =
  if parsedProblem!!2 == "by"
    then head parsedProblem : unwords (drop 1 (take 3 (take 4 parsedProblem))) : last parsedProblem : []
    else take 3 parsedProblem

parseProblem problem =
  splitOn " " (init (drop (length "What is ") problem))

performOp left op right =
  (getOperator op) (parseFloat left) (parseFloat right)

parseFloat str =
  read str :: Float

getOperator op
  | op == "plus" = (+)
  | op == "minus" = (-)
  | op == "multiplied by" = (*)
  | op == "divided by" = (/)