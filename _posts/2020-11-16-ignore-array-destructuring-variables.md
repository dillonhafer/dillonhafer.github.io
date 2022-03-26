---
title: Ignore Array destructuring variables
tag: javascript
---

If you don't need an element in an array while destructuring it, simply omit a name:

```js
const [, two, three] = [1, 2, 3];
console.log(two, three)
=> 2 3
```
