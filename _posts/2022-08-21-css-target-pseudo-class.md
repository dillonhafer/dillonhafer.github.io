---
title: CSS target pseudo class
tag: html-css
---

You can style an element with css if its id attribute matches the window location's hash using the `:target` pseudo-class:

```html
<style>
#content {
  display: none;
}
#content:target {
  display: block
}
</style>

<a href="#content">See hidden content</a>

<table id="content">
  <legend>Keep is secret!
  <tr>
    <td>Keep it safe!
</table>
```

https://developer.mozilla.org/en-US/docs/Web/CSS/:target
