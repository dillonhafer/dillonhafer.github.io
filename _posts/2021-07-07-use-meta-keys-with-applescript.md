---
title: Use meta keys with AppleScript
tag: workflow
---

Example opening Xcode's organizer window:

```
osascript -e 'tell application "Xcode" to activate' -e 'tell application "System Events" to keystroke "o" using {command down,shift down,option down}'
```
