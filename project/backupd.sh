#!/bin/bash

dir=$1
backupdir=$2
interval_secs=$3
max_backups=$4

mkdir -p $backupdir
directory_last="/home/vboxuser/project/directory-info.last"
timestamp=$(date +"%Y-%m-%d-%H-%M-%s")
cp -r $dir $backupdir/$timestamp
ls -lR $dir > $directory_last
echo "Backup created: $backupdir/$timestamp"
while true; do
    # Create a timestamped backup
    directory_new="/home/vboxuser/project/directory-info.new"
    ls -lR $dir > $directory_new
    if ! cmp -s $directory_new $directory_last;
    then
        timestamp=$(date +"%Y-%m-%d-%H-%M-%s")
        cp -r $dir $backupdir/$timestamp
        ls -lR $dir > $directory_last
        echo "Backup created: $backupdir/$timestamp"

     # Manage backups by removing older ones if they exceed the max_backups
        backup_count=$(ls $backupdir | wc -l)
        if [ "$backup_count" -gt "$max_backups" ]; then
         oldest_backup=$(ls -t "$backupdir" | tail -1)
         rm -r $backupdir/$oldest_backup
         echo "Deleted oldest backup: $oldest_backup"
        fi
    fi
     # Wait for the specified interval before the next backup
    sleep "$interval_secs"

    
done