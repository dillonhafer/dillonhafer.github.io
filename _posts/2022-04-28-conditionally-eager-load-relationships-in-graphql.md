---
title: Conditionally eager load relationships in graphql
tag: ruby
---

You can conditionlly eagerload relationships in `graphql-ruby` by looking at look aheads:

```ruby
module Resolvers
  class Customer < Resolvers::BaseResolver
    extras [:lookahead]
    argument :id, ID, required: true

    def resolve(lookahead:, id:)
      scope = ::Customer

      if lookahead.selects?(:orders)
        scope = scope.includes(:orders)
      end

      scope.find_by(id)
    end
  end
end

```
