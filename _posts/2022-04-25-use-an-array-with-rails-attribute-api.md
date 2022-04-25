---
title: Use an array with Rails' attribute API
tag: rails
---

Attributes can be arrays by removing the type and adding `array: true`:

```ruby
class User
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string, default: "n/a"
  attribute :akas, array: true, default: []
end

User.new(name: "Luke", akas: ["LSW", "Skywalker"]).attributes
=> {"name"=>"Luke", "akas"=>["LSW", "Skywalker"]}
```
