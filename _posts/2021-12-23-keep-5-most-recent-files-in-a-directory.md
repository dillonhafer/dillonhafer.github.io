---
title: Keep 5 most recent files in a directory
tag: workflow
---

One can keep the most recent n files in a directory with just three shell programs: `ls`, `tail`, and `xargs`.

Here is an example to use in a nightly database backup cron job:

```shell
#!/bin/bash
# Keep last 5 files ending in .dump
# Don't forget to 

# Installation
# 1. cp pg-backups.sh /usr/local/bin/
# 2. chmod u+x /usr/local/bin/pg-backups.sh
# 3. Set the DB variable
# 4. Set the BACKUP_DIR variable

# Example usage for cron to run at 4:05 am every day:
# 5 4 * * * /usr/local/bin/pg-backups.sh

DB=mydatabase
BACKUP_DIR=/mnt/object/production/db-backups

DATE=$(date "+%Y-%m-%d_%H%M")
pg_dump -Fc $DB > $BACKUP_DIR/$DATE.dump

/bin/ls -t $BACKUP_DIR/*.dump | tail +6 | xargs rm
```
