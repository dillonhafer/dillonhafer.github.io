---
title: prevent execution when creating materialized views
tag: sql
---

When working with foreign data wrappers, one uses a materialized view to store the downloaded foreign table data. The process of downloading could be very expensive and managed by another process or program, but your program needs to define the parameters of materialzied view/foreign table. Maybe the data is loaded out of band by cron:

```
@daily /usr/bin/psql -d cool_db -c 'refresh materialized view big_view;'
```

So to create the materialized view **without** loading the data we use the `WITH NO DATA` clause:

```sql
create foreign table measurement_y2016m07
    partition of measurement for values from ('2016-07-01') to ('2016-08-01')
    server server_07;

create materialized view big_view
  as select *
  from measurement_y2016m07
  with no data;
```

This way we are able to execute the `create foreign table` and `create materialized view` statements in a very short amount of time. A different process can start the download with `refresh materialized view`
