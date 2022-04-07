---
title: Custom Browser with Create React App
tag: react
---

Sometimes Google Chrome isn't your default browser for surfing the internet, but it is your default browser during development. With `create-react-app` you can specify an alternate browser to automatically open (or no browser at all), to avoid opening the wrong  development browser all the time.

Just pre-pend the browser to the start script:

```json
{
  "name": "custom-browser",
  "version": "0.1.0",
  ...
  
  "scripts": {
    "start": "BROWSER='Google Chrome' react-scripts start",
    ...
  }
}
```
