---
title: "Introduction to Haskell"
---

## Objectives

* to become acquainted with the *ghci* Haskell environment
* to learn to use built-in Haskell programs
* to write a few simple Haskell programs

## Preliminaries

If you have not already done so, make a `CS239` directory in your Linux home
directory. Copy the directory
`/usr/people/classes/CS239/labs/Lab01_HaskellIntro` into your `CS239` directory.
Open a terminal window, and type `ghci` at the command prompt. You should see
something like the following:

```
GHCi, version 7.6.3: http://www.haskell.org/ghc/  :? for help
Loading package ghc-prim ... linking ... done.
Loading package integer-gmp ... linking ... done.
Loading package base ... linking ... done.
Prelude>
```

## Part 1: Using the *ghci* program

Type `:?` at the *ghci* prompt. You get a list of the *ghci* system commands,
all of which start with the `:` character. We will mostly be interested in the
first group, the commands available from the prompt.

Now let's try a few things. If we type something at the prompt that doesn't
start with `:`, the program tries to interpret it as Haskell code. Try entering
`5`.

You should get `5` back because `5` means 5 in Haskell. Now enter `5*5`. Do you
get what you expect? You should get `25` since `5*5` means 5 multiplied by 5 in
Haskell. Try entering a few more simple arithmetic expressions using both
integer and floating-point numbers. Note cases where the result is different
than you expect. How do you do integer division?

## Part 2: Using simple Haskell programs in *ghci*

Now let's see how we can develop programs in Haskell. Use the `:cd` command at
the *ghci* prompt to change into your `CS239/Lab01_HaskellIntro` directory. (If
you were already in this directory when you ran *ghci*, you can skip this
command.) The directory should contain the file `StarterCode.lhs`. You can
verify this by using the `:!` command to run the shell command `ls` thus: `:!
ls`. Similarly, `:! pwd` will tell you what directory you're currently in.

Open the file `StarterCode.lhs` in a text editor such as *gedit* so you can view
the Haskell code. Next, load the file into *ghci* using the command `:load
StarterCode.lhs`.

You should see a couple of lines of compiler messages followed by a new *ghci*
prompt: `*Main>`.

Notice that the file contains the definition of several Haskell functions. Try
the following commands to test one of these functions:

```
square 5
square 4.32
square -4.6
square (-4.6)
```

Why did `square -4.6` fail and `square (-4.6)` succeed?

Try the `double`, `max2a`, `max2b`, and `lcd` functions with various choices of
parameters. Based on what you learned using the square function, how should you
handle negative parameters with these other functions? Does the `lcd` function
work correctly for negative numbers? If not, any ideas on how to correct it?

## Part 3: Writing simple Haskell programs in *ghci*

Write a function called `fourth` that computes the fourth power of its argument
by calling `square` twice. Put the function in the same file with the sample
programs, and be sure to add comments as to what it does and that you are the
author of the function. Use the `:reload` command to compile and load your
changes into *ghci*. There are at least two different ways to do this, but note
that it may be necessary to use parentheses to make it work. Test your function
on both integer and floating-point arguments.

Write a function called `eighth` that computes the eighth power of its argument
by calling some combination of `square` and/or `fourth`. Again, there are
multiple ways to do this, and again, test your function on several arguments.

To exit from *ghci* type `:quit` at the prompt.

## Part 4: Evaluating expressions in Haskell

Consider computing one of the roots of a quadratic equation of the form:

* *ax*<sup>2</sup> + *bx* + *c* = 0

One of the roots has the value:

* (-*b* + √(*b*<sup>2</sup> - 4*ac*)) / 2*a*

In the text file, put Haskell code to bind the identifiers *a* = 1, *b* = -5,
*c* = 6, and *r* to a Haskell expression for the indicated root. Load or reload
the file into *ghci* and check the value of *r*; it should be 3.0. Now try the
same thing for some other values of *a*, *b*, and *c* by changing the values of
the variables in the file and reloading it. What happens if *b*<sup>2</sup> −
4*ac* is negative?

