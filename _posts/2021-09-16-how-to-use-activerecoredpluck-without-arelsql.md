---
title: How to use ActiveRecored.pluck without Arel.sql
tag: rails
---

It is too cumbersome to remember to wrap every string in a class method, so this is a shortcut:

```ruby
# app/models/application_record.rb

class ApplicationRecord < ActiveRecord::Base
  module ::ActiveRecord::Sanitization::ClassMethods
    define_method(:original_disallow_raw_sql!, instance_method(:disallow_raw_sql!))

    def disallow_raw_sql!(args, permit: connection.column_name_matcher) # :nodoc:
      original_disallow_raw_sql!(args.map { |a| a.is_a?(String) ? Arel.sql(a) : a }, permit: permit)
    end
  end
end

```

Then you can write sql without the class methods

This can be easier to write:

```ruby
User.where(payment_due: true)
  .pluck(Arel.sql("coalesce('last_billed_date', 'start_date')"))
```

Can now just be written as:

```ruby
User.where(payment_due: true)
  .pluck("coalesce('last_billed_date', 'start_date')")
```

This can also be useful for `.order` as well
