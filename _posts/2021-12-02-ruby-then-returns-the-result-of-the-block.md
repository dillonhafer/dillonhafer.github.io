---
title: Ruby #then returns the result of the block
tag: ruby
---

`Kernel#then` is similar to `#tap`, but the return values are different; `#tap` returns `self`, but `#then` returns the result of the block:

```ruby
"a".tap  {|s| Time.current }
=> "a"

"a".then {|s| Time.current }
=> Thu, 02 Dec 2021 16:50:57.454554000 UTC +00:00
```
