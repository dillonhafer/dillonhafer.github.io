---
title: Limit SSH by IP address
tag: devops
---

SSH has some nice security features like password-less authentication. For the sysadmin who wants even more fine-grained control, the ssh configuration has a setting for what users are allowed to authenticate based on their IP address.

```bash
# /etc/ssh/sshd_config
AllowUsers admin@127.0.0.1 deployer@127.0.0.1 git@*
```

This configuration says that `admin` & `deployer` are only allowed to login from `127.0.0.1`, but `git` can login from any IP address. You can also use wildcards the other way:

```bash
AllowUsers *@127.0.0.1
```
The most useful thing here is the ability to use `*` to match users and hosts.

h/t  [Chris Erin](http://til.hashrocket.com/authors/chriserin)
