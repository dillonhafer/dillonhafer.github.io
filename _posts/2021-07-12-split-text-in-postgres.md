---
title: Split text in postgres
tag: sql
---

You can split text in postgres

```sql
select email from users;
```
```
bob@example.com
mary@example.com
```
```sql
select split_part(email, '@', 1) from users;
```
```
bob
mary
```
```sql
select split_part(email, '@', 2) from users;
```
```
@example.com
@example.com
```

Which can be helpful when sanitizing data:

```sql
update users
  set email = split_part(email, '@', 1) || '@example.com';
```
