FROM spark-base:3.0.1
USER root
COPY start-worker.sh /opt/spark/bin/start-worker.sh
COPY spark-env.sh $SPARK_HOME/conf/spark-env.sh
RUN chown spark /opt/spark/bin/start-worker.sh
USER spark
WORKDIR /home/spark
EXPOSE  0-65535
CMD ["/opt/spark/bin/start-worker.sh"]