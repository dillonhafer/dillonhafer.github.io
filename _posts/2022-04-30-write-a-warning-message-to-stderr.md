---
title: Write a warning message to $stderr
tag: ruby
---

While debugging, if you ever need to write to $stderr you might use `$stderr#puts`, but you can use `Warning#warn` which is better called from `Kernel`, because `Kernel` appends newlines and respects the `-W0` flag:

```ruby
$stderr.puts "you have been warned"
Warning.warn "you have been warned"
Kernel.warn "you have been warned"
warn "you have been warned"
```

Output:

```
you have been warned
you have been warnedyou have been warned
you have been warned
```
