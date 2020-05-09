prestosql
=========
Distributed SQL query engine for running interactive analytic queries

Current chart version is `0.1.0`

Source code can be found [here](https://prestosql.io)


## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"prestosql/presto"` |  |
| image.tag | int | `331` |  |
| nodeSelector | object | `{}` |  |
| resources | object | `{}` |  |
| server.config.http.port | int | `8080` |  |
| server.config.path | string | `"/etc/presto"` |  |
| server.config.query.maxMemory | string | `"4GB"` |  |
| server.config.query.maxMemoryPerNode | string | `"1GB"` |  |
| server.jvm.gcMethod.g1.heapRegionSize | string | `"32M"` |  |
| server.jvm.gcMethod.type | string | `"UseG1GC"` |  |
| server.jvm.maxHeapSize | string | `"8G"` |  |
| server.log.presto.level | string | `"INFO"` |  |
| server.node.dataDir | string | `"/presto/etc/data"` |  |
| server.node.environment | string | `"production"` |  |
| server.workers | int | `2` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |

## References

- Original k8s presto adaptation this chart was derived from: https://github.com/helm/charts/tree/master/stable/presto

This chart is modified to work on k8s > 1.16 and with presto server project of prestosql community.