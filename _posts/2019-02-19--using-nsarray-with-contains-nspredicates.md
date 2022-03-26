---
title: 🔍 Using NSArray with CONTAINS NSPredicates
tag: workflow
---

`NSPredicate`'s `predicateWithFormat` method takes a `va_list` of arguments, so it's not possible to pass an array to your format string. But, the same result can be achieved by combining multiple `NSPredicate`s together using an `NSCompoundPredicate`:

Given a space-separated array of search words:

```objectivec
NSArray<NSString*> *words = [@"my search terms" componentsSeparatedByString:@" "];
```

You can combine them by first creating multiple predicates:

```objectivec
NSMutableArray<NSPredicate *> *predicates = [NSMutableArray new];
for (NSString *word in words) {
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"attribute CONTAINS[cd] %@", word];
  [predicates addObject:predicate];
}
```

And finally create one `NSPredicate` via `NSCompoundPredicate`

```objectivec
NSPredicate *finalPredicate =
        [NSCompoundPredicate andPredicateWithSubpredicates:predicates];
```
