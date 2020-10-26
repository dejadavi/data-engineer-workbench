# spark-workbench
Data Engineering Docker-Compose Stack

1. ) Set the directory spark will read and write from  with the following, substituting <Some Dir > for a directory like `~/Documents` or `~/Downloads` on a Macbook.

    export BENCH_DATA_DIR=<Some Dir> >> ~/.bashrc && \
    source ~/.bashrc

2. ) From the root of this directory, run:

    ./dewb init

This builds a (very large) base image with the Spark, Hive and Hadoop binaries and several worker services on top of that. 

3. ) Listen to this for like 10 mins as #2 runs: 
https://www.youtube.com/watch?v=YAWd1Q9Xd-E


4. ) Run `./dewb up` Look for the jupyterlab `http://127.0.0.1:8888` hostname with the jupyterlogin token appended in the command terminal output for your jupyterlab brower url. 

There is a strong chance the spark workers will fail if this is your first time running everything... this is fine; Spark has an autoretry baked in, so the workers should connect to the master node after a few 10s of seconds.

5. ) Be brilliant.