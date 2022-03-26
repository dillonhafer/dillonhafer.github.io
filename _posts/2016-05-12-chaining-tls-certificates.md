---
title: Chaining TLS Certificates 🐱
tag: workflow
---

Apache allows you to declare an intermediate TLS certificate along with your regular certificate in your configuration, but many web servers only allow you to provide one certificate option. Like Nginx, go, or heroku.

In those cases, you will need to concatenate the entire certificate chain into one certificate file. This may sound daunting, but the process is very simple. Let me introduce `cat -- concatenate and print files`.

`cat` is normally used for printing files, but in this case we actually want to con`cat`enate files. Below is a simple example on how we can do this:

```bash
cp example_com.crt example_com.chained.crt
cat AddTrustExternalCARoot.crt >> example_com.chained.crt
cat COMODORSAAddTrustCA.crt >> example_com.chained.crt
cat COMODORSADomainValidationSecureServerCA.crt >> example_com.chained.crt
```

To shorten it, we only need to use `cat` once:

```bash
cp example_com{,.chained}.crt &&
cat AddTrustExternalCARoot.crt COMODORSAAddTrustCA.crt COMODORSADomainValidationSecureServerCA.crt >> example_com.chained.crt
```
