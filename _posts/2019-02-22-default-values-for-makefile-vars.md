---
title: Default values for Makefile vars
tag: workflow
---

Assign default values to a makefile

```shell
#!make
test:
	echo $(or $(MSG), 'No message')
```

Without a value:

```shell
$ make test
echo 'No message'
No message
```

With a value:

```shell
$ make test MSG=🤮
echo 🤮
🤮
```
