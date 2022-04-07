---
title: Use created_at in Ecto
tag: elixir
---

You can use `created_at` in Ecto/phoenix app with `timestamps/1`. When migrating data from a rails application to a phoenix application you will have many tables with a `created_at` column. 

```elixir
defmodule Phoenix.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true, redact: true
    field :hashed_password, :string, redact: true
    field :confirmed_at, :utc_datetime

    timestamps(inserted_at: :created_at, type: :utc_datetime)
  end

end
```
