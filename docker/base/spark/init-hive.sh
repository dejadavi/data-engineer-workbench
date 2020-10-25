#!/bin/bash

FILE=/home/hadoop
if [ ! -f "$FILE" ]; then

    sleep 5
    schematool -dbType mysql -initSchema
    touch /home/hadoop/init
fi