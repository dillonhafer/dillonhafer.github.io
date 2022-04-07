---
title: Cache-control behavior for ReactNative's Image
tag: react
---

React Native's `Image` component accepts a `cache` property to override the caching behavior of images, but only on iOS. An interesting setting can force an image to only be loaded if it is in the cache.

```tsx
<Image
  source={{ "{{" }}
    uri: "https://facebook.github.io/react/logo-og.png",
    cache: "only-if-cached"
  }}
  style={{ "{{" }} width: 400, height: 400 }}
/>
```
