---
title: Ruby Struct can use keyword arguments
tag: ruby
---

> If the optional `keyword_init` keyword argument is set to true, `.new` takes keyword arguments instead of normal arguments

```ruby
ApiResponse = Struct.new(:ok, :error, keyword_init: true) { alias_method :ok?, :ok }

response = ApiResponse[ok: true, error: nil]
puts response.ok?
=> true
```
