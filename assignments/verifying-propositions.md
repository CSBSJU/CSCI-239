---
title: "Verfiying the truth of propositions"
---

This lab is an exercise using Haskell to evaluate propositional expressions.

## Objectives

* to learn to use Haskell to evaluate propositional expressions
* to learn to use and write Haskell functions that handle functions
* to gain experience with propositional logic

You will write several Haskell functions in this lab. You must include Haskell
type signatures for each function. (See the given code for examples of how the
type signatures are included.) However, you don't have to figure out the type
signature yourself; let Haskell do it for you. Implement and test each function
without the signature, then use the :type command to get the type signature and
add it to your function definition.

## Part 1: Using Haskell to verify truth tables 
Make a truth table for each of the following propositional expressions using
pencil and paper:

1. <code>&not;p &and; q &or; p &and; &not;q</code>
1. <code>p &or; &not;q &and; r</code>
1. <code>( p &or; q) &and; (&not;p &or; r)</code>
1. <code>( p &or; &not;q) &and; ( r &or; &not;s)</code>

Write a Haskell function equivalent to each of the expressions above. Recall
from Lab 1 that Haskell uses the orelse operator `||` to implement the
mathematical operator &or;, it uses the andalso operator `&&` to implement the
mathematical operator &and;, and it uses the `not` function to implement &not;.
Now use the appropriate supplied Haskell function *mapTruth2*, *mapTruth3*, or
*mapTruth4* to determine the truth values for each of your functions. (The
number of the *mapTruth* function indicates how many arguments the corresponding
function takes. For example, if you call your first function *f1*, which has two
parameters *p* and *q*, you can type `mapTruth2 f1` to get a list of
truth-values for the function in truth table order. It is not necessary for you
to understand how the *mapTruth* functions work at this stage.)

Compare the values your function returned to your truth tables. If the values
are different for any function, determine why, revising the table and/or
function until they agree. Does this agreement guarantee that you have done the
table and function correctly? Why or why not?

## Part 2: Adding &rarr; and &harr; to the mix
Haskell does not have built-in operators or functions for the implies (&rarr;)
or if and only if (&harr;) operations. Determine propositional expressions
equivalent to these two logical operations, using only the &and;, &or;, and
&not; operations; simplify your expressions, if possible.

Write Haskell functions *implies* and *ifAndOnlyIf* that implement your
propositional expressions. Use the *mapTruth2* function to verify that your
functions produce the correct truth values.

Now write a Haskell function that implements the expression (p &rarr; q) &harr;
(r &rarr; s) from the pre-lab exercise. Since *implies* and *ifAndOnlyIf* are
functions, not operators, you'll need to either use the function name before its
two parameters or enclose it in single back-quote characters (\`) to convert it
into an operator. For example, the expression p &rarr; q could be written as
`implies p q` or as ``p `implies` q`` . Test the function using *mapTruth4*,
and compare the results to your truth table. Again, if the results don't agree,
determine why, and make any necessary correction to your truth table and/or
function.
