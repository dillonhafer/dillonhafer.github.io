---
title: Select first element from array_agg
tag: sql
---

It's as simple as:

```sql
select zip_code, (array_agg(company_name))[1]
from locations
group by zip_code
;

 zip_code |        array_agg
----------+--------------------------
 90210    | In-N-out
 46368    | Johnny's Round the Clock
(2 rows)
```

source:

```sql
create table locations (
  id bigint generated by default as identity primary key,
  zip_code text not null,
  company_name text not null
);

insert into locations (zip_code, company_name) values 
  ('46368', 'Johnny''s Round the Clock'),
  ('90210', 'In-N-out'),
  ('46368', 'Albanese Candy');
```
