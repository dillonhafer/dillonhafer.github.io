---
title: Prevent rails' file server from serving index.html
tag: rails
---

You can prevent rails' file server from serving index.html, while continuing to serve other files from the public directory by changing the `index_name`:

```ruby
class Application
  config.public_file_server.index_name = "other-index.html"
end

Rails.application.routes.draw do
  get :dashboard, to: "application#dashboard"
  root to: redirect("/dashboard")
end
```

Visiting the root path `/` will no longer serve `public/index.html`  if you define another route for `/`
