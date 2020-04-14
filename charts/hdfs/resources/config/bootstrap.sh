#!/bin/bash

: ${HADOOP_HOME:=/usr/local/hadoop}

. $HADOOP_HOME/etc/hadoop/hadoop-env.sh

# Directory to find config artifacts
CONFIG_DIR="/tmp/hadoop-config"

# Copy config files from volume mount

for f in slaves core-site.xml hdfs-site.xml mapred-site.xml yarn-site.xml; do
    if [[ -e ${CONFIG_DIR}/$f ]]; then
    cp ${CONFIG_DIR}/$f $HADOOP_HOME/etc/hadoop/$f
    else
    echo "ERROR: Could not find $f in $CONFIG_DIR"
    exit 1
    fi
done

# installing libraries if any - (resource urls added comma separated to the ACP system variable)
cd $HADOOP_HOME/share/hadoop/common ; for cp in ${ACP//,/ }; do  echo == $cp; curl -LO $cp ; done; cd -
if [[ $2 == "namenode" ]]; then
    if [ ! -d "/dfs/name" ]; then
    mkdir -p /dfs/name
    $HADOOP_HOME/bin/hdfs namenode -format -force -nonInteractive
    fi
    $HADOOP_HOME/sbin/hadoop-daemon.sh start namenode
fi
if [[ $2 == "datanode" ]]; then
    if [ ! -d "/dfs/data" ]; then
    mkdir -p /dfs/data
    fi
    #  wait up to 30 seconds for namenode
    (while [[ $count -lt 15 && -z `curl -sf http://{{ include "hdfs.fullname" . }}-namenode:50070` ]]; do ((count=count+1)) ; echo "Waiting for {{ include "hdfs.fullname" . }}-namenode" ; sleep 2; done && [[ $count -lt 15 ]])
    [[ $? -ne 0 ]] && echo "Timeout waiting for hdfs namenode, exiting." && exit 1

    $HADOOP_HOME/sbin/hadoop-daemon.sh start datanode
fi
if [[ $1 == "-d" ]]; then
    until find ${HADOOP_HOME}/logs -mmin -1 | egrep -q '.*'; echo "`date`: Waiting for logs..." ; do sleep 2 ; done
    tail -F ${HADOOP_HOME}/logs/* &
    while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
    /bin/bash
fi