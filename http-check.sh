#!/bin/bash
Domain=$1
CURL=$(which curl)
#echo $CURL
if [ -z "$1" ]; then
        echo "usage: http-check.sh <domain.com>"
else
        okstatus=$($CURL -I -s -L  $Domain | grep "OK" | head -n 1 | grep "HTTP/" | cut -d$' ' -f2)
        httpstatus=$($CURL -I -s -L  $Domain  | head -n 1 | grep "HTTP/" | cut -d$' ' -f2)
        if [ "$okstatus" == 200 ]; then
                echo $okstatus
        else
                echo $httpstatus
        fi
fi