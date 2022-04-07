---
title: Push git branch to another machine
tag: git
---

Whenever I'm working in the same git repo on multiple machines, and I need to work on a branch on both machines I usually push the branch to a shared remote for the sole purpose of pulling it down on the other machine. This third machine can be avoided by push directly between machines:

```
$ myproject(feature-branch): git remote add machine2 ssh://machine2:/Users/dillon/dev/myproject
$ myproject(feature-branch): git push machine2 feature-branch
```

Over on machine2:

```
$ myproject(master): git branch
* master
  feature-branch       <= 😯

```
