---
title: Drop connections with Nginx
tag: workflow
---

You can ignore requests sent to nginx by responding with the status `444`

```bash
server {
  listen 80;
  listen [::]:80;
  listen 443;
  listen [::]:443 ssl http2;

  server_name dillonhafer.com;
  location /no-response {
    return 444;
  }
}
```

The primary use for this is to prevent processing requests with undefined server names:

```bash
# block for requests with undefined server names
server {
  listen 80;
  listen [::]:80;

  return 444;
}
```
