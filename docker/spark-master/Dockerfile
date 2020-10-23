FROM spark-base:2.7.7
COPY start-master.sh /opt/spark/bin/start-master.sh
COPY spark-env.sh $SPARK_HOME/conf/spark-env.sh
RUN chown -R root /opt/spark/bin/start-master.sh && chmod +x /opt/spark/bin/start-master.sh &
EXPOSE  0-65535
CMD ["/opt/spark/bin/start-master.sh"]