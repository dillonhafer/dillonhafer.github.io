---
title: Listen for onfocus events on document 
tag: javascript
---

If you want to set an event listener on document for an input's `onFocus` event, you'll find there is no "onFocus" event for `document`. Instead you can use the `focusin` event listener:

```js
document.addEventListener("focusin", function(e) {
  console.log("an input received focus");
});
```

So if you had dynamic events you can achieve this:

```js
const on = (eventName, elementSelector, handler) => {
  document.addEventListener(eventName, function (e) {
    for (var target = e.target; target && target != this; target = target.parentNode) {
      if (target.matches(elementSelector)) {
        handler.call(target, e);
        break;
      }
    }
  }, false);
}

on("focusin", "#email_address", function(e) {
  const currentTarget = this;
  console.log("Email address just received focus");
});
```
