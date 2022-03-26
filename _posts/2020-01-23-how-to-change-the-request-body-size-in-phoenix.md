---
title: How to change the request body size in Phoenix
tag: elixir
---

`Plug.Parsers` accepts a `length:` key with a value of approximate bytes to accept and can be used in an endpoint file.

```elixir
# endpoint.ex
plug Plug.Parsers,
  pasrsers: [:urlencoded, :multipart],
  length: 100_000_000 # 100 MB body size (approximately)
```

You can also configure the length for a specific parser:

```elixir
plug Plug.Parsers,
  parsers: [:urlencoded, {:multipart, length: 100_000_000}] # 100 MB body size (approximately)
```
