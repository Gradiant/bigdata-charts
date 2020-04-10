hbase
=====

HBase is an open-source non-relational distributed database modeled after Google's Bigtable and written in Java.

Current chart version is `0.1.3`

Source code can be found [here](https://hbase.apache.org/)

## Chart Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://gradiant.github.io/charts | hdfs | ~0.1.4 |
| https://kubernetes-charts-incubator.storage.googleapis.com/ | zookeeper | ~2.1.0 |

## Installing the Chart

Add gradiant helm repo:

```
helm repo add gradiant https://gradiant.github.io/charts
```

To install the chart with the release name `hbase`:

```
$ helm install --name hbase gradiant/hbase
```

The chart will also install required zookeeper and hdfs by default. 
To only install hbase and provide external zookeeper and/or hdfs:

```
$ helm install --name hbase 
  --set hdfs.enabled=false \
  --set conf.hbaseSite."hbase.rootdir"="hdfs://my-hdfs:8020/hbase" \
  --set zookeeper.enabled=false \
  --set conf.hbaseSite."hbase.zookeeper.quorum"="my-zookeeper:2181" \
  gradiant/hbase
```

```
 and setup an external hdfs and zookeper by setting hdfs.enabled=false and h

## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| antiAffinity | string | `"soft"` |  |
| conf.hbaseSite."hbase.rootdir" | string | `"{{.Release.Name}}-hdfs-namenode:8020/hbase"` |  |
| conf.hbaseSite."hbase.zookeeper.quorum" | string | `"{{.Release.Name}}-zookeeper:2181"` |  |
| hbase.master.resources.limits.cpu | string | `"1000m"` |  |
| hbase.master.resources.limits.memory | string | `"2048Mi"` |  |
| hbase.master.resources.requests.cpu | string | `"10m"` |  |
| hbase.master.resources.requests.memory | string | `"256Mi"` |  |
| hbase.regionServer.replicas | int | `1` |  |
| hbase.regionServer.resources.limits.cpu | string | `"1000m"` |  |
| hbase.regionServer.resources.limits.memory | string | `"2048Mi"` |  |
| hbase.regionServer.resources.requests.cpu | string | `"10m"` |  |
| hbase.regionServer.resources.requests.memory | string | `"256Mi"` |  |
| hbaseVersion | string | `"2.0.1"` |  |
| hdfs.enabled | bool | `true` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"gradiant/hbase-base"` |  |
| image.tag | string | `"2.0.1"` |  |
| prometheus.config.lowercaseOutputLabelNames | bool | `true` |  |
| prometheus.config.lowercaseOutputName | bool | `true` |  |
| prometheus.config.rules[0].labels.namespace | string | `"$1"` |  |
| prometheus.config.rules[0].labels.region | string | `"$3"` |  |
| prometheus.config.rules[0].labels.table | string | `"$2"` |  |
| prometheus.config.rules[0].name | string | `"HBase_metric_$4"` |  |
| prometheus.config.rules[0].pattern | string | `"Hadoop\u003cservice=HBase, name=RegionServer, sub=Regions\u003e\u003c\u003eNamespace_([^\\W_]+)_table_([^\\W_]+)_region_([^\\W_]+)_metric_(\\w+)"` |  |
| prometheus.config.rules[1].labels.name | string | `"$2"` |  |
| prometheus.config.rules[1].labels.sub | string | `"$3"` |  |
| prometheus.config.rules[1].name | string | `"hadoop_$1_$4"` |  |
| prometheus.config.rules[1].pattern | string | `"Hadoop\u003cservice=(\\w+), name=(\\w+), sub=(\\w+)\u003e\u003c\u003e([\\w._]+)"` |  |
| prometheus.config.rules[2].pattern | string | `".+"` |  |
| prometheus.enabled | bool | `true` |  |
| prometheus.image | string | `"spdigital/prometheus-jmx-exporter-kubernetes"` |  |
| prometheus.imageTag | string | `"0.3.1"` |  |
| prometheus.port | int | `5556` |  |
| prometheus.resources | object | `{}` |  |
| prometheus.thriftPort | int | `5557` |  |
| zookeeper.enabled | bool | `true` |  |
| zookeeper.replicaCount | int | `1` |  |
