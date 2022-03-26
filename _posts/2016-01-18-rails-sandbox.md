---
title: Rails Sandbox 🏖
tag: rails
---

When you are working with a complicated database structure, and find yourself needing to debug a complex or dangerous (delete) action, you might be hesitant to experiment. Keep experimenting! Don't want to setup all that data again? No worries. You can use a sandbox  `$ rails c -s`

```
Usage: rails console [environment] [options]
  -s, --sandbox      Rollback database modifications on exit.
```

The sandbox flag will keep all database changes in a database transaction when you start the rails console and automatically issue a rollback when you quit the console.

h/t [Hashrocket til](https://til.hashrocket.com/posts/e1036d0f13-rails-sandbox-)