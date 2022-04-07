---
title: Use older version of bundler
tag: ruby
---

When working with older ruby applications you might need to use an older version of bundler. You can references different versions with the first argument:

```sh
$ cd old-project
$ bundle install
Bundler could not find compatible versions for gem "bundler":
...
$ bundle _1.17.3_ install
```
