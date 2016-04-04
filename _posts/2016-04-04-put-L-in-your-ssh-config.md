---
title: Put -L in your ssh config
---

If you've used `ssh` you've probably had to use local port forwarding before.
If you use complex flags often, you will find remembering what you need is tiresome.
Stop. Write it down so you can forget all about it. Save your memory.

Instead of doing this:

```
ssh -L 3000:localhost:3002 not_dillon@example.com
```

Add those flags to the `~/.ssh/config` file instead:

```sh
# /home/dillon/.ssh/config

Host example
  User         not_dillon
  Hostname     example.com
  LocalForward 3000 localhost:3002
```

From now on, all you need to type is:

```
ssh example
```
