---
title: Ruby has endless ranges
tag: ruby
---

You can access the last n characters of a string by using and endless range:

```ruby
credit_card = "1234•5678•7126•5555"
last_four = (-4..)
puts "Last four: #{credit_card[last_four]}"
```

```
=> Last four: 5555
```
