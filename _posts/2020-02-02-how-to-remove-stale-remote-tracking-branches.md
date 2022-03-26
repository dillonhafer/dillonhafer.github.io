---
title: How to remove stale remote-tracking branches
tag: git
---

After deleting branches on github, or any other tracked remote, you can remove references to deleted branches without having to fetch changes by simply using the remote prune sub-commands:

```shell
$ git remote prune origin
```

Another remote:

```shell
$ git remote add bitbucket git@bitbucket.org...
$ git remote prune bitbucket
```
