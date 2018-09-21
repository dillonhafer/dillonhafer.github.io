---
title: 🛣pre-commit bypass
---

Sometimes you just want to make a `wip` commit, but the `flow` checker pre-commit hook won't let you... just bypass the hook!

```
git commit -n -m wip
```

`git commit`'s `-n, --no-verify` mode allows you to bypass pre-commit and commit-msg hooks
