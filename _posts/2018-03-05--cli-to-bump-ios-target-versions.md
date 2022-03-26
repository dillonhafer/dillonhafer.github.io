---
title: 🔢 CLI to bump iOS target versions
tag: mobile
---

Bumping Info.plist versions by hand can be very error prone (e.g. remembering to bump multiple targets in a project)

Fortunately Xcode's cli has an easy solution

```sh
xcrun agvtool new-marketing-version <versString>
```

So if my Application targets are at version `2.0.4` and I need them to be at `2.0.5` I simply run this command at the terminal:

```sh
xcrun agvtool new-marketing-version 2.0.5
```


**References: [https://developer.apple.com/library/content/qa/qa1827/_index.html](https://developer.apple.com/library/content/qa/qa1827/_index.html)*
