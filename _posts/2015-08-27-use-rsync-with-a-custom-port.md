---
title: Use rsync with a custom port
tag: workflow
---

You can rsync over a custom port for cases when you have custom ssh tunnels setup using rsync's `-e` flag. The `-e` flag tells rsync to use a specific shell, in this case it's still ssh, but with the addition of the `-p` flag.

**Setup a custom tunnel**

`ssh -N -L 2222:10.0.0.2:22 user@remote-machine`

**Use rsync over the custom tunnel**

`rsync -avz -e 'ssh -p 2222' localhost:/files /myfiles`

h/t [Hashrocket til](https://til.hashrocket.com/posts/bde180175e-use-rsync-with-a-custom-port)