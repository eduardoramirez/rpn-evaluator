RPN Evaluator README
===================

## Problem
Implement a RPN evaluator in Ruby. It should be able to evaluate the following strings and answer with the corresponding numbers:
  - "1 2 +" = 3
  - "4 2 /" = 2
  - "2 3 4 + *" = 14
  - "3 4 + 5 6 + *" = 77
  - "13 4 - " = 9

And should provide an error message for the following types of errors
  - "1 +" (not enough arguments)
  - "a b +" (invalid number)

We should be able to evaluate a string from the command line in the following way:

    ruby rpn.rb "1 2 +"


## Summary
This my solution to the Indiegogo coding assignment. I created a stack to obfusciate the additional functionality of an Array. In additon, I created my own atoi and atof. The program evaluates an RPN expression and prints the solution to stdout. It is ran from rpn.rb. 


## Usage

    ruby rpn.rb "1 2 +"


## Version of ruby

    ruby 2.0.0p481 (2014-05-08 revision 45883)
