---
title: Method names can have spaces
tag: ruby
---

Method names in ruby can have spaces, but you need to meta program them and call them with `#send`:

```ruby
class Greeter
  define_method("How are you today?") do
    "I'm doing well"
  end
end

Greeter.new.public_send("How are you today?")
=> "I'm doing well"
```
