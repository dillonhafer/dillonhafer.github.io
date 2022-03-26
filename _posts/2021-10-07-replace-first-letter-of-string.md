---
title: Replace first letter of string
tag: go
---

You need to use runes to prevent corrupting unicode values:

```go
package main

import (
	"fmt"
)

func replaceFirstRune(str, replacement string) string {
	return string([]rune(str)[:0]) + replacement + string([]rune(str)[1:])
}

func main() {
	name := "Hats are great!"
	name = replaceFirstRune(name, "C")
	fmt.Println(name)
}
```
Output:
```
=> Cats are great!
```

Just like in ruby, this doesn't cover multi-byte unicode characters. You still need to do a unicode table lookup:

```ruby
name = "👨‍👩‍👧‍👦"
name[0] = "C"
=> "C‍👩‍👧‍👦"
```

```go
println(replaceFirstRune("👨‍👩‍👧‍👦", "C"))
=> "C‍👩‍👧‍👦"
```

You can go step more and replace the man with a woman:

```go
println(replaceFirstRune("👨‍👩‍👧‍👦", "👩"))
=> "👩‍👩‍👧‍👦"
```
