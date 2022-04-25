---
title: Avoid time discrepancies when benchmarking
tag: ruby
---

You can avoid time discrepancies due to gc and allocs by using `Benchmark#bmbm`:

```ruby
require 'benchmark'
array = (1..1000000).map { rand }
Benchmark.bmbm do |x|
  x.report("sort!") { array.dup.sort! }
  x.report("sort")  { array.dup.sort  }
end
```
```
Rehearsal -----------------------------------------
sort!   1.490000   0.010000   1.500000 (  1.490520)
sort    1.460000   0.000000   1.460000 (  1.463025)
-------------------------------- total: 2.960000sec
            user     system      total        real
sort!   1.460000   0.000000   1.460000 (  1.460465)
sort    1.450000   0.010000   1.460000 (  1.448327)

```
