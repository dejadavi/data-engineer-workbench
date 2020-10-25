FROM spark-base:2.7.7
USER root
COPY start-master.sh /opt/spark/bin/start-master.sh
COPY spark-env.sh $SPARK_HOME/conf/spark-env.sh
RUN chown hadoop:hadoop -R /opt/spark/bin/start-master.sh
USER hadoop
EXPOSE  0-65535
CMD ["/opt/spark/bin/start-master.sh"]