---
title: The Case of the Default 🕵
---

In Apple's Swift language switch statements must be what apple calls "exhaustive". I've felt the term to be very literal. Literally exhaustive?

**Example that does not work:**

```swift
let count = 42

switch count {
case 1:
  print(1)
case 7:
  print(7)
}
```

The above statement does not work because it's missing a `default` case. Why? What if I don't want to do anything else? Why do I need to write something that won't be used? Don't worry, there is an amazing and less "exhaustive" way to handle these situations; simply `default: ()`

**Correct example:**

```swift
let count = 42

switch count {
case 1:
  print(1)
case 7:
  print(7)
default: ()
}
```

h/t [Hashrocket til](https://til.hashrocket.com/posts/f54575d4ef-the-case-of-the-default-)