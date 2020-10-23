FROM spark-base:2.7.7
COPY start-worker.sh /opt/spark/bin/start-worker.sh
COPY spark-env.sh $SPARK_HOME/conf/spark-env.sh
EXPOSE  0-65535
RUN chown root /opt/spark/bin/start-worker.sh
CMD ["/opt/spark/bin/start-worker.sh"]