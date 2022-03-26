---
title: pg_dump can dump foreign table schemas
tag: sql
---

`pg_dump` will dump foreign tables schemas, but not their data.

```sql
$ pg_dump -d db_with_foreign_tables
CREATE FOREIGN TABLE public.users (
  name text,
  ...
)
SERVER foreign_server_somewhere
OPTIONS (
  query 'select * from foreign_users'
);
```
