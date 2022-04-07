---
title: Encrypt a zip archive
tag: devops
---

When you're using the `zip` CLI on your machine or a remote server and you need some extra security you can use the `-e` flag to encrypt a zip archive. Be sure to use a super long random password for this.

`zip -e secure-files.zip ~/Documents/*.pdf`

```
-e       
--encrypt
       
  Encrypt the contents of the zip archive using a password which is entered on
  the  terminal  in response to a prompt (this will not be echoed; if standard
  error is not a tty, zip will exit with an error).  The  password  prompt  is
  repeated to save the user from typing errors.
```
