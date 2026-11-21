#!/bin/bash
# Weekly backup of /etc to the NFS share mounted at /mnt/backups.
# crontab:  0 6 * * 0 /usr/local/bin/backup_etc.sh   (Sundays at 06:00)
DATE=$(date +%Y-%m-%d-%H%M%S)
BACKUP_DIR=/mnt/backups
tar -czf "$BACKUP_DIR/etc-backup-$DATE.tar.gz" /etc
