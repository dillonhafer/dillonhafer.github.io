---
title: Prefetch images in ReactNative
tag: react
---

When a react native app boots and there is a known set of user/group avatar urls received from an API, it may be a better user experience to load them before hand.

React Native's `Image` component has a `prefetch` method that will save the image into the device's image cache:

```tsx
import { Image } from "react-native";

const App = () => {
  const { users, loading } = useUserFetcher();

  users.forEach(u => Image.prefetch(u.avatarURL));

  return (
    <View>
      <UserList users={users} loading={loading} />
    </View>
  );
};
```
