#!/bin/bash

dir=$1
backupdir=$2

files=($(ls $backupdir))
len=$(expr ${#files[@]} - 1)
i=$len
while true; do
    echo "1) Restore back"
    echo "2) Restore forward"
    echo "3) Exit"
    read -p "Please choose an option (1-3): " choice

    case $choice in
        1)
            echo "You chose restoring back"
            i=$(expr $i - 1)
            if [ $i -lt 0 ]; then
                echo "No older backup available to restore."
                i=$(expr $i + 1)
            else
                rm -rf $dir/*
                cp -r ${backupdir}/${files[$i]}/* $dir
                echo "Restored to a previous version: ${files[$i]}"
            fi
            ;;
        2)
            echo "You chose restoring forward"
            i=$(expr $i + 1)
            if [ $i -gt $len ]; then
                echo "No newer backup available to restore."
                i=$(expr $i - 1)
            else
                rm -rf $dir/*
                cp -r ${backupdir}/${files[$i]}/* $dir
                echo "Restored to the next version: ${files[$i]}"
            fi
            ;;
        3)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option."
            ;;
    esac
done