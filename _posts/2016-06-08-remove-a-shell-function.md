---
title: Remove A Shell Function
---

Say you wrote a function that you don't want anymore:

```bash
# ~/.bashrc
function rake() {
  echo 'rake is gone ;)'
}
```

```bash
$ rake db:migrate
rake is gone ;)
$
```

You can remove it with the `unset` command:

```bash
$ unset -f rake
```

The `-f` flag passed to `unset` ensures that we only remove a function.
