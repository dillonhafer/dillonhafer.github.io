---
title: Replace multiple characters in ruby strings
tag: ruby
---

Ruby `String#tr` allows you to replace characters or patterns in strings:

```ruby
irb(main):001:0> "I love coffee".tr("love", "😍")
=> "I 😍😍😍😍 c😍ff😍😍"
```

Compare with `#gsub`:

```ruby
irb(main):001:0> "I love coffee".gsub("love", "😍")
=> "I 😍 coffee"
```

If your `pattern` arg to gsub is only one character consider using `#tr`, but beware of multi-length `from_str` arg to `#tr`
