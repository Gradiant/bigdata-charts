#!/bin/bash

#: ${HADOOP_PREFIX:=/usr/local/hadoop}

#. $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

# Directory to find config artifacts
#CONFIG_DIR="/tmp/hadoop-config"

set -x

# Copy config files from volume mount
#for f in slaves core-site.xml hdfs-site.xml mapred-site.xml yarn-site.xml; do
#    if [[ -e ${CONFIG_DIR}/$f ]]; then
#    cp ${CONFIG_DIR}/$f $HADOOP_HOME/etc/hadoop/$f
#    else
#    echo "ERROR: Could not find $f in $CONFIG_DIR"
#    exit 1
#    fi

# Note. This script set hive paths in hdfs with user hive and ensures hiveServer is runAsUser hive 

HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -mkdir /tmp
HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -mkdir -p  /user/hive/warehouse
HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -chmod 777 /tmp
HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -chmod g+w /tmp
HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -chmod g+w /user/hive/warehouse
HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -chown hive:hive /user/hive/warehouse


#if id -u hive ; then
#    echo "hive user exists";
#else
#    echo "Creating hive user";
#    groupadd -g 500 -r hive && \
#    useradd --comment "Hive user" -u 500 --shell /bin/bash -M -r -g hive hive
#fi

#if [[ whoami != hive ]]
#then 
#    echo "Switching to hive user";
#    su hive -c "cd $HIVE_HOME/bin; ./hiveserver2 --hiveconf hive.server2.enable.doAs=false"
#else
    cd $HIVE_HOME/bin; ./hiveserver2 --hiveconf hive.server2.enable.doAs=false --hiveconf hive.root.logger={{ .Values.conf.logLevel }},console
#fi