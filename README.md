# Data Engineering Workbench Fall 2020 v.8

## Background: A Data Engineering Workbench Docker-Compose Stack

This is repository is intended to serve as a reliable laptop-analytics platform leveraging 
all of the components for running Spark, Hive and Livy. As-is, it is not intended to be production-ready and assumes the components will be run locally on your own secure development machine. It is also potentially overkill; if you just want to run pyspark in a notebook, I recommend the excellent official jupyter notebook pyspark image:  https://github.com/jupyter/docker-stacks . 

This stack is intended to aid in debugging Spark jobs and java dependencies as well as providing a permanent notebook analytics environment leveraging all of the technologies one would find in an cloud hadoop spark data pipeline. to that end, several additional Java dependencies are added to the downloaded source  builds downloaded as a part of the docker-compose build process.


## Installation
Run on a 2020 13 inch Macbook Pro. Assumes a working docker compose installation and access to the internet. I would recommend increasing docker for mac memory 

1. ) Set the directory spark will read and write from  with the following, substituting <Some Dir > for a directory like `~/Documents` or `~/Downloads` on a Macbook.

    export BENCH_DATA_DIR=<Some Dir> >> ~/.bashrc && \
    source ~/.bashrc

2. ) From the root of this directory, run:

    ./dewb init

This builds a (very large) base image with the Spark, Hive and Hadoop binaries and several worker services on top of that. 

3. ) Listen to this for like 10 mins as #2 runs: 
https://www.youtube.com/watch?v=YAWd1Q9Xd-E


4. ) Run `./dewb up` Look for the jupyterlab `http://127.0.0.1:8888` hostname with the jupyterlogin token appended in the command terminal output for your jupyterlab browner url. 

There is a strong chance the spark workers will fail if this is your first time running everything... this is fine; Spark has an auto-retry baked in, so the workers should connect to the master node after a few 10s of seconds.

5. ) Be brilliant.

Heavily inspired by and liberally borrowed from: https://github.com/mvillarrealb/docker-spark-cluster