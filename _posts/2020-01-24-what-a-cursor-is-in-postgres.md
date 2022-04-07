---
title: What a cursor is in postgres
tag: sql
---

SQL has a structure called a `CURSOR` that, according to the docs:

> Rather than executing a whole query at once, read the query result a few rows at a time

This is mainly for solving memory usage issues, but probably not very applicable to web applications. Here's an example syntax to periodically fetch a limited amount of rows:

```sql
begin;
declare posts_cursor cursor for select * from posts;
fetch 10 from posts_cursors;
fetch 10 from posts_cursors;
commit;
```

This is not advised due to leaving a transaction open, but a simple example. More powerful use cases would be iterating a query in a function for updating a small amount of records at a time.
