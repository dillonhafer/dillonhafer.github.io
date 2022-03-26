---
title: Rails/PG Statement Timeout 🐘⏰
tag: ruby
---

By default, Rails does not set a timeout on database statements. For example, this will run for a full day, even if your ruby process goes away.

```ruby
ActiveRecord::Base.connection.execute(<<~SQL)
  select pg_sleep(86400);
SQL
```
The good news is that Rails provides a way to prevent this from happening from the `database.yml` with the `statement_timeout` variable.

```yml
default: &default
  adapter: postgresql
  ...
  variables:
    statement_timeout: 5000

```

I'm starting to think that this should always be set low. And then explicitly set higher on a per-query basis, when one is expecting something to take a long time.
