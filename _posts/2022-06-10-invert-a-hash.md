---
title: Invert a hash
tag: ruby
---

`Hash#invert` returns a new Hash object with the each key-value pair inverted:

```ruby
{first: 1, last: 2}.invert
=> {
  1 => :first,
  2 => :last
}
```

```ruby
{first: 1, last: 2}.invert[2]
=> :last
```
