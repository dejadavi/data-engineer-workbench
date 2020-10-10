FROM jupyter/base-notebook:latest

USER root
RUN sudo apt-get update && apt-get install gcc python-dev libkrb5-dev -y

COPY requirements.txt /tmp/requirements.txt
RUN /opt/conda/bin/python3 -m pip install -r /tmp/requirements.txt && \
rm -rf /tmp/requirements.txt 

RUN /opt/conda/bin/python3 -m pip install sparkmagic && \
    /opt/conda/bin/python3 -m jupyter nbextension enable --py --sys-prefix widgetsnbextension && \
    /opt/conda/bin/python3 -m jupyter labextension install "@jupyter-widgets/jupyterlab-manager"
 
RUN /opt/conda/bin/python3 -m pip show sparkmagic && \
    cd /opt/conda/lib/python3.8/site-packages && \
    /opt/conda/bin/jupyter kernelspec install  --sys-prefix sparkmagic/kernels/sparkkernel && \
    /opt/conda/bin/jupyter kernelspec install  --sys-prefix sparkmagic/kernels/pysparkkernel && \
    /opt/conda/bin/jupyter kernelspec install  --sys-prefix sparkmagic/kernels/sparkrkernel && \
    /opt/conda/bin/jupyter kernelspec list


ENV SPARKMAGIC_CONF_DIR /opt/conda/bin/sparkmagic
RUN mkdir $SPARKMAGIC_CONF_DIR
COPY sparkmagic_config.json $SPARKMAGIC_CONF_DIR/config.json

RUN fix-permissions /etc/jupyter/ && fix-permissions /home/jovyan

ENV JUPYTER_ENABLE_LAB True
RUN jupyter kernelspec list


EXPOSE 8888