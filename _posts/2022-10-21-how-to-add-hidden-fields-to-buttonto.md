---
title: How to add hidden fields to button_to
tag: rails
---

The `button_to` helper take a `params` key to add hidden fields to the form it renders:

```ruby
<%= button_to "Delete", users_path, method: :delete, params: {send_email: false} %>
```

Produces:

```html
<form class="button_to" method="post" action="/users">
<input type="hidden" name="_method" value="delete" autocomplete="off">
<button type="submit">Delete</button>
<input type="hidden" name="authenticity_token" value="8nOHRzvQIev3XHW6YrEJUIohVGLm0PKOPNly8ovPdDtF75eyBj5Rvz_1FzDmVybbJ3YyfC7YExtfRQC3_H5NNw" autocomplete="off">
<input type="hidden" name="send_email" value="false" autocomplete="off">
</form>
```
