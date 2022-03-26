---
title: How to remove unused deps from mix.lock
tag: elixir
---

When you remove a dep from the `mix.exs` file it will remain in the `mix.lock` file. Unused deps need to be "unlocked" in order to be removed from the lock file.

For example:

```
mix deps.clean --unused
```

will only remove the unused dependencies' files, but will keep the library in the `mix.lock file`. If you run the clean command the `--unlock` option, it will also remove it from the lock file.

For example:

```
mix deps.clean --unlock --unused
```
