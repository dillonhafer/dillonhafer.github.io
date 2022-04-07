---
title: Ignore ~/.psqlrc when using psql
tag: sql
---

You can ignore your `~/.psqlrc` when running `psql` commands by using the `-X` or `--no-psqlrc` flags.

So when you have all this in your rc file:
```
/* ~/.psqlrc */
\x auto
\timing
\set PROMPT1 '%[%033[1m%]%M %n@%/%R%[%033[0m%]%# '
\set PROMPT2 '[more] %R > '
\pset null '☢'
\setenv PSQL_PAGER pspg
\setenv PAGER pspg
```

This command becomes quite noisy:

```
psql -c 'select 1'
Expanded display is used automatically.
Timing is on.
Null display is "☢".
Time: 0.210 ms
 ?column?
----------
        1
(1 row)

Time: 0.297 ms
```

If you run without the config file:

```
psql -X -c 'select 1'
 ?column?
----------
        1
(1 row)
```

on-line manual pages:
```
-X,
--no-psqlrc
    Do not read the start-up file (neither the system-wide psqlrc file nor the
    user's ~/.psqlrc file).
```
