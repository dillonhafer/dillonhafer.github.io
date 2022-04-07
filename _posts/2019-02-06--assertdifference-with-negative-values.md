---
title: 🧮 assert_difference with negative values
tag: ruby
---

`ActiveSupport::Testing::Assertions` can check that a value was reduced because of a block:

```ruby
test 'should destroy' do
  assert_difference('User.count', -1) do
    delete :destroy, id: user.id
  end
end
```

`#assert_difference` has a default value of `1` so negative numbers must be explicit.

**[https://api.rubyonrails.org/v5.0/classes/ActiveSupport/Testing/Assertions.html#method-i-assert_difference](https://api.rubyonrails.org/v5.0/classes/ActiveSupport/Testing/Assertions.html#method-i-assert_difference)*
