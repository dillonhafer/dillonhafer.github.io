---
title: Expo PushNotifications with pop-ups on Android
tag: react
---

Expo has an amazing push notification service. In order to display push notifications in a pop-up style (the default on iOS) on Android, you must do two things:

1. Create an Android push notification **channel**
1. Set the `priority` and `channelId` in the push notification payload to expo.

Create channel example:

```tsx
import React from "react";
import { Platform } from "react-native";
import { Notifications } from "expo";

class App extends React.Component<Props> {
  componentDidMount() {
    if (Platform.OS === "android") {
      Notifications.createChannelAndroidAsync("chat-messages", {
        name: "Messages",
        priority: "max",
        sound: true,
        vibrate: [0, 250, 500, 250]
      });
    }
  }

  render() {
    // ...
  }
}
```

Send PN with priority and channel example:

```sh
curl -H "Content-Type: application/json" -X POST "https://exp.host/--/api/v2/push/send" -d '{
  "to": "ExponentPushToken[xxxxxxxxxxxxxxxxxxxxxx]",
  "title":"New Message",
  "body": "Are you there?",
  "channelId": "chat-messages",
  "priority": "max"
}'
```
