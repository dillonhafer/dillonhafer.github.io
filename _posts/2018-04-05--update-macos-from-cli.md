---
title: 🆙 Update macOS from cli
tag: workflow
---

Opening the App Store and navigating to the update tab and clicking and confirming the update buttons is just too many steps for me.

macOS has a cli to the software update process:

```
$ /usr/sbin/softwareupdate
```

With some fancy arguments I can update everything in one command:

```
$ sudo softwareupdate -ia
```

the `-ia` flag means `i`nstall `a`ll the available updates.
