---
title: Pass keyword arguments when using send
tag: ruby
---

Don't use a hash, just pass send with a comma-separated list of keyword arguments:

```ruby
class Animal < Struct.new(:name)
  def greet(name:, catch_phrase:)
    puts "Heya #{name}! What's new, #{catch_phrase}?"
  end
end

Animal.new("Rex").send(:greet, name: "Dillon", catch_phrase: "cool cat")
=> "Heya Dillon! What's new, cool cat?"
```

Sending with a hash will fail:

```ruby
Animal.new("Rex").send(:greet, {name: "Dillon", catch_phrase: "cool cat"})
=> wrong number of arguments (given 1, expected 0; required keywords: name, catch_phrase) (ArgumentError)
```
