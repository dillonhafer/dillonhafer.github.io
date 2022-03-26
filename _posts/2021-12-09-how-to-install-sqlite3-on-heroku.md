---
title: How to install sqlite3 on heroku
tag: workflow
---

Using sqlite to persist data is superfluous on heroku, duh, but sometimes a third party service wants my rails app to read configuration in a sqlite db file. In order to read the read-only database file, I need to install the `sqlite3` gem. To get this to work on heroku I needed to do two things:

1. Install the apt buildpack
2. Add an Aptfile in the root of the project

```
heroku buildpacks:add --index 1 heroku-community/apt
```
Then create an apt file:
```
# Aptfile
libsqlite3-dev
libsqlite3-0
```
