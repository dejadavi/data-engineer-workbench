#!/bin/bash

FILE=/init
if [ ! -f "$FILE" ]; then

    sleep 5
    schematool -dbType mysql -initSchema
    touch /init
fi