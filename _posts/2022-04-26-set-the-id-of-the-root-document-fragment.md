---
title: Set the id of the root document fragment
tag: javascript
---

```html
<template id="my-template">
  <div>
    <input type="hidden" value="1" name="amount" />
  </div>
</template>
```

You can set the id by querying for the div:

```js
const deep = true;
const template = document.querySelector("#my-template");
const div = document.importNode(template.content, deep);
div.querySelector("div").id = "my-id";
document.body.appendChild(div);
```

Output:

```html
  <div id="my-id">
    <input type="hidden" value="1" name="amount" />
  </div>
```
