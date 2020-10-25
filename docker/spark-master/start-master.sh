#!/bin/bash
export SPARK_MASTER_HOST=`hostname`

. "/opt/spark/sbin/spark-config.sh"

. "/opt/spark/bin/load-spark-env.sh"

ln -sf /dev/stdout $SPARK_MASTER_LOG/spark-master.out

/opt/hive/init-hive.sh

cd /opt/spark/bin && /opt/spark/sbin/../bin/spark-class org.apache.spark.deploy.master.Master --ip $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT >> $SPARK_MASTER_LOG/spark-master.out
view raw