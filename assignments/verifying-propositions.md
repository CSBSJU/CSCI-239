---
title: "Verifying the truth of propositions"
---

This lab is an exercise using Haskell to evaluate propositional statements.

## Objectives

* to learn to use Haskell to evaluate propositional statements
* to learn to use and write Haskell functions that handle functions
* to gain experience with propositional logic

You will write several Haskell functions in this lab. You must include Haskell
type signatures for each function. (See the given code for examples of how the
type signatures are included.) However, you don't have to figure out the type
signature yourself; let Haskell do it for you. Implement and test each function
without the signature, then use the :type command to get the type signature and
add it to your function definition.

## Part 1

Write the following English sentences as propositional logic statements. As you
work, assign suitable variable names to simple propositions, such as using `br`
for "berries are ripe along the trail." Note that if you have both the positive
and negative of some proposition, you should assign a variable only to the
positive version and use the &not; operator with the positive variable to
express the negative.

* Berries are ripe along the trail, but grizzly bears have not been seen in the
  area. Possible answer: <code>br &and; &not;gbs</code>
* Grizzly bears have not been seen in the area, and hiking on the trail is safe,
  but berries are ripe along the trail.
* If berries are ripe along the trail, hiking is safe, if and only if grizzly
  bears have not been seen in the area.
* It is not safe to hike on the trail, but grizzly bears have not been seen in
  the area, and the berries along the trails are ripe.
* For hiking on the trail to be safe, it is necessary but not sufficient that
  berries not be ripe along the trail and that grizzly bears not have been seen
  in the area.
* Hiking is not safe on the trail whenever grizzly bears have been seen in the
  area and berries are ripe along the trail.

## Part 2

Construct a truth table for the following compound statement:

<code>
(p &rarr; q) &harr; (r &rarr; s)
</code>


## Part 3: Using Haskell to verify truth tables 
Make a truth table for each of the following propositional statements using
pencil and paper:

1. <code>&not;p &and; q &or; p &and; &not;q</code>
1. <code>p &or; &not;q &and; r</code>
1. <code>( p &or; q) &and; (&not;p &or; r)</code>
1. <code>( p &or; &not;q) &and; ( r &or; &not;s)</code>

Write a Haskell function equivalent to each of the propositions above, naming
the functions `prop3_1`, `prop3_2`, `prop3_3` and `prop3_4`, respectively.
Recall from Lab 1 that Haskell uses the orelse operator `||` to implement the
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

## Part 4: Adding &rarr; and &harr; to the mix
Haskell does not have built-in operators or functions for the implies (&rarr;)
or if and only if (&harr;) operations. Determine propositional statements
equivalent to these two logical operations, using only the &and;, &or;, and
&not; operations; simplify your propositions, if possible.

Write Haskell functions `implies` and `iff` that implement your
propositional statements. Use the `mapTruth2` function to verify that your
functions produce the correct truth values.

Now write a Haskell function that implements the proposition (p &rarr; q) &harr;
(r &rarr; s) from the Part 1, call the function `prop4_1`. Since `implies` and
`iff` are functions, not operators, you'll need to either use the function name
before its two parameters or enclose it in single back-quote characters (\`) to
convert it into an operator. For example, the proposition p &rarr; q could be
written as `implies p q` or as ``p `implies` q`` . Test the function using
`mapTruth4`, and compare the results to your truth table. Again, if the results
don't agree, determine why, and make any necessary correction to your truth
table and/or function.

## Part 5: Using propositional logic to solve a programming problem

Consider the problem of determining what you can see in the sky. Here are a few
hypotheses that help define the problem:

* It's always either day or night, but never both.
* It's always either clear or cloudy, but never both (to keep it simple).
* If it's cloudy, you can't see anything in the sky.
* If it's clear in the daytime, you can see the sun.
* If it's clear at night, you can see the stars.
* You can't see the stars during the day.
* You can't see the sun at night.

Assign variables as needed to entities in these propositions, using only one
variable for any two mutually exclusive entities, as you did in Part 1. Then
restate the conditions as logical propositions using the variables and the
appropriate operators; simplify the expressions, if possible. In particular, you
can potentially use propositions that represent *exclusive or* conditions to
eliminate variable. (If `a ↔ b` is a hypothesis, then you can replace the
variable `b` with `¬a`.) Make a truth table or Haskell function for any of the
expressions that contain more than one operator.

Write a Haskell function, named `predictSky`, that correctly returns a string
representing one the following four values, based on the current time and sky
conditions and the propositions above, using the smallest number of `Bool`
parameters possible:

1. You can see neither the sun nor any stars
1. You can see the sun, but not any stars
1. You can't see the sun, but you can see the stars
1. You can see both the sun and the stars

To reduce the number of parameters, make sure that you have only one variable
for any mutually exclusive conditions. Also, recall that Haskell strings are
written like Java strings using double quote characters.

Use the appropriate `mapTruth` function to test your function. (Note that the
`mapTruth` functions work, even when the final return value is not `Bool`, as
long as all the parameters are `Bool`.) Do you get the results you expected? Are
all four return values possible in the results? Did your logical analysis help
you program the function correctly?

## Testing your work
In your terminal execute the following command

```sh
cabal install hunit
```

Assuming the command completes with no errors, then from within your Haskell
interpreter, load the file `TestCode.hs`. If any of your functions were named
incorrectly, you will something along the lines of:

```
Prelude> :load TestCode.hs 
[1 of 2] Compiling StarterCode      ( StarterCode.lhs, interpreted )
[2 of 2] Compiling Main             ( TestCode.hs, interpreted )

TestCode.hs:9:14: Not in scope: `prop3_1'

TestCode.hs:13:14: Not in scope: `prop3_2'
.
.
.
```

Once you have loaded `TestCode.hs`, call the function `runTests`. This function
will execute a suite of tests to check the correctness of the code that you have
written. If any of your functions have been implemented incorrectly the test
function will report something like:

```
### Failure in: 6                         
function: prop4_1
expected: [False,False,True,True,False,True,False,False,True,False,True,True,True,False,True,True]
 but got: [True,False,True,True,False,True,False,False,True,False,True,True,True,False,True,True]
```

which tells you that there was an error in function `prop4_1`. The `expected:`
value is what your function *should* produce and the `but got:` value is what
your function *did* produce. Figure out why you are getting incorrect answers
and fix your function and run the test suite again.
