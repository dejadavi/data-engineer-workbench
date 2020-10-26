#!/bin/bash

FILE=/opt/hadoop/data/init
if [ ! -f "$FILE" ]; then

    sleep 5
    schematool -dbType mysql -initSchema
    touch /opt/hadoop/data/init
fi