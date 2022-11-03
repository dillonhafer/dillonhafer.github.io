---
title: Add custom flash keys
tag: rails
---

`ActionController::Base` has a default flash types of `[:notice]` allowing you to pass a key to `#redirect_to`:

```ruby
class Controller < ActionController::Base
  def create
    if true
      redirect_to root_path, status: :see_other, notice: "Created"
    else
      flash[:error] = "Could not create"
      redirect_to root_path, status: :see_other
    end
  end
```

However, you can add `:error` as a custom type to get the convenience argument:

```ruby
class Controller < ActionController::Base
  add_flash_types :error

  def create
    if true
      redirect_to root_path, status: :see_other, notice: "Created"
    else
      redirect_to root_path, status: :see_other, error: "Could not create"
    end
  end

```
