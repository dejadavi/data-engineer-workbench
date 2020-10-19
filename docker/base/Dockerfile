FROM openjdk:8-buster

ENV DAEMON_RUN=true

ENV HADOOP_VERSION=2.7.7
ENV HADOOP_VERSION_SPARK=2.7
ENV HADOOP_HOME=/opt/hadoop
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop/conf
ENV HADOOP_COMMON_DIR=/opt/hadoop
ENV HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native

ENV SCALA_VERSION=2.11.12
ENV SCALA_HOME=/usr/share/scala
ENV SCALA_HOME=/usr/share/scala
ENV HIVE_VERSION=2.3.7
ENV HIVE_HOME=/opt/hive
ENV HIVE_HOME=/opt/hive

ENV SPARK_VERSION=2.4.7
ENV SPARK_HOME=/opt/spark
ENV SPARK_MASTER_PORT=7077
ENV SPARK_MASTER=spark://spark-master:7077
# ENV SPARK_MASTER=localhost:7077
ENV SPARK_MASTER_WEBUI_PORT=8080
ENV SPARK_MASTER_LOG=/opt/spark/logs
ENV PYSPARK_PYTHON=/usr/bin/python3

ENV PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:/opt/hive/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$HIVE_HOME:$PATH

RUN mkdir -p /opt
RUN mkdir -p /opt/spark/tmp && \
    mkdir -p /opt/hive && \ 
    mkdir -p /opt/hadoop && \
    mkdir -p /opt/livy && \
    mkdir -p /tmp/hadoop-$USER_NAME && \
    mkdir -p /tmp/spark-events

WORKDIR /tmp/
RUN apt-get update -y &&\
    apt-get install build-essential -y &&\
    apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev -y &&\
    rm -rf "/tmp/"*
RUN apt-get update -y && \
    apt-get install build-essential -y &&\
    apt-get update && \
    apt-get install curl jq gzip unzip subversion maven  libzbar-dev libblas-dev liblapack-dev gfortran\
    g++ wget procps curl ca-certificates openssl less htop cmake g++ gcc  -y
RUN cd /opt && wget https://www.python.org/ftp/python/3.7.6/Python-3.7.6.tgz &&\
    tar xzf /opt/Python-3.7.6.tgz &&\
    cd Python-3.7.6 &&\
    ./configure --enable-optimizations &&\
    make altinstall &&\
    ln -sfn /usr/local/bin/python3.7 /usr/bin/python3 &&\
    ln -snf /usr/local/bin/python3.7 python3 &&\
    cd /opt && rm -f /opt/Python-3.7.6.tgz &&\
    /usr/bin/python3 --version &&\
    rm -rf "/tmp/"* &&\ 
    rm -rf /var/lib/apt/lists/* 
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py &&\
    python3 get-pip.py --force-reinstall && export PATH=/usr/bin:usr/local/bin:$PATH &&\
    python3 -m pip --version
#Install Python 3 Deps
RUN  /usr/bin/python3 -m pip install --upgrade pip &&\
    /usr/bin/python3  -m pip install  --no-cache Cython && \
    /usr/bin/python3  -m pip install  --no-cache pyspark \
    avro-python3\
    'numpy<1.19.0,>=1.14'\
    pandas\
    spark-nlp\
    avro\
    pyarrow==1.0.*\
    confluent-kafka\
    fastavro\
    nlplib\
    koalas\
    seaborn\
    great-expectations
##Install scala
RUN cd "/tmp" && \
    wget --no-verbose "https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" && \
    tar xzf "scala-${SCALA_VERSION}.tgz" && \
    mkdir "${SCALA_HOME}" && \
    rm "/tmp/scala-${SCALA_VERSION}/bin/"*.bat && \
    mv "/tmp/scala-${SCALA_VERSION}/bin" "/tmp/scala-${SCALA_VERSION}/lib" "${SCALA_HOME}" && \
    ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" && \
    rm -rf "/tmp/"*
RUN export PATH="/usr/local/sbt/bin:$PATH" && \
    apt-get update -y && \
    apt-get install ca-certificates wget tar && \
    mkdir -p "/usr/local/sbt" && \
    wget -qO - --no-check-certificate "https://github.com/sbt/sbt/releases/download/v1.3.13/sbt-1.3.13.tgz" | tar xz -C /usr/local/sbt --strip-components=1 && \
    sbt sbtVersion && \
    rm -rf "/tmp/"* && \ 
    rm -rf /var/lib/apt/lists/* 
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

WORKDIR /opt/spark
# RUN mvn verify