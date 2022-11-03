---
title: Fill in hidden fields with Capybara
tag: rails
---

Normally you are not able to interact with hidden fields, but you can still change the value with `#set`:

```ruby
find("input[type=hidden]", visible: false).set("my cool value")
```
