---
title: How to redirect standard error
tag: workflow
---

`2>` Allows us to redirect standard error.

Taking advantage of `rm`'s ability to not delete files recursively can come in handy, especially when writing clean up scripts, but it can be noisy when you don't care.

Give this file structure:

```sh
~/
  tmpfile1.txt
  tmpfile2.txt
  tmpfile3.txt
  tmpfile4.txt
  do-not-delete/
    secrets.yml
```

I may want to delete all the files, but not touch the directories (to keep file removal simple)

```sh
$ rm *
rm: cannot remove 'do-not-delete': Is a directory

$ ls
~/
  do-not-delete/
    secrets.yml
```

Because the directory error message comes over stderr, we can simply redirect it to `/dev/null` to ignore it:

```
rm * 2> /dev/null
```
