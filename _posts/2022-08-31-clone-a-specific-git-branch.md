---
title: Clone a specific git branch
tag: git
---

After cloning a repo, git will set your branch to whatever the value of HEAD is in the source repo:

```
$ ssh git@example.com
$ cat my-repo.git/HEAD
ref: refs/heads/master
```

If there is a different branch you want to clone, use the `--branch` flag:

```
$ git clone --branch my-feature git@example.com/my-repo.git
$ git branch
* my-feature
```
