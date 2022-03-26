---
title: Wildcard prefix matching with tsquery
tag: sql
---

When performing full-text search in Postgres you can add `:*` to the end of a string to be searched:

```sql
select title from posts where title::tsvector @@ 'instr:*'::tsquery;
```

This will match any post that has a word in its title that starts with `instr`
