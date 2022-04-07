---
title: Use PostgreSQL socket in database.yml 🐘🔌
tag: rails
---

When using the `host:` configuration option in the `database.yml` set to `localhost` or `127.0.0.1`, I would need to add an entry to PostgreSQL's `pg_hba.conf` file to allow my ip address access. But, if you give the `host:` option the directory of your PostgreSQL sockets, rails will be able to use the socket, without needing to add an entry to the PostgreSQL configuration file.

```yml
production:
  database: fancy_things
  host: '/var/run/postgres'
  ...
```
