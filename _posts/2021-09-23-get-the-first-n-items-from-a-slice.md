---
title: Get the first n items from a slice
tag: go
---

Slices can take low and high bounds to determine which items to take.

```go
mySlice[low bound : high bound]
```

```go
package main

import "fmt"

func main() {
	numbers := []int{1,2,3,4,5,6,7,8}

	var s []int = numbers[0:3]
	fmt.Println(s)
}

=> [1 2 3]
```
