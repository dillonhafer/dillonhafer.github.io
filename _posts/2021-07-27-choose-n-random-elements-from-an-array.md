---
title: Choose n random elements from an array
tag: ruby
---

Ruby's `Array#sample` method can take an unnamed argument to return more than one random element.

```ruby
%w[a b c].sample(2)
=> ["a", "c"]
```
