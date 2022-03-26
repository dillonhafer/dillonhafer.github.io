---
title: See git history of a renamed file
tag: git
---

If you rename a file, git won't show history of the previous name:

```
$ git log --pretty=oneline things/text.txt
8567d... Move file into things directory
```

However, the `--follow` flag will allow you to see the history of commits beyond the rename:

```
$ git log --follow --pretty=oneline things/text.txt
8567d... Move file into things directory
1458a... Fix something
0aac5... Add something
```

Docs:

```
--follow
  Continue listing the history of a file beyond renames (works only for a single file).
```
