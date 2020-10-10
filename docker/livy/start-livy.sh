#!/bin/bash

. "$SPARK_HOME/sbin/spark-config.sh"

. "$SPARK_HOME/bin/load-spark-env.sh"

mkdir -p $SPARK_MASTER_LOG

export SPARK_HOME=/opt/spark

ln -sf /dev/stdout $SPARK_MASTER_LOG/spark-master.out

cd /opt/livy && /opt/livy/bin/livy-server start && tail -f /dev/null
