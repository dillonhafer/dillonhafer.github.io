---
title: Get size of terminal
tag: ruby
---

You can get the terminal size with `IO` class' `#winsize` method

```ruby
require "io/console"

p IO.console.winsize

=> [26, 46]
```

`IO.console` is just the file `/dev/tty`

https://ruby-doc.org/stdlib-3.1.1/libdoc/io/console/rdoc/IO.html#method-i-winsize
