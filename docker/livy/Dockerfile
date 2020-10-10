FROM spark-base:3.0.1

ENV SPARK_HOME=/opt/spark
ENV HADOOP_HOME=/opt/hadoop
ENV HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop/conf
ENV SPARK_MASTER_PORT=7077
ENV SPARK_MASTER=localhost:7077
ENV SPARK_MASTER_WEBUI_PORT=8080
ENV SPARK_MASTER_LOG=/opt/spark/logs
ENV LIVY_CONF_DIR=/opt/livy/conf

WORKDIR /tmp

RUN wget http://mirror.metrocast.net/apache/incubator/livy/0.7.0-incubating/apache-livy-0.7.0-incubating-bin.zip && \
    unzip apache-livy-0.7.0-incubating-bin && \
    mv  apache-livy-0.7.0-incubating-bin/* /opt/livy/ && \
    rm -rf apache-livy-0.7.0-incubating-bin.zip

COPY log4j.properties $SPARK_HOME/conf/log4j.properties

COPY log4j.properties $LIVY_CONF_DIR/log4j.properties

COPY livy.conf /opt/livy/conf

RUN mkdir /opt/livy/logs
COPY start-livy.sh /opt/livy/bin/start-livy.sh

EXPOSE 8080 7077 6066 8998

CMD ["/bin/bash", "/opt/livy/bin/start-livy.sh"]