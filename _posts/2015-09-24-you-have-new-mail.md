---
title: You have new mail.
tag: workflow
---

Sometimes you forget to give that cron task somewhere to output its results... so it dumps them in your mail box... 📬😣 all 30,000 times it failed to run.

You don't have to delete all those emails one by one 😉 

```sh
echo 'd *' | mail -N
```

`d *` means delete all mail. The `-N` means:

```sh
-N      Inhibit the initial display of message headers
        when reading mail or editing a mail folder.
```
