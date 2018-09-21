---
title: Use a unix socket with Ecto
---

Ecto allows the use of a unix socket to connect to postgres, instead of TCP. In order to use a unix socket in a exs file, you should remove the `hostname` list item, and provide the `socket_dir` list item.

```elixir
# dev.exs

...

# Configure your database
config :myapp, Myapp.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "myapp_dev",
  socket_dir: "/var/run/postgresql",
  pool_size: 10

```
