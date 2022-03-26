---
title: Split a string in elixir
tag: elixir
---

You can split a string in elixir with `String.split`

```elixir
defmodule Phoenix.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def up do
    execute_sql("""
      create extension citext;

      create table users (
        id bigint generated by default as identity primary key,
        email citext unique not null,
        inserted_at timestamptz not null default now(),
        updated_at timestamptz not null default now()
      );
    """)
  end

  def down do
    execute_sql("""
      drop table users;
      drop extension citext;
    """)
  end
   

  def execute_sql(sql_statements) do
     sql_statements
     |> String.split(";")
     |> Enum.filter(fn s -> String.trim(s) != "" end)
     |> Enum.each(&execute/1)
  end
end
```