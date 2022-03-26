---
title: Client Connection Vars with Ecto
tag: elixir
---

Postgres has dozens of connection variables it will take, a couple of my favorite ones are `statement_timeout` and `application_name`.

Ecto takes a `parameters` connection option, which is a keyword list of connection parameters.

```elixir
# dev.exs

...

# Configure your database
config :myapp, Myapp.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "myapp_dev",
  socket_dir: "/var/run/postgresql",
  parameters: [application_name: "My App Development", statement_timeout: "5000"],
  pool_size: 10
```

### Example of `statement_timeout` being respected in Ecto:

```elixir
Ecto.Adapters.SQL.query!(Myapp.Repo, "select pg_sleep(86400)")

** (Postgrex.Error) ERROR 57014 (query_canceled): canceling statement due to statement timeout
    (ecto) lib/ecto/adapters/sql.ex:200: Ecto.Adapters.SQL.query!/5
```

*Client Connection Variables references:*
*[https://www.postgresql.org/docs/current/static/runtime-config-client.html](https://www.postgresql.org/docs/current/static/runtime-config-client.html)*
