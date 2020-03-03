spark-standalone
================
Apache Spark™ is a unified analytics engine for large-scale data processing.
This chart deploys a Spark Standalone Cluster in Kubernetes:
more info [here](https://spark.apache.org/docs/latest/spark-standalone.html).


Current chart version is `0.1.0`

Source code can be found [here](https://spark.apache.org/)


## Installing the Chart

Add gradiant helm repo:

```
helm repo add gradiant https://gradiant.github.io/charts
```

To install the chart with the release name `spark-standalone`.

```
$ helm install --name spark-standalone gradiant/spark-standalone
```


## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image | string | `"gradiant/spark"` |  |
| imagePullPolicy | string | `"IfNotPresent"` |  |
| imageTag | string | `"2.4.4-python-alpine"` |  |
| ingress.enabled | bool | `false` |  |
| ingressDomain | string | `"local"` |  |
| master.customEnv | object | `{}` |  |
| master.heapOptions | string | `"-Xms1G -Xmx1G"` |  |
| master.nodeSelector | object | `{}` |  |
| master.podAnnotations | object | `{}` |  |
| master.port | int | `7077` |  |
| master.prometheus.exporter.enabled | bool | `true` |  |
| master.prometheus.exporter.image | string | `"prom/graphite-exporter"` |  |
| master.prometheus.exporter.port | int | `9108` |  |
| master.prometheus.image | string | `"prom/graphite-exporter"` |  |
| master.prometheus.port | int | `9108` |  |
| master.resources | object | `{}` |  |
| master.tolerations | object | `{}` |  |
| master.ui_port | int | `8080` |  |
| worker.ui_port | int | `8080` |  |
| workers | int | `1` |  |
