opentsdb
========
Store and serve massive amounts of time series data without losing granularity.


Current chart version is `0.1.0`

Source code can be found [here](http://opentsdb.net/)


## Installing the Chart

Add gradiant helm repo:

```
helm repo add gradiant https://gradiant.github.io/charts
```

To install the chart with the release name `opentsdb`.

```
$ helm install --name opentsdb gradiant/opentsdb
```

## Chart Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://gradiant.github.io/charts | hbase | ~0.1.0 |

## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| antiAffinity | string | `"soft"` |  |
| conf."tsd.core.auto_create_metrics" | bool | `true` |  |
| conf."tsd.core.auto_create_tagks" | bool | `true` |  |
| conf."tsd.core.auto_create_tagvs" | bool | `true` |  |
| conf."tsd.storage.hbase.zk_quorum" | string | `nil` |  |
| daemons | int | `1` |  |
| hbase.enabled | bool | `true` |  |
| hbaseConfigMapName | string | `nil` |  |
| hbaseImage.repository | string | `"gradiant/hbase-base"` |  |
| hbaseImage.tag | string | `"2.0.1"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"gradiant/opentsdb"` |  |
| image.tag | string | `"2.4.0"` |  |
| nodePort.enabled | bool | `false` |  |
| nodePort.externalPort | int | `31042` |  |
| port | int | `4242` |  |
| resources.limits.cpu | string | `"1000m"` |  |
| resources.limits.memory | string | `"2048Mi"` |  |
| resources.requests.cpu | string | `"10m"` |  |
| resources.requests.memory | string | `"256Mi"` |  |
