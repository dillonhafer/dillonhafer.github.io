---
title: Browsers have a Web Cryptography API
tag: javascript
---

All major versions of browser implement a Web Cryptography API for obtaining random numbers:

```js
const numbers = new Uint32Array(1);
window.crypto.getRandomValues(numbers);
console.log(numbers);
// => [1627205277]
```

However, the methods are overridable, not read-only, and are vulnerable to polyfill attacks. This shouldn't be used yet and is still being developed, but I found out the API exists.
