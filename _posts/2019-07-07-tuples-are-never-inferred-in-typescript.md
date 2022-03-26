---
title: Tuples are never inferred in TypeScript
tag: javascript
---

If I have a function that takes a number tuple: 

```ts
type Options = {
  aspect: [number, number],
  ...
}

const pickImage = (imageOptions: Options) => (
  ...
)
```

This will give a type error:

```ts
const myOptions = {
  aspect: [4, 3],
};

// ❌ Expected [number, number], got number[]
pickImage(myOptions);
```

I must use type assertion when passing tuples:

```ts
const myOptions = {
  aspect: [4, 3] as [number, number],
};

pickImage(myOptions);
```
