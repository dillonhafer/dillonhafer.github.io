---
title: Shell parameter expansion
tag: workflow
---

Shells can perform variable expansion, this is really useful for default argument variables in shell functions.

Here is a simple example of assigning a variable from an argument or defaulting to running a different shell command:

```bash
clog() {
  log_date=${1-`date +%Y-%m-%d`}
  git log --after="$log_date 00:00" --before="$log_date 23:59"
}
```

This allows me to write

`clog` to default to today's date or 

`clog 2018-10-02` to look at the logs from yesterday

The date in the example `clog 2018-10-02` would come through as `$1` in the function, so ``${1-`date`}`` means run this shell command if there is no `$1`.

*references:

[https://www.tldp.org/LDP/abs/html/parameter-substitution.html#USAGEMESSAGE](https://www.tldp.org/LDP/abs/html/parameter-substitution.html#USAGEMESSAGE)
