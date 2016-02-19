# Apple Thief
A project that demonstrates the execution of the unbounded and basic Knapsack Problem. The theme of the app is comically centered on robbing an Apple store. Based on which bag, the priorities of the items that you'd like to steal, and the algorithm you choose, a table showing you projected bounty is generated.

Users can mix and match variables to see how it affects the outcome of their bounty a.k.a. the result of the knapsack problem. The most interesting code to look at is the two variations of the problem.
* `app/models/knapsack.` - the basic variation.
* `app/models/knapsack_unbound.rb` - the unbound variation.

### The Problem
The knapsack problem or rucksack problem is a problem in combinatorial optimization: Given a set of items, each with a mass and a value, determine the number of each item to include in a collection so that the total weight is less than or equal to a given limit and the total value is as large as possible. It derives its name from the problem faced by someone who is constrained by a fixed-size knapsack and must fill it with the most valuable items. The knapsack problem is a dynamic programming problem.
