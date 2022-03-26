---
title: javascript concat returns a new array
tag: javascript
---

```js
const letters = ["a", "b", "d"];
console.log(letters.slice(0, -1).concat("c"));
=> [ "a", "b", "c" ]

console.log(letters)
=> ["a", "b", "d"]
```
