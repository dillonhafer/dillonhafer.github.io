---
title: Add primary key to table
tag: sql
---

You can add a primary key to a table with alter an alter table statement:

Table with no primary key:
```sql
create table no_pks (id int generated by default as identity not null);
insert into no_pks select from generate_series(0,999);
```
```
[local] dillon@dillon=# \d no_pks
                           Table "public.no_pks"
 Column |  Type   | Collation | Nullable |             Default
--------+---------+-----------+----------+----------------------------------
 id     | integer |           | not null | generated by default as identity
```

You can add it later:
```sql
alter table no_pks add primary key (id);
```
```
[local] dillon@dillon=# \d no_pks
                           Table "public.no_pks"
 Column |  Type   | Collation | Nullable |             Default
--------+---------+-----------+----------+----------------------------------
 id     | integer |           | not null | generated by default as identity
Indexes:
    "no_pks_pkey" PRIMARY KEY, btree (id)
```
