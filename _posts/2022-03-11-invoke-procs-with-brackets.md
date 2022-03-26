---
title: Invoke procs with brackets
tag: ruby
---

You can invoke a `<Proc (lambda)>` with brackets `Proc[]`:

```ruby
UriService = lambda do |username:, password:|
  def scream(n) n.upcase end

  "http://#{scream(username)}:#{password}@api.example.com"
end

UriService.call(username: "password", password: "123")
=> "http://PASSWORD:123@api.example.com"

UriService[username: "password", password: "123"]
=> "http://PASSWORD:123@api.example.com"

```
