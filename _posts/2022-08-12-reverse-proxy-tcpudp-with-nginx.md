---
title: Reverse proxy tcp/udp with nginx
tag: devops
---

Nginx has the ability to reverse proxy tcp and udp with the `stream` directive, similar to the http directive:

```nginx
# Reverse proxy postgres server
stream {
  server {
    listen 5432;
    proxy_pass 172.18.65.97:5432;
  }
}

http {
  server { 
    ...
  }
}
```

This can be useful to load balance tcp streams like a database connection.

If you built nginx with `--with-stream=dynamic` (you can check with `nginx -V`) you will need to manually load a shared object:

```nginx
# nginx.conf
load_module /usr/lib/nginx/modules/ngx_stream_module.so
```
