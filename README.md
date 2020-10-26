# spark-workbench
Data Engineering Docker-Compose Stack

1. ) Set the directory spark will read and write from  with the following, substituting <Some Dir > for a directory like `~/Documents` or `~/Downloads` on a Macbook.

    export BENCH_DATA_DIR=<Some Dir> >> ~/.bashrc && \
    source ~/.bashrc

2. ) From The Root Of This Directory, and with  Run:

    ./build-images.sh       

This builds a (very large) base image with the Spark, Hive and Hadoop binaries and several worker services on top of that. 

3. ) Listen to this for like 10 mins as #2 runs: 
https://www.youtube.com/watch?v=YAWd1Q9Xd-E


4.) Run `docker-compose up`

5.) Be brilliant, because you are.