---
title: What directory is the parent of root 👨‍👦📁
tag: command-line
---

I learned that in unix, root (e.g. `/`) is the only directory that is the parent directory of itself.

```
$ ls -lai / | grep '\./'
                  2 drwxr-xr-x   20 root  wheel   640 Jan  1  2020 ./
                  2 drwxr-xr-x   20 root  wheel   640 Jan  1  2020 ../
```

In the above example, the files `.` and `..` both have the same i-node: 2

Source:
Brian W. Kernighan, & Rob Pike (1984) *The UNIX Programming Environment*. Prentice-Hall, Inc
