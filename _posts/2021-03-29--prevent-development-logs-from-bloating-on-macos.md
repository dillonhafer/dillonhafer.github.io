---
title: 🚯 Prevent development logs from bloating on macOS
tag: workflow
---

I rarely need to refer to `development.log` or `test.log` when working on rails applications, but yet I end up keeping weeks or even years of records [gigabytes]. I'm used to working with `logrotate`, and I wanted to find a similar solution that was preinstalled with macOS. macOS comes preinstalled with a program called `newsyslog` that can keep file sizes in check. I just created a new file at `/etc/newsyslog.d/rails.conf` which limits all rail's log files to just 10MB

```
# /etc/newsyslog.d/rails.conf
# logfilename                       	                        [owner:group]      mode count size(KB)     when  flags [/pid_file] [sig_num]
/Users/<username>/dev/<rails projects>/*/log/*.log     		    <username>:staff   644  0     10000  		*     G
# Mono repos
/Users/<username>/dev/<rails projects>/*/*/log/*.log     	    <username>:staff   644  0     10000  		*     G
# Deeper mono repos
/Users/<username>/dev/<rails projects>/*/*/*/log/*.log          <username>:staff   644  0     10000  		*     G
```

You can also perform a dryrun of the config for testing:

```
sudo newsyslog -v -n -f /etc/newsyslog.d/rails.conf
```
