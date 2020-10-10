FROM openjdk:alpine

ENV DAEMON_RUN=true
ENV SPARK_VERSION=3.0.1
ENV HADOOP_VERSION=3.2.1
ENV HADOOP_VERSION_SPARK=3.2
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop/conf
ENV SCALA_VERSION=2.12.4
ENV SCALA_HOME=/usr/share/scala
ENV SCALA_HOME=/usr/share/scala
ENV HADOOP_COMMON_DIR=/opt/hadoop
ENV HIVE_HOME=/opt/hive
ENV HIVE_VERSION=3.1.2
ENV SPARK_HOME=/opt/spark
ENV HIVE_HOME=/opt/hive
ENV HADOOP_HOME=/opt/hadoop
ENV PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:/opt/hive/binp:$PATH
ENV HADOOP_COMMON_HOME=/opt/hadoop/share/hadoop/common

RUN mkdir /opt
RUN mkdir /opt/spark && \
    mkdir /opt/hive && \ 
    mkdir /opt/hadoop && \
    mkdir /opt/livy &&\
    mkdir /tmp/hadoop-$USER_NAME

WORKDIR /tmp


RUN apk add --no-cache --virtual=.build-dependencies wget ca-certificates && \
    apk add --no-cache bash curl jq gzip unzip maven  wget procps && \
    cd "/tmp" && \
    wget --no-verbose "https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" && \
    tar xzf "scala-${SCALA_VERSION}.tgz" && \
    mkdir "${SCALA_HOME}" && \
    rm "/tmp/scala-${SCALA_VERSION}/bin/"*.bat && \
    mv "/tmp/scala-${SCALA_VERSION}/bin" "/tmp/scala-${SCALA_VERSION}/lib" "${SCALA_HOME}" && \
    ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" && \
    apk del .build-dependencies && \
    rm -rf "/tmp/"*
    
#Scala instalation
RUN export PATH="/usr/local/sbt/bin:$PATH" && \
    apk update && \
    apk add ca-certificates wget tar && \
    mkdir -p "/usr/local/sbt" && \
    wget -qO - --no-check-certificate "https://github.com/sbt/sbt/releases/download/v1.3.13/sbt-1.3.13.tgz" | tar xz -C /usr/local/sbt --strip-components=1 && \
    sbt sbtVersion

RUN wget --no-verbose "http://www.gtlib.gatech.edu/pub/apache/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz" && \
    tar xzf hadoop-${HADOOP_VERSION}.tar.gz && \
    mv hadoop-${HADOOP_VERSION}/* /opt/hadoop && \
    rm hadoop-${HADOOP_VERSION}.tar.gz

RUN wget --no-verbose "https://apache.cs.utah.edu/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION_SPARK}.tgz" && \
    tar xzf "spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION_SPARK}.tgz" && \
    mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION_SPARK}/* /opt/spark && \
    rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION_SPARK}.tgz

RUN wget --no-verbose "https://downloads.apache.org/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz" && \
    tar xzf "apache-hive-${HIVE_VERSION}-bin.tar.gz" && \
    mv "apache-hive-${HIVE_VERSION}-bin"/* /opt/hive && \
    rm "apache-hive-${HIVE_VERSION}-bin.tar.gz"

COPY spark/*.xml $SPARK_HOME/
COPY spark/*.conf $SPARK_HOME/conf/
COPY hadoop/* $HADOOP_HOME/etc/hadoop/
COPY hive/* $HIVE_HOME/conf/