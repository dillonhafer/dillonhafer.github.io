---
title: Check if string starts with character
tag: sql
---

Check if string starts with character

In ruby I would use something like 
```ruby
"PostgreSQL".downcase.start_with?("p")
=> true
```

and the equivalent in a query would be:

```sql
select lower(left('PostgreSQL', 1)) = 'p';

 ?column?
----------
 t
(1 row)
```

and if you have the citext extension enabled you could do:

```sql
select left('PostgreSQL', 1)::citext = 'p';

 ?column?
----------
 t
(1 row)
```

Other things:
```sql
select *
from users
where left(display_name, 1)::citext = 'a'
;
```
