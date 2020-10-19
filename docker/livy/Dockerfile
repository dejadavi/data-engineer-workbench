FROM spark-base:2.7.7

RUN mkdir -p /opt/livy

WORKDIR /tmp

RUN cd "/tmp" && \
    wget "http://mirror.metrocast.net/apache/incubator/livy/0.7.0-incubating/apache-livy-0.7.0-incubating-bin.zip" && \
    unzip "apache-livy-0.7.0-incubating-bin" && \
    mv  "apache-livy-0.7.0-incubating-bin/"* "/opt/livy/" && \
    rm -rf "apache-livy-0.7.0-incubating-bin.zip"

COPY log4j.properties $LIVY_CONF_DIR/log4j.properties
COPY livy.conf /opt/livy/conf
COPY hive-site.xml /opt/livy/hive-site.xml

RUN mkdir /opt/livy/logs
COPY start-livy.sh /opt/livy/bin/start-livy.sh

EXPOSE  0-65535
CMD ["/bin/bash", "/opt/livy/bin/start-livy.sh"]