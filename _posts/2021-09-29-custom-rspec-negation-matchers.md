---
title: Custom RSpec negation matchers
tag: rails
---

You can create negated versions of existing rspec matchers, mostly useful with composition.

```ruby
# spec/rails_helper.rb
RSpec::Matchers.define_negated_matcher :an_array_excluding, :include
```
```ruby
# spec.rb
list = (1..5).to_a
expect {
  list.delete(5)
}.to change { 
  list
}.to an_array_excluding(5)
```
