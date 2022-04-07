---
title: Have OS specific implementations in golang
tag: go
---

In go, you can create separate implementations for different operating systems by creating multiple files:

```go
package main

import (
	"play.ground/foo"
)

func main() {
	foo.HelloComputer()
}

-- go.mod --
module play.ground

-- foo/foo_windows.go --
// +build windows

package foo

import "fmt"

func HelloComputer() {
	fmt.Println("Hello windows!")
}

-- foo/foo_linux.go --
// +build !windows

package foo

import "fmt"

func HelloComputer() {
	fmt.Println("Hello not windows!")
}

```
