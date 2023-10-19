
# Data set for reproducing git-lfs lockable problem

## Steps to reproduce

`$ make`

## Problem

1. `git check-attr sub1/sub2/test2.txt` returns `lockable: set`, but git-lfs ignores this file in processing read-only flag.
2. Processing of _sub1/test1.txt_ has no problem
3. This problem does not occurs if move _sub1/.gitattributes_ to root directory
