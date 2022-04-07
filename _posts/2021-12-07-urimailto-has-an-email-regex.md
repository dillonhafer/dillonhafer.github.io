---
title: URI::MailTo has an email regex
tag: ruby
---

```ruby
email = "luke.s.walker@example.com"
URI::MailTo::EMAIL_REGEXP.match?(email)
=> true

email = "luke.s.walker@@example.com"
URI::MailTo::EMAIL_REGEXP.match?(email)
=> false
```
