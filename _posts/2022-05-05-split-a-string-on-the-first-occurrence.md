---
title: Split a string on the first occurrence
tag: ruby
---

You can split a string on the first occurrence of pattern by setting the limit to 2

```ruby
"I am, a, string, of, many, many, commas".split(",", 2)
=> ["I am", " a, string, of, many, many, commas"]
```
