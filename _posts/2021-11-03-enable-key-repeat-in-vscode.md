---
title: Enable key repeat in VSCode
tag: workflow
---

Even if your operating system enables key repeat, VSCode will disable it. To turn it on you need to update a default value and restart vscode:

```sh
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
osascript -e 'tell application "Visual Studio Code" to quit'
osascript -e 'tell application "Visual Studio Code" to activate'
```
