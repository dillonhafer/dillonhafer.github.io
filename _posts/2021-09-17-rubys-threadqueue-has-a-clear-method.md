---
title: Ruby's Thread::Queue has a clear method
tag: ruby
---

Calling `#clear` on a `Thread::Queue` will remove all objects from that queue

```ruby
q = Queue.new
42.times { q << 1 }
q.size == 42
=> true

q.clear
q.size == 0
=> true

```
