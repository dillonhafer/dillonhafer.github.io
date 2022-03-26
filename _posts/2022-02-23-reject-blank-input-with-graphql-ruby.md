---
title: Reject blank input with graphql-ruby 
tag: ruby
---

The `graphql-ruby` gem has a built-in blank validator:

```ruby
class Mutations::UserUpdate < Mutations::BaseMutation
  null true

  argument :user_id,
    String,
    "Identifier of user",
    required: true,
    validates: {allow_blank: false}

  field :user_id, String, null: false

  def resolve(user_id:)
    {user_id:}
  end
end
```

So now a mutation with a `user_id`  of `"  "` will cause the graphql response to have an error:

```graphql
mutation UserUpdate($userId: String!) {
  userUpdate(userId: $userId) {
    userId
  }
}
```
