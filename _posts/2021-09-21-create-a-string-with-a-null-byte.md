---
title: Create a string with a null byte
tag: go
---

Use `\x00`

```go
package main

import (
	"fmt"
)

func main() {
	fmt.Println([]byte("\x00"))
}

=> [0]
```

Escaping 0 will NOT work:

```go
nul := "\0"
=> invalid character '"' in octal escape
```
