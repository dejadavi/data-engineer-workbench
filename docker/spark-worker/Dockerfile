FROM spark-base:2.7.7

COPY start-worker.sh /opt/spark/bin/start-worker.sh
EXPOSE  0-65535

CMD ["/bin/bash", "/opt/spark/bin/start-worker.sh"]