#!/bin/bash

set -e

docker build -t spark-base:3.0.1 ./docker/base
docker build -t spark-master:3.0.1 ./docker/spark-master
docker build -t spark-worker:3.0.1 ./docker/spark-worker
docker build -t spark-submit:3.0.1 ./docker/spark-submit
docker build -t livy:0.7.0 ./docker/livy
docker build -t mysql:8.0.0 ./docker/mysql
docker build -t jupyterlab:latest ./docker/jupyter