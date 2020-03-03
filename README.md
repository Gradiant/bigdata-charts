# charts
Curated Big Data charts for Kubernetes.

## Install chart from helm repository
charts in charts/ folder are packaged and available at Gradiant's helm repo:  

[https://gradiant.github.io/charts/](https://gradiant.github.io/charts/)

You can add the helm repo to your Helm CLI:

```
helm repo add gradiant https://gradiant.github.io/charts/
```

Then you have a collection of charts available to install. For example, to install hdfs:

```
helm install --name hdfs gradiant/hdfs
```

## Install chart from release

install using the URL of the release. For example, to install hdfs v0.1.0 chart:

```
helm install --name hdfs https://github.com/Gradiant/charts/releases/download/hdfs-0.1.0/hdfs-0.1.0.tgz
```
