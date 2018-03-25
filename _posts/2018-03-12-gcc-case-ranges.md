---
title: gcc case ranges
---

gcc has a C extension called "Case Ranges" that lets you specify consecutive values in a single `case` label.

```c
#import "Response.h"

@interface Response()
@end

-(BOOL)ok {
  switch ([self statusCode]) {
    case 200 ... 299:
      return YES;
    default:
      return NO;
  }
}
```

⚠️ Be sure to write spaces around the `...` 

**References: [https://gcc.gnu.org/onlinedocs/gcc-4.2.4/gcc/Case-Ranges.html#Case-Ranges](https://gcc.gnu.org/onlinedocs/gcc-4.2.4/gcc/Case-Ranges.html#Case-Ranges)*
