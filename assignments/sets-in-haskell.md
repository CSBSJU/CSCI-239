---
title: "Sets in Haskell"
---

This lab will explore data structures in Haskell. It will introduce modules as a
way to encapsulate code in files. Students will implement a Set data structure
along with associated functions.

## Objectives

* to gain experience writing Haskell modules and data structures
* to explore the implementation of a computational model of a mathematical
  structure

## Part 1: Haskell modules

Like most modern languages, Haskell has facilities for encapsulating code into
coherent packages to facilitate reuse in other contexts. The Haskell *module* is
similar to a Java class, but also has features of a Java package. Look at the
`StarterCode.lhs` file. After the initial heading material, its Haskell code
begins with a module declaration that consists of the keyword module, the module
name (`StarterCode`), a list (in parentheses) of the items exported from the
module, and the keyword `where`. Everything after this in the file defines the
exported items in Haskell code.

Now compare this to the file `TestCode.hs`. This file is also a module
definition, as you can see from the first Haskell code. The `TestCode` module,
however, doesn't export anything, because it doesn't implement anything that's
likely to be of use anywhere else. It does import the `StarterCode` module, and
so everything exported by the `StarterCode` module is visible to the `TestCode`
module, which makes sense, since the purpose of the `TestCode` module is to test
the `StarterCode` module.

In this lab, you will be developing code in the `StarterCode` module, and using
the `TestCode` module to test your code (so you don't have to keep typing those
tests over and over). To use the `TestCode` module, you just load it in *ghci*
as you would any other Haskell file, and since the `StarterCode` module is
imported, you now have access to the code in both files. In fact, importing
modules into other files is the only way to have access to more than one Haskell
file at a time in *ghci*.

## Part 2: Testing a module with stub functions and a test suite

Load the file `TestCode.hs` into ghci. Oh! No! A bunch of error messages! The
first one is a *"The type signature for 'isSubsetOf' lacks an accompanying
binding"* in line 62 of `StarterCode.lhs`. If you look at line 62, you will see that it contains an incomplete function definition, because it's going to
be your job to complete this function and several others. In order to begin
testing code as you implement it, rather than waiting to test everything until
the end, we need to have everything implemented. Wait! This sounds like a
contradiction! We want to test before we implement, but we can't test until
after we implement. The solution is to use stub implementations.

A *stub implementation* is an implementation that does not seek to compute the
correct result, but does behave as if it were doing so. For a function (which is
all we have in Haskell), a stub implementation is just to set up some dummy
parameters and then return a value (any value) of the correct type. For example,
we need a stub implementation of the `isSubsetOf` function; the definition
`isSubsetOf s1 s2 = False` fills the bill; it doesn't actually tell whether *s1*
is a subset of *s2* or not; it just says "No." Try putting this definition in,
and verify that you no longer get the error in line 62.

Now put stub implementations in all the other functions that have fill in the
blank comments. (You may want to keep the comments to identify the places you
need to go back and finish.) Each stub implementation is a one-line definition
with dummy parameters (variables rather than patterns) and a dummy return value
such as `False` for `Bool`, `0` for a number, and `empty` where a set is
returned. If you do this correctly, you should be able to load the file without
syntax errors. Keep at it until you can.

Once the file loads without errors, you can begin testing. At this point, the
only things you can really test are the parts you've been given, which have
already been tested. Try the `runTests' singleton` and the `runTests' fromList`
functions. These two tests test the construction of a `Set` from a single
element as well as the construction of a `Set` given a list of elements.

Note: There are several tests in the `TestCode.hs` file, and they are intended
to be fairly thorough, but they are not exhaustive. If you feel there are
important test cases that have not been included, feel free to add more of your
own, but please leave the ones that are there to help verify your
implementations. Please bring any problems with the test file to the
instructor's attention so the file can be improved.

## Part 3: Completing the `StarterCode` module

If you have not already done so, put your name and today's date in place of line
three of the `StarterCode.lhs` file. Since you will be implementing some of the
code, you can claim some of the authorship credit.

### `size` function

The `size` function, around line 72, in the file will be your starting point for
implementing the rest of the set functions. It also happens to be the easiest of
the functions to implement. Note the type signature, which says that the
functions `size`, takes one parameter of type `Set a`, and it returns an `Int`.
Here the `a` is a type variable and is *unconstrained*, meaning it takes a set
of any type! The size of the set is the same as the length of the internal list,
so we take advantage of that equivalence with a pattern for the parameter
consisting of the set constructor and its associated list. The function is then
defined to be the length of the list part of the parameter pattern.

With `TestCode.hs` loaded, try the `runTests' size` function; it should
report 0 errors and 0 failures. Each of the subsequent set functions have and
associated set of tests which can be executed, isolated from the other tests, by
running the function `runTests'` with the name of the set function.

### `member` function

The first function you need to implement is the `member` function on about line
67 of the file. Use the type signature to work out the function parameters. The
function takes two parameters: the element to search for and the set of elements
to search. Since the return value is `True` when the search element is in the
internal list of the set, you need a pattern again for the set parameter. (Hint:
Haskell has a function, `elem`, that determines whether a value is an element of
a list.) Once you get the syntax right for this function, you can use the
`runTests' member` function to determine if it is working right.

### `isSubsetOf` function

The next function you need to implement is the `isSubsetOf` function. Recall the
definition of subset (⊆). *A* ⊆ *B*, if all elements of *A* are also elements of
B. There are many ways to go about solving this problem, but we will focus on
two. The first is the recursive solution. Consider the following function:

```lhs
> isSubsetOf (Set (x:xs)) b = ...
```

In this case, you could ask a question like, is the first element of the first
set, i.e., *x*, a member of the second set, by saying

```lhs
> x `member` b
```

Given that, then we could define `isSubsetOf` recursively by saying *A* is a
subset of *B* if *A*'s first element is a mebmer of *B* AND a new set,
containing all elements of *A* except the first, is also a subset of *B*.

A second approach, would be to create an auxilliary list, where each value is
the status of whether or not the corresponding element of *A* is a member of
*B*. With this list constructed, *A* is a subset of *B* if all values in the list are `True`. In Haskell it is easy to determine if all values of a list are `True` using the built-in function `and`. For example:

```lhs
Prelude> and [True, True, True]
Prelude> True
Prelude> 
Prelude> and [True, False, True]
Prelude> False
```

### `cartesianProduct`, `intersection`, `difference` functions

Each of these functions should be implemented based on their defintion. Feel
free to implement using any Haskell constructs that we have encountered, i.e.,
*list comprehensions*, *recursion*, the myriad functions like `elem`, etc.

### `union` function

The definition of the union of two sets is a set containing all the elements of
either of the two existing sets. Such a definition is descriptive, consise, and
useful conceptually. However, such a definition may be hard to translate into
Haskell.

Another way to describe the union of two sets is all of the elements of *A*,
that are not in *B* (hmmm... what does that sound like) plus, all of the
elements of *B*.

Choose whichever defintion you like, or define your own (as long as it is still
set union) to implement `union` in Haskell.

