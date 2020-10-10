FROM spark-base:3.0.1

COPY start-worker.sh /opt/spark/bin/start-worker.sh

ENV SPARK_WORKER_LOG=/opt/spark/logs
ENV SPARK_MASTER=spark://spark-master:7077

EXPOSE 8081

CMD ["/bin/bash", "/opt/spark/bin/start-worker.sh"]