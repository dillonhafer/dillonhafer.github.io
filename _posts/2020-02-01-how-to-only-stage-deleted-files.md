---
title: How to only stage deleted files
tag: git
---

If I delete a bunch of files and just want to stage the deleted ones, I can use `xargs` to add them:

```shell
$ git ls-files --deleted | xargs git add
```

Example output:

```shell
$ git status

  deleted: lib/to/deleted_1.txt
  deleted: lib/to/deleted_2.txt
  modified lib/that/changed_1.txt
  deleted: lib/to/deleted_3.txt
  deleted: lib/to/deleted_4.txt
  modified lib/that/changed_2.txt
  deleted: lib/to/deleted_5.txt
  modified lib/that/changed_3.txt
```

```
$ git ls-files --deleted | xargs git add
```

```
Changes to be committed:

  deleted: lib/to/deleted_1.txt
  deleted: lib/to/deleted_2.txt
  deleted: lib/to/deleted_3.txt
  deleted: lib/to/deleted_4.txt
  deleted: lib/to/deleted_5.txt

Changes not staged for commit:

  modified lib/that/changed_1.txt
  modified lib/that/changed_2.txt
  modified lib/that/changed_3.txt
```
