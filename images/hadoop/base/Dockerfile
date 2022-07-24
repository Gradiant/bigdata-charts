FROM debian:9-slim

MAINTAINER itzhang89 <itzhang89@163.com>

ENV HADOOP_VERSION=${HADOOP_VERSION:-3.2.3}
ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
ENV HADOOP_HOME /opt/hadoop
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
ENV PATH $HADOOP_HOME/bin/:$PATH
ENV MULTIHOMED_NETWORK 1
ENV USER root
ENV HADOOP_CONF_DIR /etc/hadoop

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      openjdk-8-jdk \
      net-tools \
      curl \
      netcat \
      gnupg \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://dist.apache.org/repos/dist/release/hadoop/common/KEYS && gpg --import KEYS

RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
    && gpg --verify /tmp/hadoop.tar.gz.asc \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && ln -s /opt/hadoop-$HADOOP_VERSION $HADOOP_HOME \
    && mkdir $HADOOP_HOME/logs \
    && ln -s $HADOOP_HOME/etc/hadoop /etc/hadoop \
    && rm /tmp/hadoop.tar.gz*

ADD entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]