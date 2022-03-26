---
title: ActiveSupport has a presence method
tag: rails
---

If you use `ActiveSupport` you have access to the method `#presence` that returns nil if the object is `#blank?`

```ruby
require "active_support"

# blank? on String is a regex for /[:space:]*/
"\n\t \n\r".presence
=> nil

"     abc   ".presence
=> "     abc   "
```
