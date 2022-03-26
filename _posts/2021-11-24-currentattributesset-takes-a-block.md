---
title: CurrentAttributes.set takes a block
tag: rails
---

`CurrentAttributes.set` takes a block that will enclose values during the block call, perfect for background jobs:

```ruby
class Chat::PublicationJob < ApplicationJob
  def perform(attributes, room_number, creator)
    Current.set(person: creator) do
      Chat::Publisher.publish(attributes: attributes, room_number: room_number)
    end
  end
end
```
