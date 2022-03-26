---
title: Store cURL response headers in a file
tag: workflow
---

cURL can save response headers to file (useful in shell scripts) with the `-D` flag

```
curl -D response-headers.txt https://example.com
```
