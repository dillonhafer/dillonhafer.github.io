---
title: Use encrypted env vars with direnv
tag: workflow
---

Direnv can execute shell scripts, so given that your env file is encrypted, you can automatically have it become decrypted for you:

```sh
───────┬──────────────────────
       │ File: .env
───────┼──────────────────────
   1   │ STRIPE_PK="123456789"
   2   │ API_KEY="qwertyuiop"
───────┴──────────────────────
```

Say is was encrypted:

```sh
ansible-vault encrypt --vault-password-file config/master.key .env
cat .env
───────┬─────────────────────────────────────────────────────────────────────────────────
       │ File: .env
───────┼─────────────────────────────────────────────────────────────────────────────────
   1   │ $ANSIBLE_VAULT;1.1;AES256
   2   │ 35306466356632363334643432343132356662376462333964366534393462366333623764336161
   3   │ 6131336435323834623539323462626235383330346562660a323534656133653237656634346235
   4   │ 30653635663438313931393966383266663535313361613339396234373164323830373262633661
   5   │ 6262356131306530350a643362623636323762656132326363323736633431396463616137343139
   6   │ 66666438623230333636373563393165333562633964616536663363323334343235386465346663
   7   │ 3365643263643766323835356230636539353034643034346136
───────┴─────────────────────────────────────────────────────────────────────────────────
```

Now that we have an encrypted .env file, we just need direnv to decrypt it whenever we're in our directory:

```sh
───────┬────────────────────────────────────────────────────────────────────────────────────────────────
       │ File: .envrc
───────┼────────────────────────────────────────────────────────────────────────────────────────────────
   1   │ export $(ansible-vault decrypt --vault-password-file config/master.key --output - .env | xargs)
───────┴────────────────────────────────────────────────────────────────────────────────────────────────
```
Output:

```sh
$ cd rails_app
direnv: loading ~/dev/rails_app/.envrc
direnv: export +API_KEY +STRIPE_PK
echo $API_KEY
qwertyuiop
```

Now whenever we enter the directory, we will have the unencrypted env vars, but the file remains encrypted on disk. For whatever that's worth.
