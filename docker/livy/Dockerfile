FROM spark-base:2.7.7


USER root

WORKDIR /tmp

RUN cd "/tmp" && \
    wget "http://mirror.metrocast.net/apache/incubator/livy/0.7.0-incubating/apache-livy-0.7.0-incubating-bin.zip" && \
    unzip "apache-livy-0.7.0-incubating-bin" && \
    mv  "apache-livy-0.7.0-incubating-bin/"* "/opt/livy/" && \
    rm -rf "apache-livy-0.7.0-incubating-bin.zip"

COPY log4j.properties $LIVY_CONF_DIR/log4j.properties
COPY livy.conf $LIVY_CONF_DIR/conf
COPY hive-site.xml /opt/livy/hive-site.xml
USER root
COPY start-livy.sh /opt/livy/bin/start-livy.sh
RUN chown hadoop:hadoop -R /opt/livy/bin/start-livy.sh &&  chown hadoop:hadoop -R /opt/livy/logs
USER hadoop
EXPOSE  8998
CMD ["/bin/bash", "/opt/livy/bin/start-livy.sh"]