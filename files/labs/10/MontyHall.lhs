Haskell Simulation of the Monte Hall problem

The selectDoor* and selectSwitch* functions are by J. A. Whitford Holey,
December 7, 2015.
The remaining code is by __________________________
(working with _______________________).

>   import System.Random

******* The following four functions are utility functions   *******
******* needed to support the two functions below them.      *******
******* You don't need to understand the code of these four. *******

The selectDoorGen function returns a tuple containing pseudo-random Int,
selected from { 1, 2, 3 } and a new generatpr, using the specified generator.

>   selectDoorGen :: RandomGen rg => rg -> (Int, rg)
>   selectDoorGen gen = 
>     let (num, newGen) = random gen
>     in  (num `mod` 3 + 1, newGen)

The selectDoorsGen function returns an infinite list pseudo-random Ints,
selected from { 1, 2, 3 }, using the specified generator.

>   selectDoorsGen :: RandomGen rg => rg -> [Int]
>   selectDoorsGen gen =
>     let (num, newGen) = selectDoorGen gen
>         rest          = selectDoorsGen newGen
>     in  num : rest

The selectSwitchGen function returns a tuple containing a pseudo-random Bool
and a new generator, using the specified generator.

>   selectSwitchGen :: RandomGen rg => rg -> (Bool, rg)
>   selectSwitchGen gen = random gen

The selectSwitchesGen function returns an infinite list pseudo-random Bools,
using the specified generator.

>   selectSwitchesGen :: RandomGen rg => rg -> [Bool]
>   selectSwitchesGen gen =
>     let (switch, newGen) = selectSwitchGen gen
>         rest          = selectSwitchesGen newGen
>     in  switch : rest



******* Use the following two functions to generate            *******
******* random lists of door numbers or switches.              *******
******* Use different seed values to generate different lists. *******

The selectDoors function returns a list of n pseudo-random Ints,
selected from { 1, 2, 3 }, using the specified seed.

>   selectDoors :: Int -> Int -> [Int]
>   selectDoors n seed = take n (selectDoorsGen (mkStdGen seed))


The selectSwitches function returns a list of n pseudo-random Bools,
selected from { 1, 2, 3 }, using the specified seed.

>   selectSwitches :: Int -> Int -> [Bool]
>   selectSwitches n seed = take n (selectSwitchesGen (mkStdGen seed))

