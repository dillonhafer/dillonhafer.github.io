---
title: You MUST use a ws protocol in rails💩actioncable
tag: rails
---

Rails' actioncable library is a bit immature compared to other implementations, so there are a lot of rough edges to work around. One of those is the basic `createConsumer` function.

If your app is running without a DOM (nodejs), the node_module `@rails/actioncable` is going to fight you.

The rails guides recommend this:

```js
createConsumer('https://ws.example.com/cable')
```

But that function relies on having a global `document` that can create `<a>` tags, which you won't have in many contexts (node, react-native, etc.)

Also, why does a websocket library depend on HTML anchor tags?

You can work around this limitation by explicitly using a `ws` or `wss` protocol:

```js
createConsumer('ws://localhost:3000/cable')
```
