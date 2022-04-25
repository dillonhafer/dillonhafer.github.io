---
title: Print unknown exceptions in PL/pgSQL
tag: sql
---

When trying to figure out why a function raised an exception you can print the error code raised to lookup in the table [Appendix A-1](https://www.postgresql.org/docs/current/errcodes-appendix.html#ERRCODES-TABLE).

One method is to capture `others` and then raise the magic `sqlstate` variable (only available in exception handlers)

```sql
create or replace function do_it(name text)
  returns void
as $$
begin
  select 42 from nothing;
exception
  when others then
    raise '%: %', sqlstate, sqlerrm;
end;
$$
  security definer
  language plpgsql
;
```

Then you can view the error:

```
select do_it('hi');
ERROR:  42P01: relation "nothing" does not exist
CONTEXT:  PL/pgSQL function do_it(text) line 6 at RAISE
```
