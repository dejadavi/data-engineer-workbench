FROM spark-base:3.0.1
USER root

USER root
RUN sudo apt-get update && apt-get install gcc python-dev libkrb5-dev -y

COPY requirements.txt /tmp/requirements.txt
RUN /opt/conda/bin/python3 -m pip install -r /tmp/requirements.txt && \
rm -rf /tmp/requirements.txt 

RUN /opt/conda/bin/python3 -m pip install pyspark qgrid && \
    /opt/conda/bin/python3 -m jupyter nbextension enable --py --sys-prefix widgetsnbextension && \
    /opt/conda/bin/python3 -m jupyter nbextension enable --py --sys-prefix qgrid &&\
    /opt/conda/bin/python3 -m jupyter labextension install "@jupyter-widgets/jupyterlab-manager" &&\
    /opt/conda/bin/python3 -m jupyter labextension install qgrid2
 

RUN fix-permissions /etc/jupyter/ && \ 
    fix-permissions /home/jovyan && \
    fix-permissions /opt/conda

ENV JUPYTER_ENABLE_LAB=True
RUN jupyter kernelspec list
USER jovyan
EXPOSE 8888



COPY start-master.sh /opt/spark/bin/start-master.sh
COPY spark-env.sh $SPARK_HOME/conf/spark-env.sh
RUN chown hadoop:hadoop -R /opt/spark/bin/start-master.sh
WORKDIR /home/hadoop
USER hadoop
EXPOSE  0-65535



CMD ["/opt/spark/bin/start-master.sh"]