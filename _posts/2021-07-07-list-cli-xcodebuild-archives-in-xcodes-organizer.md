---
title: List cli xcodebuild archives in Xcode's organizer
tag: workflow
---

When using a Makefile to build Xcode applications, it's nice to have the archives listed in the Organizer window, for easy distribution. This can be accomplished with the `-archivePath` flag, using a specific directory:

```
BOB_THE_BUILD_DIR="~/Library/Developer/Xcode/Archives/$(date +%Y-%m-%d)"
ARCHIVE_PATH="$BOB_THE_BUILD_DIR/MyApp-$(date|md5).xcarchive"

xcodebuild -scheme MyApp -workspace "MyApp.xcworkspace" archive -configuration release -archivePath "$ARCHIVE_PATH"
```
