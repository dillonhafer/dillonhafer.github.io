---
title: Get database value of model instance
tag: rails
---

AR instances have a method `#attribute_in_database`. Sometimes things don't make sense, someone has created a method with the same name as the column:

```sql
create table users (id int, email citext);
```
```ruby
class User < ApplicationRecord
  def email
    Time.current.strftime("%A, %B %C")
  end
end

User.first.email
=> "Thursday, March 20"
```

But you actually wan the email:

```ruby
User.first.attribute_in_database("email")
=> "admin@example.com"
```
