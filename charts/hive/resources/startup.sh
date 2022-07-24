#!/bin/bash

set -x

# Note. This script set hive paths in hdfs with user hive and ensures hiveServer is runAsUser hive
HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -mkdir /tmp
HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -mkdir -p /user/hive/warehouse
HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -chmod 777 /tmp
HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -chmod g+w /tmp
HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -chmod g+w /user/hive/warehouse
HADOOP_USER_NAME={{ .Values.conf.hdfsAdminUser }} hdfs dfs -chown hive:hive /user/hive/warehouse

$HIVE_HOME/bin/hiveserver2 --hiveconf hive.server2.enable.doAs=false --hiveconf hive.root.logger={{ .Values.conf.logLevel }},console