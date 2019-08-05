# What is this?

This repository contains my solution for the [Habitica Programming Guild's July 2019 challenge](https://habitica.com/challenges/effd2f51-e4b1-4061-94bb-d91dc7a61f55).

For those that can't view the post, the basis of the challenge is:

>Write a program that is able to parse simple math word problems and outputs the answer.

Additional complexity is added by the need to handle large numbers, negative numbers, and multiple operations in a single statement (ignoring the usual order of operations, however).

# How to run it

* Clone this repository: `git clone https://github.com/LucasSteer/habiticaProgrammingChallengeJuly2019/blob/master/wordProblemParser.hs`
* Ensure that the split library is installed: `cabal v1-install split`
* Run GHCi: `ghci`
* Load the script: `:l wordProblemParser.hs`
* Run the main routine: `main`
* Enter any word problem

## Operation notes

The word problems must be formatted in the form "What is [# $ # ...]?" where:
`#` is any number (positive or negative, float or integer, large or small)
`$` is any operand (where `plus` -> `+`, `minus` -> `-`, `multiplied by` -> `*`, and `divided by` -> `/`)
`...` implies a repetition of the form `# $` (e.g. `5 plus 6 minus 7 divided by 2`)

Examples:
* `1 divided by 4` -> `0.25`
* `5 plus 6 minus 7 divided by -2` -> `-2.0`
* `3 plus 5.1` -> `8.1`

## A note about (the lack of) error checking and handling

This "parser" implements essentially no error checking or handling with the exception of `parseOperator` having an `otherwise` clause for catching unimplemented operators. These things were skipped so that I could spend more time thinking about the solution, but I would like to implement them in the future.

# To-dos

* Implement unit testing
* Implement error checking and handling
* Implement a simple replacement for `splitOn " "` to remove the dependency on `Data.List.Split`
* Investigate resolving the floating point "imperfections"
* Implement using more idiomatic Haskell
* Re-implement with a proper parser / lexer