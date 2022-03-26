---
title: character_length string function
tag: sql
---

Postgres has a `character_length` string function. I found this useful in check constraint scenarios:

```
create table addresses (
  id serial primary key,
  state text not null default 'AL' check (character_length(state) = 2)
);
```

[https://www.postgresql.org/docs/current/static/functions-string.html](https://www.postgresql.org/docs/current/static/functions-string.html)
