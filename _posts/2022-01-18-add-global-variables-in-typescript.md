---
title: Add global variables in typescript
tag: javascript
---

In this example, we need to put placeholder values on global.window to allow us to use Ruby on Rails' ActionCable websocket framework where no window exists:

```ts
// Fix to prevent crash from ActionCable
global.window.removeEventListener = () => {};
global.window.addEventListener = () => {};
```

But we need to add a type:

```ts
declare global {
	var window: {
		addEventListener(): void;
		removeEventListener(): void;
	};
}
```
