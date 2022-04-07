---
title: 🐚 Private Shell History
tag: workflow
---

Sometimes you don't want to put a dangerous command into your shell history, for example: 

```shell
git reset --hard HEAD~
```

In `zsh` you can prevent a command from being saved in you history by setting the zsh option: `setopt HIST_IGNORE_SPACE` 

then just prefix your command with a space:

```shell
 git reset --hard HEAD~
```
