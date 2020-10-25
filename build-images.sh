#!/bin/bash

set -e

mkdir -p ./files/jupyter
mkdir -p ./files/hive
mkdir -p ./files/spark
mkdir -p ./files/hadoop
mkdir -p $HOME/Workdir

docker build -t spark-base:2.7.7 ./docker/base
docker build -t spark-master:2.7.7 ./docker/spark-master
docker build -t spark-worker:2.7.7 ./docker/spark-worker
docker build -t livy:0.7.0 ./docker/livy
docker build -t mysql:8.0.0 ./docker/mysql
docker build -t jupyterlab:latest ./docker/jupyter