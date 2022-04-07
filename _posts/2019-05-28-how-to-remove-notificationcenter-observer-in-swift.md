---
title: How to remove NotificationCenter observer in Swift
tag: workflow
---

Use the method `deinit`. In Objective-C classes I would always remove `NSNotificationCenter` observers in the `-dealloc` method, but a Swift class doesn't have a `-dealloc` method. Instead, Swift has a `deinit` method.

Here is an example of Objective-C:

```objectivec
@implementation MyClass
  - (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
  }
@end
```

And the equivilant in Swift:

```swift
class MyClass {
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
}
```
