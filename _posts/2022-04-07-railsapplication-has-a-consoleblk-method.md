---
title: Rails::Application has a "console(&blk)" method
tag: rails
---

So you can run code only if you're in a rails console:

```ruby
# config/application.rb
module MyApplication
  class Application < Rails::Application
    console do
      `say -vkyoko こんにちは` if Rails.env.development?
    end
  end
  #...
end
```

Now I receive a greeting every time I run `bin/rails console`
