#! /bin/bash

VALUE=`systemctl is-active $1`
echo -e "$VALUE $1"
