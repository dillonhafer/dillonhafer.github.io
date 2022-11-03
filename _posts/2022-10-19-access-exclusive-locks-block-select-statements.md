---
title: Access Exclusive locks block select statements
tag: sql
---

The `alter table`, `vacuum full`, `reindex`, and `refresh materialized view` statements are a few examples that may take out an `ACCESS EXCLUSIVE` lock by default. This means that `select` statements are blocked until one of these statements has finished.
