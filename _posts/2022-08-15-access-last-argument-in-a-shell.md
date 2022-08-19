---
title: Access last argument in a shell
tag: command-line
---

You can access the last command's last argument with `$_`

Example:

```shell
> echo '🍟 I Eat Food'
🍟 I Eat Food

> echo $_
🍟 I Eat Food
```

Example Two:

```shell
> dropdb my_database
> createdb $_
```
