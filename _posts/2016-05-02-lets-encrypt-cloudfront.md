---
title: Let's Encrypt Cloudfront
---

Using <a href="https://letsencrypt.org" target="_blank">Let's Encrypt</a> is very simple for standalone Nginx or Apache configs, but what if you want to use a Let's Encrypt certificate on Amazons's CloudFront?
Well, that's where things can get tricky, but here are the steps:

1. Create a manual certificate and upload the `acme-challenge` files

```bash
sudo letsencrypt-auto certonly --manual -d example.com -d www.example.com
```

2. Upload the certificate to CloudFront

```bash
cd /etc/letsencrypt/live/www.example.com &&
aws iam upload-server-certificate \
--server-certificate-name Name-in-dropdown \
--certificate-body        file://fullchain.pem \
--private-key             file://privkey.pem \
--path                    /cloudfront/
```

3. Choose your new certificate `Name-in-dropdown` in your distribution settings.
