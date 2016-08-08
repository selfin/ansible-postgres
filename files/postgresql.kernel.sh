#!/bin/sh

#http://creativemohan.com/?cat=11
page_size=`getconf PAGE_SIZE`
phys_pages=`getconf _PHYS_PAGES`
shmall=`expr $phys_pages / 2`
shmmax=`expr $shmall \* $page_size`

#running sysctl
sysctl -w vm.swappiness=0
sysctl -w kernel.shmmax="$shmmax"
sysctl -w kernel.shmall="$shmall"

#/etc/sysctl.conf
echo "vm.swappiness=0" >> /etc/sysctl.conf
echo "kernel.shmmax=$shmmax" >> /etc/sysctl.conf
echo "kernel.shmall=$shmall" >> /etc/sysctl.conf

echo "kernel.shmmax=$shmmax kernel.shmall=$shmall" > /test.log
