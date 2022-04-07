---
title: Add element to beginning of array
tag: swift
---

You can add an element to the beginning of an array by insert at an index.

```swift
var pastSearches: [String] = []
pastSearches.insert("hi")
print(pastSearches)
=> ["hi"]
pastSearches.insert("bye", at: 0)
=> ["bye", "hi"]
```
