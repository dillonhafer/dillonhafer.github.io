---
title: Pass request format to url_for
tag: rails
---

`#url_for` takes a Hash of options to change the format:

```ruby
<%= link_to "Final Invoice", [:final_invoice, ticket, {format: :pdf}] %>
```
```html
<a href="/tickets/123/final-invoice.pdf">Final Invoice</a>
```
