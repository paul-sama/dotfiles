#!/bin/bash

backdest=/home/backup
date=$(date "+%F")

backupall="$backdest/arch-full-$date.tgz"
backuphome="$backdest/jary_p-$date.tgz"

sudo tar -czpvf $backupall / --exclude=/home/* --exclude=/mnt/* --exclude=/media/* \
							 --exclude=/proc/* --exclude=/sys/* --exclude=/dev/* \
							 --exclude=/tmp/* --exclude=/lost+found/* \
							 --exclude=/var/cache/pacman/pkg/* \
							 --exclude=/var/empty

sudo tar -czpvf $backuphome /home/jary_p --exclude=/home/jary_p/Downloads/* \
						 	 			 --exclude=/home/jary_p/documents/*

#ls -htr *.tgz|head -n -6|xargs rm
