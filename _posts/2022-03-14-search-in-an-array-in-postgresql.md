---
title: Search in an array in PostgreSQL
tag: sql
---

You can search in a an array by using the `ANY` function:

```sql
create table numbers as 
  select * from (
    values 
      (1, array[1,2]), 
      (2, array[2,3,4]), 
      (3, array[4,5,6])
  )
as numbers(id, positions);

select *
from numbers
where 4 = any(positions);
```

```
 id | positions
----+-----------
  2 | {2,3,4}
  3 | {4,5,6}
(2 rows)
```