As you probably discovered, entering expressions by hand is not much fun,
particularly when the expressions get complicated. But that's what functions are
for! In the next section of the lab, we'll explore how to use functions in
Haskell.

## Part 5: Writing and using functions in Haskell

For the following sections, put any Haskell code you write in the file you have
been using already. Copy the results of interpreting the program as well as the
results of any required runs of the program from the terminal window into a
separate report document (text or Word). In Linux, you can do this by marking
the area in the terminal window and, then, *middle*-clicking at the place in the
report window where you want the result to go.

### Function 1: A function to evaluate a quadratic polynomial

To begin, enter your function and appropriate comments using the text editor on
`StarterCode.lhs`. When you are ready to try your function, save
`StarterCode.lhs` from your editor, and then type `:reload` at the *ghci*
command line (or `:load StarterCode.lhs` if you are starting again) to load the
current version of the `StarterCode.lhs` file with your new function. If you get
error messages you must fix the file and do `:reload` again.

Design a function `quadpoly`, which computes the value of a quadratic polynomial
for a particular value of *x*. It should take four parameters representing the
values of *a*, *b*, *c*, and *x* in the polynomial *ax*<sup>2</sup> + *bx* +
*c*. Use the `square` function from the pre-lab as part of your function. The
type of the new function is:

```
quadpoly :: Num a => a -> a -> a -> a -> a
```

Try your `quadpoly` function with several sets of values. Use it to evaluate the
polynomial *x*<sup>2</sup> + 1 at -2, 0, and 2 by typing `quadpoly 1.0 0.0 1.0
(-2.0)`, then `quadpoly 1.0 0.0 1.0 0.0` and `quadpoly 1.0 0.0 1.0 2.0`. (Why
are there parentheses around `-2.0` in the first call?)

Now define a function `poly1 x` that uses the `quadpoly` function to evaluate
the polynomial 3*x*<sup>2</sup> − 25*x* + 7. (Hint: define it with a call to
`quadpoly` and the appropriate coefficients.) Evaluate this polynomial for all
integer values from −5.0 to 5.0. You should find that the values change sign in
this region, indicating the presence of a root. (A *root* of a polynomial is an
x-value where the polynomial evaluates to zero.) Evaluate the polynomial at the
halfway point between the two values where the sign change occurs, and repeat
dividing the interval where the sign changes in half and evaluating the
polynomial at the halfway point until you have computed the value of x to three
digits of accuracy. (Note: you don't have to divide the interval exactly in
half. You can often make a closer estimate and get another digit in only two or
three calls to `poly1`.) Life shouldn't be this tedious; is there an easier way?

### Function 2: A function to evaluate a cubic polynomial

Implement a function `cubicpoly` that evaluates the cubic polynomial
*ax*<sup>3</sup> + *bx*<sup>2</sup> + *cx* + *d*. Implement a function `cube`
that cubes its argument as part of your strategy for `cubicpoly`. Define a
function `poly2` that uses the `cubicpoly` function to evaluate the polynomial
*x*<sup>3</sup> − 5.359375. Evaluate this polynomial for all integral values
from −5.0 to 5.0. Use the same method as for the `poly1` function to find a
root. (In this case, you should be able to find an exact root in only a few
steps.)

### Function 3: A function that uses a conditional structure

Define a Haskell function `triangle` that takes thee parameters *a*, *b*, and
*c* and computes whether a triangle with those side lengths is *equilateral*
(all three sides are equal), *isoceles* (two sides are equal), or *scalene* (all
three sides are different). You will need to use a conditional structure like
that in the `lcd` function with guard expressions that have compound conditions;
that is, you can combine simple conditions with the *andalso* operator (`&&` in
Haskell), the *orelse* operator (`||` in Haskell), and/or the `not` function.
Your function should return a *String* (same syntax as Java Strings) with the
appropriate result.

Test your function with several data sets (there are five different cases to
test, depending on which two or three of the parameters are equal).
