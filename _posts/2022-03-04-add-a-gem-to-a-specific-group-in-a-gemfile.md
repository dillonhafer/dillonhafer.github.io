---
title: Add a gem to a specific group in a Gemfile
tag: ruby
---

You can add a gem to a specific group with the `--group` flag. 

Normally you add a gem by running:

```
bundle add standard
```

But if you want to add it only to the "development, test" group you can run:

```
bundle add --group "development, test" standard
```
