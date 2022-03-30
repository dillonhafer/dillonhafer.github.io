---
title: Implicit order column
tag: rails
---

`ActiveRecord` has a class method `implicit_order_column=` that allows you to override the behavior of the `.first` and `.last` methods.

```ruby
class User < ApplicationRecord
  self.implicit_order_column = "email"
end

User.first
```

```
User Load (3.2ms)  SELECT "users".* FROM "users" ORDER BY "users"."email" ASC, "users"."id" ASC LIMIT $1  [["LIMIT", 1]]
```
