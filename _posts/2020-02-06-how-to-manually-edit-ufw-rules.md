---
title: How to manually edit ufw rules
tag: devops
---

Usually you don't want to manually edit ufw, but in this case I just needed to update an ip address across multiple ip4 and ip6 rules. Turns out there is config file that can be **_very_ carefully** edited:

```
$ sudo vim /lib/ufw/user.rules
$ sudo vim /lib/ufw/user6.rules
```

Very carefully update the ip addresses and then reload ufw:

```
$ sudo ufw reload
```
