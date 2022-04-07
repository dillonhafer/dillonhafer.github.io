---
title: How to open the Settings App in ReactNative 0.60
tag: react
---

ReactNative version `0.60` adds a function to the `Linking` API called `openSettings` that will open the Settings app and display the permissions.

```js
import { Button, Linking } from "react-native";

const Screen = () => (
  <Button
    title="Open Settings"
    onPress={() => {
      Linking.openSettings();
    }}
  />
);
```
