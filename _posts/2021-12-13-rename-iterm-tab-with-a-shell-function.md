---
title: Rename iTerm tab with a shell function
tag: command-line
---

Shell function:

```shell
function renametab () {
    echo -ne "\033]0;"$@"\007"
}
```

Usage:

```
renametab Bob\'s Burgers
```

Output:

<img width="822" alt="Screen Shot 2021-12-12 at 22 35 04" src="https://user-images.githubusercontent.com/1136388/145748425-ec5b45dc-7c5a-4cc9-87a7-bec511cf41c4.png">
