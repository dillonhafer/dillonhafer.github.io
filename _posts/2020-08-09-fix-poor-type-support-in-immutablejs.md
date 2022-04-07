---
title: Fix poor type support in immutablejs
tag: javascript
---

Immutablejs doesn't work very well with typescript. But I can patch types myself for some perceived type safety:

```ts

import {Map,fromJS} from 'immutable';

interface TypedMap<T> extends Map<any, any> {
  toJS(): T;
  get<K extends keyof T>(key: K, notSetValue?: T[K]): T[K];
}

interface User {
  name: string;
  points: number;
}

const users = List() as List<TypedMap<User>>;

users.forEach(u => {
  const aString = u.name
  const aNumber = u.points
});
```
