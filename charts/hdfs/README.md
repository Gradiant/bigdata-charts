
# HDFS Chart

** This chart is a modification of the original (https://github.com/helm/charts/tree/master/stable/hadoop) **
** This version removes yarn manager and provides advanced hadoop configuration through env variables ** 

[Hadoop HDFS](https://hadoop.apache.org/) is a distributed file system designed to run on commodity hardware. 

## Installing the Chart

Add gradiant helm repo:

```
helm repo add gradiant https://gradiant.github.io/charts
```

To install the chart with the release name `hdfs`:

```
$ helm install --name hdfs gradiant/hdfs
```

### Persistence

To install the chart with persistent volumes:

```
$ helm install --name hadoop 
  --set persistence.nameNode.enabled=true \
  --set persistence.nameNode.storageClass=standard \
  --set persistence.dataNode.enabled=true \
  --set persistence.dataNode.storageClass=standard \
  gradiant/hdfs
```

> Change the value of `storageClass` to match your volume driver. `standard` works for Google Container Engine clusters.
> Or create custom storage class with `WaitForFirstConsumer` prior deployment of the chart - see [Enabling delayed volume binding](https://cloud.google.com/kubernetes-engine/docs/how-to/persistent-volumes/local-ssd#delay) especially for multi-zone clusters.

## Configuration

The following table lists the configurable parameters of the Hadoop chart and their default values.
For more details ensure to see `values.yaml` file directly.

## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| antiAffinity | string | `"soft"` |  |
| conf.coreSite | string | `nil` |  |
| conf.hdfsSite."dfs.replication" | int | `3` |  |
| dataNode.pdbMinAvailable | int | `3` |  |
| dataNode.replicas | int | `3` |  |
| dataNode.resources.limits.cpu | string | `"1000m"` |  |
| dataNode.resources.limits.memory | string | `"2048Mi"` |  |
| dataNode.resources.requests.cpu | string | `"10m"` |  |
| dataNode.resources.requests.memory | string | `"256Mi"` |  |
| httpfs.adminPort | int | `14001` |  |
| httpfs.port | int | `14000` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"gradiant/hadoop-base"` |  |
| image.tag | string | `"2.7.7"` |  |
| ingress.dataNode.annotations | object | `{}` |  |
| ingress.dataNode.enabled | bool | `false` |  |
| ingress.dataNode.hosts[0] | string | `"hdfs-datanode.local"` |  |
| ingress.dataNode.labels | object | `{}` |  |
| ingress.dataNode.path | string | `"/"` |  |
| ingress.httpfs.annotations | object | `{}` |  |
| ingress.httpfs.enabled | bool | `false` |  |
| ingress.httpfs.hosts[0] | string | `"httpfs.local"` |  |
| ingress.httpfs.labels | object | `{}` |  |
| ingress.httpfs.path | string | `"/"` |  |
| ingress.nameNode.annotations | object | `{}` |  |
| ingress.nameNode.enabled | bool | `false` |  |
| ingress.nameNode.hosts[0] | string | `"hdfs-namenode.local"` |  |
| ingress.nameNode.labels | object | `{}` |  |
| ingress.nameNode.path | string | `"/"` |  |
| nameNode.pdbMinAvailable | int | `1` |  |
| nameNode.port | int | `8020` |  |
| nameNode.resources.limits.cpu | string | `"1000m"` |  |
| nameNode.resources.limits.memory | string | `"2048Mi"` |  |
| nameNode.resources.requests.cpu | string | `"10m"` |  |
| nameNode.resources.requests.memory | string | `"256Mi"` |  |
| persistence.dataNode.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.dataNode.enabled | bool | `false` |  |
| persistence.dataNode.size | string | `"200Gi"` |  |
| persistence.dataNode.storageClass | string | `nil` |  |
| persistence.nameNode.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.nameNode.enabled | bool | `false` |  |
| persistence.nameNode.size | string | `"50Gi"` |  |
| persistence.nameNode.storageClass | string | `nil` |  |
| prometheus.exporter.enabled | bool | `true` |  |
| prometheus.exporter.image | string | `"marcelmay/hadoop-hdfs-fsimage-exporter:1.2"` |  |
| prometheus.exporter.port | int | `5556` |  |


# References

- This is a variation of the hadoop helm chart of stable helm repo (https://github.com/helm/charts/tree/master/stable/hadoop).

- Original K8S Hadoop adaptation this chart was derived from: https://github.com/Comcast/kube-yarn
