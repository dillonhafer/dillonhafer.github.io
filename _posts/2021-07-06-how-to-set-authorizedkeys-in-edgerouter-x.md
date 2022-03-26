---
title: How to set authorized_keys in EdgeRouter X
tag: workflow
---

```
scp ~/.ssh/id_rsa.pub edgerouterx:f
ssh edgerouterx
configure
loadkey dillon f
commit
save
exit
rm f
exit
```
