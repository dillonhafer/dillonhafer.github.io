---
title: Values in Hash literals can be omitted in ruby 3.1
tag: ruby
---

```ruby
def send_push_notification(to:, body:)
  sound = "default"
  messages = [{
    to:,
    sound:,
    body:
  }]

  client.send_messages(messages)
end

send_push_notification(to: session.pn_token, body: "Welcome to our App!")

# sent messages with: [{
#  :to=>"ExponentPushToken[xxxxxxxxxxxxxxxxxxxxxx]",
#  :sound=>"default",
#  :body=>"Welcome to our App!"
# }]
```
