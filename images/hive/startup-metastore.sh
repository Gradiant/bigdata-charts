#!/bin/bash

# init the metastore database on the first time
$HIVE_HOME/bin/schematool -dbType postgres -validate || $HIVE_HOME/bin/schematool -dbType postgres -initSchema

# start the metastore server
$HIVE_HOME/bin/hive --service metastore
