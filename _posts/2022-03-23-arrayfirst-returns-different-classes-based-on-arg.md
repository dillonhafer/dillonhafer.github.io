---
title: Array#first returns different classes based on arg
tag: ruby
---

Ruby's `Array#first` will have very different return types based on what arguments you provide. Without an argument, it will return `nil`  or `object`. With an argument, it will always return a new array; even if your argument is `1` or `0`.

```ruby
a = [:foo, 'bar', 2]
a.first 
# => :foo

a.first(1) 
# => [:foo]

a.first(0)
# => []
```

With an empty array:

```ruby
[].first
# => nil

[].first(1)
# => []

[].first(0)
# => []
```
