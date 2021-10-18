ARG SOURCE_IMAGE=base_pyspark
ARG JAVA_VERSION=11
FROM $SOURCE_IMAGE
# FROM jupyter-6za
ENV APACHE_SPARK_VERSION 3.1.2
ENV HADOOP_VERSION 3.2
ENV openjdk_version $JAVA_VERSION
ENV py4j_version 0.10.9

RUN echo {JAVA_VERSION}

RUN apt-get -y update && \
    apt-get install --no-install-recommends -y openjdk-${JAVA_VERSION}-jre-headless ca-certificates-java wget && \
    rm -rf /var/lib/apt/lists/*

RUN cd /tmp && \
    wget -q "https://archive.apache.org/dist/spark/spark-${APACHE_SPARK_VERSION}/spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" && \
    echo "2385CB772F21B014CE2ABD6B8F5E815721580D6E8BC42A26D70BBCDDA8D303D886A6F12B36D40F6971B5547B70FAE62B5A96146F0421CB93D4E51491308EF5D5 *spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" | sha512sum -c - && \
    tar xzf spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -C /usr/local --owner root --group root --no-same-owner && \
    rm spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz
RUN cd /usr/local && ln -s spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark

# Spark and Mesos config
ENV SPARK_HOME /usr/local/spark
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-$py4j_version-src.zip
ENV SPARK_OPTS --driver-java-options=-Xms1024M --driver-java-options=-Xmx4096M --driver-java-options=-Dlog4j.logLevel=info

RUN pip3 install --no-cache-dir \
    https://dist.apache.org/repos/dist/release/incubator/toree/0.4.0-incubating/toree-pip/toree-0.4.0.tar.gz \
    && \
    jupyter toree install --sys-prefix && \
    rm -rf /root/.local 
