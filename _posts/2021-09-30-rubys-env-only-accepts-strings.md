---
title: Ruby's ENV::[]= only accepts strings
tag: ruby
---

You cannot set the value of an environment variable to something that is not a string

```ruby
# THIS DOES NOT WORK
ENV["SKIP_AUTH"] = true
=> `[]=': no implicit conversion of true into String (TypeError)
```

You can, however, pass an object that implements `#to_str`

```ruby
class User < ApplicationRecord
  def to_str
    to_global_id.to_s
  end
end

ENV["user"] = User.first
ENV["user"]
=> "gid://rails-app/User/3f565b9c-0899-49f6-ab20-aa2724235ff5"
```

Be careful when stubbing `ENV` in specs:

```ruby
# ENV could never return a boolean, your tests will lie to you.
RSpec.describe "ENV" do
  before do
    stub_const("ENV", {"SKIP_AUTH" => true})
  end
end
```
