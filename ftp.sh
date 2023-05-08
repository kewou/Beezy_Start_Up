#!/bin/sh

HOST="ftp.beezyweb.net"
USER="beezyweb.net"
PASSWD="delphine12"
PORT=21
DIR="Beezy_Start_Up"
FILE="test.txt"

ftp -i -n $HOST $PORT <<END_SCRIPT
quote USER $USER
quote PASS $PASSWD
cd $DIR
pwd
bin
put $FILE
quit
END_SCRIPT