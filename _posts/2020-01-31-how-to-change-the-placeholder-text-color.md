---
title: How to change the placeholder text color
tag: html-css
---

The `TextInput` component in react-native has a property of `placeholderTextColor` that allows you to configure the placeholder text color! However, `react-native-web` does not have this property and it must be done in css. So if you were using `react-native-web` you would need to include `.css` file:

```jsx
// screen.tsx
import "./styles.css";
import { TextInput } from "react-native";

const Screen = () => (
  <TextInput
    testID="change-placeholder-color"
    placeholder="enter some text"
    defaultValue=""
  />
);
```

```css
/************* 
*
*  styles.css
*
**************/
[data-testid="change-placeholder-color"]::-webkit-input-placeholder {
  color: skyblue;
}
[data-testid="change-placeholder-color"]::-moz-placeholder {
  color: skyblue;
}
[data-testid="change-placeholder-color"]::-ms-placeholder {
  color: skyblue;
}
[data-testid="change-placeholder-color"]::placeholder {
  color: skyblue;
}
```
