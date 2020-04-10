#!/bin/bash
#set -x # increase verbosity
set -e # exit on error
set -a # export vars as env vars
# Small script to setup the HBase tables used by OpenTSDB.
# notice that this can be also set as ENV var inside of container image (as in dockerfile)
test -n "$HBASE_PREFIX" || {
    echo >&2 'The environment variable HBASE_PREFIX must be set'
    exit 1
}
test -d "$HBASE_PREFIX" || {
    echo >&2 "No such directory: HBASE_PREFIX=$HBASE_PREFIX"
    exit 1
}
cp /tmp/hbase-config/* $HBASE_PREFIX/conf/

TSDB_TABLE=${TSDB_TABLE-'tsdb'}
UID_TABLE=${UID_TABLE-'tsdb-uid'}
TREE_TABLE=${TREE_TABLE-'tsdb-tree'}
META_TABLE=${META_TABLE-'tsdb-meta'}
BLOOMFILTER=${BLOOMFILTER-'ROW'}
# LZO requires lzo2 64bit to be installed + the hadoop-gpl-compression jar.
COMPRESSION=${COMPRESSION-'GZ'}
# All compression codec names are upper case (NONE, LZO, SNAPPY, etc).
COMPRESSION=${COMPRESSION^^}
# DIFF encoding is very useful for OpenTSDB's case that many small KVs and common prefix.
# This can save a lot of storage space.
DATA_BLOCK_ENCODING=${DATA_BLOCK_ENCODING-'DIFF'}
DATA_BLOCK_ENCODING=${DATA_BLOCK_ENCODING^^}
# set 'time to live' in seconds for data, allows automatic data retention which will be handled by HBase itself
TSDB_TTL=${TSDB_TTL-'FOREVER'}

case $COMPRESSION in
    (NONE|LZO|GZ|SNAPPY)  :;;  # Known good.
    (*)
    echo >&2 "warning: compression codec '$COMPRESSION' might not be supported."
    ;;
esac
# test if compression algorithm is supported by hbase installation (lowercase compression var)
echo "Checking if given compression is supported..."
$HBASE_PREFIX/bin/hbase org.apache.hadoop.hbase.util.CompressionTest file:///tmp/testfile ${COMPRESSION,,}

case $DATA_BLOCK_ENCODING in
  (NONE|PREFIX|DIFF|FAST_DIFF|ROW_INDEX_V1)  :;; # Know good
  (*)
    echo >&2 "warning: encoding '$DATA_BLOCK_ENCODING' might not be supported."
    ;;
esac

# render hbase script to fill in env vars
( echo "cat <<EOF" ; cat /tmp/init/hbase_script.txt ; echo ; echo EOF ) | bash > $HBASE_PREFIX/conf/hbase_script_parsed.txt
echo "HBase script:"
echo "----"
cat $HBASE_PREFIX/conf/hbase_script_parsed.txt
echo "----"

echo "Checking if opentsdb $UID_TABLE hbase table exists"
ret=$( echo "exists '$UID_TABLE'" | $HBASE_PREFIX/bin/hbase shell -n )
if [[ $ret == *"true"* ]];
then
    echo "OpenTSDB tables already created."
    exit 0
else
    echo "Creating OpenTSDB hbase tables:"
    $HBASE_PREFIX/bin/hbase shell -n $HBASE_PREFIX/conf/hbase_script_parsed.txt
    echo "DONE"
fi
