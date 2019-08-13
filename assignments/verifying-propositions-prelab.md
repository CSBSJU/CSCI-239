---
title: "Verfiying the truth of propositions (Prelab)"
---

The pre-lab is a pencil and paper exercise.

## Objectives

* learn to use Haskell to evaluate propositional expressions
* to learn to use and write Haskell functions that handle functions
* to gain experience with propositional logic

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

Be prepared to show your pre-lab work at the beginning of lab.
