---
title: Copy remote file to local destination with Ansible
tag: devops
---

Sometime you need to "fetch" a build artifact from an ansible controlled host:

```yml
- name: Retrieve the product!
  fetch:
    flat: yes
    src: "builds/ios/MyApp.ipa"
    dest: "../../products/MyApp.ipa"
```

> This module works like ansible.builtin.copy, but in reverse

Read the documentation: https://docs.ansible.com/ansible/latest/collections/ansible/builtin/fetch_module.html
