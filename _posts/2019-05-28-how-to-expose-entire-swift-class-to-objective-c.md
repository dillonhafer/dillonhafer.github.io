---
title: How to expose entire Swift class to Objective-C
tag: workflow
---

Use the `@objcMembers` annotation in your Swift class. When working on a project that is migrating from Objective-C to Swift you will most likely be sharing all Swift functions with Objective-C, but that could start to look ugly:

```swift
class MyClass: NSObject {
  @objc func fancy() -> String {
  	return "fancy"
  }
  
  @objc func tooFancy() -> String {
  	return "🤵"
  }
}
```

But if everything needs to be available to Objective-C, we simply do:

```swift
@objcMembers
class MyClass: NSObject {
  func fancy() -> String {
  	return "fancy"
  }
  
  func tooFancy() -> String {
  	return "🤵"
  }
}
```
