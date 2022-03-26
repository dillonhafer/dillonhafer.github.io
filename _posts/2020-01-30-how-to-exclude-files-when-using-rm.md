---
title: How to exclude files when using rm
tag: workflow
---

`rm` has no built-in way to exclude files, but you can use a negative pattern:

```shell
$ ls
=> bar.txt  foo.txt  secrets.yml
$ rm !("bar.txt"|"secrets.yml")
$ ls
=> bar.txt  secrets.yml
```

This approach is very error-prone and could have unexpected results. There are safer alternatives.
