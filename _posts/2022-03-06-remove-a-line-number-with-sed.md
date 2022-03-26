---
title: Remove a line number with sed
tag: workflow
---

Sed can remove a line in a file by its number with `'<line number>d'`:

```
printf "a\nb\nc\n" > file.txt
sed '2d' file.txt
a
c
```
