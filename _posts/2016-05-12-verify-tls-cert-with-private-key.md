---
title: Verify TLS certs with private key
---

Hopefully you're never in a situation where you don't know what private key you used to generate your TLS certificate, but if you do... here's how you can check.

__Note: this is better than uploading the certs to production to check on them 😉__

Assuming we have generated a private key named `example.com.key` and a certificate named `example.com.crt` we can use openssl to check that the MD5 hashes are the same:

```
openssl x509 -noout -modulus -in example.com.crt | openssl md5
openssl rsa -noout -modulus -in example.com.key | openssl md5
```

To make things better, you can write a script:

```bash
#!/bin/bash
CERT_MD5=$(openssl x509 -noout -modulus -in example.com.crt | openssl md5)
KEY_MD5=$(openssl rsa -noout -modulus -in example.com.key | openssl md5)
 
if [ "$CERT_MD5" == "$KEY_MD5" ]; then
 echo "Private key matches certificate"
else
  echo "Private key does not match certificate"
fi
```
