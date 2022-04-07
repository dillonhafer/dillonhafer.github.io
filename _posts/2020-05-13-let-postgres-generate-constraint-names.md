---
title: Let Postgres generate constraint names
tag: sql
---

Postgres can automatically generate constraint names if you omit the word constraint:

```sql
alter table users
  add foreign key (location_id) references locations;

alter table users
  add unique (email);
