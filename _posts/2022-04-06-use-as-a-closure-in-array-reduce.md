---
title: Use + as a closure in Array reduce
tag: swift
---

In swift you can pass a method as the closure:

```swift
import Foundation

let numbers = [1, 2, 3, 4, 5]
let total = numbers.reduce(0, +)
print("Average: \(total / numbers.count)")

=> "Average: 3"
```

You can also use the generic closure:

```swift
import Foundation

let numbers = [1, 2, 3, 4, 5]
let total = numbers.reduce(0, { accumulator, number in 
  accumulator + number
})
print("Average: \(total / numbers.count)")

=> "Average: 3"

```
