FROM spark-base:3.0.1
USER root

USER root

RUN apt-get update && apt-get install python-dev libkrb5-dev npm  -y &&\
    curl -sL https://deb.nodesource.com/setup_12.x | bash - &&\
    apt-get install -y nodejs


COPY requirements.txt /tmp/requirements.txt
RUN  python3 -m pip install -r /tmp/requirements.txt && \
    rm -rf /tmp/requirements.txt 



RUN NODE_OPTIONS=--max_old_space_size=4096 &&\
    /usr/bin/python3 -m pip install pyspark qgrid && \
    /usr/bin/python3 -m jupyter nbextension enable --py --sys-prefix widgetsnbextension && \
    /usr/bin/python3 -m jupyter nbextension enable --py --sys-prefix qgrid &&\
    /usr/bin/python3 -m jupyter labextension install "@jupyter-widgets/jupyterlab-manager" &&\
    /usr/bin/python3 -m jupyter labextension install qgrid2
 
COPY start-master.sh /opt/spark/bin/start-master.sh
COPY spark-env.sh $SPARK_HOME/conf/spark-env.sh
RUN chown spark:spark -R /opt/spark/bin/start-master.sh
WORKDIR /home/spark
USER spark
EXPOSE  0-65535



CMD ["/opt/spark/bin/start-master.sh"]