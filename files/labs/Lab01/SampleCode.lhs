A sample Haskell module for courses at CSB|SJU.

Authors J. Andrew Whitford Holey and Lynn R. Ziegler, based on FirstLiterate.lhs
from Simon Thompson, The Craft of Functional Programming;
last modified August, 2015.
Tabs replaced with spaces September 5, 2016.

A function to square a number

>    square n = n * n


A function to double a number

>    double n =  2 * n


A function to compute the maximum of two numbers

>    max2a v1 v2
>        | v1 > v2    = v1
>        | otherwise  = v2

Here is another function to compute the maximum of two numbers

>    max2b v1 v2 = if (v1>v2) then v1 else v2


A recursive function to compute the largest common divisor of two integers

>    lcd m 0 = m
>    lcd 0 n = n
>    lcd m n = lcd n (mod m n)


A recursive function to apply a function to a list of arguments

>    applyIt f []    = []
>    applyIt f (x:l) = (f x):(applyIt f l)


A recursive function to apply a list of functions to an argument

>    applyThem [] x    = []
>    applyThem (f:l) x = (f x):(applyThem l x)


