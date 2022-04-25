---
title: Hash#transform_keys takes a hash
tag: ruby
---

You can map keys by giving a map of new keys:

```ruby
data = {
  isAdmin: true,
  firstName: "Luke",
  lastName: "Walker"
}

data.transform_keys({
  isAdmin: :admin?, 
  firstName: :first_name, 
  lastName: :last_name
})
=> {
  :admin? => true,
  :first_name => "Luke",
  :last_ame => "Walker"
}
```
