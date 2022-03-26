---
title: Custom Port with Create React App
tag: react
---

When you know `create-react-app` will never be using port `3000` you can specify an alternate port, to avoid being prompted all the time.

Just pre-pend the port to the start script:

```json
{
  "name": "custom-port",
  "version": "0.1.0",
  ...
  
  "scripts": {
    "start": "PORT=3001 react-scripts start",
    ...
  }
}
```
