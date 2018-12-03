Part 2:

Here is a Haskell function implementing the fibonacci function from its
definition in the lab writeup, using pattern matching

>    fibonacci :: (Eq a, Num a, Num a1) => a -> a1
>    fibonacci 0 = 1
>    fibonacci 1 = 1
>    fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

