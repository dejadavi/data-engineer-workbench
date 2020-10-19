#!/bin/bash

. "/opt/spark/sbin/spark-config.sh"
. "/opt/spark/bin/load-spark-env.sh"

$SPARK_MASTER_LOG -p $SPARK_WORKER_LOG

ln -sf /dev/stdout $SPARK_WORKER_LOG/spark-worker.out

/opt/spark/sbin/../bin/spark-class org.apache.spark.deploy.worker.Worker --webui-port $SPARK_WORKER_WEBUI_PORT --port $SPARK_WORKER_PORT $SPARK_MASTER >> $SPARK_WORKER_LOG/spark-worker.out
