# Ruby Toolbox

***subsets.rb / subsets_arr.rb***:
A custom method similar to the built in Combination method, but returns all subsets of an array if called without a *length* parameter like so:
**p test_array.subsets** or **p subsets(test_array)** (depending on which file is used)

or returns an array of subsets of a certain length if called WITH the *length* parameter, like so: 
**p test_array.subsets(1)** or **p subsets(test_array, 1)** (depending on which file is used)

These two files are different versions of the same thing, one is just the method itself, and one is tweaked to modify the Array class so it can be called on the array object itself.

