---
title: Disable broken VSCode feature
tag: workflow
---

TL;DR in the command palette choose "Workspaces: Configure Workspace Trust" and change "Start Prompt" to "never"

VSCode has a nice security feature warning about the risks of unknown file authors, but it is too naive to be useful; it actually has the reverse effect of being insecure (due to the fact most of these folders have been used in vscode for years before this feature was introduced). For example, I have over 200 projects on my machine:

```shell
ls ~/dev | wc -l
     213
```

The start prompt is simply training me to continually click "Yes I trust this code" over and over again, not only does this have no effect, but actually has a negative effect of making VSCode think I gave careful consideration to the folder, when instead, I was just trying to open my files.
