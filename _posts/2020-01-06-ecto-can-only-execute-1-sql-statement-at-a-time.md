---
title: Ecto can only execute 1 sql statement at a time
tag: elixir
---

Ecto can only ever execute 1 sql statement at a time, by design. For performance concerns, every statement is wrapped in a [prepared statement](https://www.postgresql.org/docs/current/sql-prepare.html)<br />**some "security" is a fringe benefit of prepare statements.*

In regards to the performance concerns of the prepared statement, PostgreSQL will force re-analysis of the statement when the objects in the statement have undergone definitional changes (DDL), making its use in a migration useless.

An example of a migration if you need to perform multiple statements:

```elixir
def up do
  execute("create extension if not exists \"uuid-ossp\";")
  execute("alter table schedules add column user_id uuid;")
  execute("create unique index on schedules (id, user_id);")
end

def down do
  execute("alter table schedules drop column user_id;")
  execute("drop extension if exists \"uuid-ossp\";")
end
```
