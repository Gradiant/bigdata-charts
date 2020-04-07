# charts

Curated Big Data charts for Kubernetes.

## Install chart from helm repository

charts in `charts/`` folder are packaged and available at Gradiant's helm repo:  

[https://gradiant.github.io/charts/](https://gradiant.github.io/charts/)

You can add the helm repo to your Helm CLI:

```bash
helm repo add gradiant https://gradiant.github.io/charts/
```

Then you have a collection of charts available to install. For example, to install hdfs:

```bash
helm install --name hdfs gradiant/hdfs
```

## Install chart from release

install using the URL of the release. For example, to install hdfs v0.1.0 chart:

```bash
helm install --name hdfs https://github.com/Gradiant/charts/releases/download/hdfs-0.1.0/hdfs-0.1.0.tgz
```

## Development

- clone repo
- adjust given chart
- bump chart version if required
- run tests
- create pull request with issue id, attach test results if possible

### Requirements

- linting requires docker
- running install or lint-and-install requires access to the kubernetes cluster - can be minikube, kubernetes-in-docker, or real cluster
- `tee` console tool to output to the console and file in the same time

## Linting and testing full deployment

Test specific chart, lint and install, send console logs also to the log file `reports/hdfs.log`:

```bash
scripts/ct.sh lint-and-install \
    --charts charts/hdfs/ \
    --chart-repos incubator=https://kubernetes-charts-incubator.storage.googleapis.com/,gradiant=https://gradiant.github.io/charts \
    | tee reports/hdfs.log
```

## More advanced

- Output to a `reports/hdfs.log`, 
- Create `charts/chart-name/ci/gke-values.yaml` with your custom values, example below:

```yaml
---
persistence:
  nameNode:
    enabled: true
    storageClass: standard-ssd
    accessMode: ReadWriteOnce
    size: 50Gi
  dataNode:
    enabled: true
    storageClass: standard-hdd
    accessMode: ReadWriteOnce
    size: 200Gi

```

- You can provide multiple files in `ci/` folder - for each `ci/*-values.yaml` there will be separate deployment
- Execute full test with linting, installing, upgrading:

```bash
scripts/ct.sh lint-and-install \
    --check-version-increment \
    --upgrade \
    --charts charts/hdfs/ \
    --chart-repos incubator=https://kubernetes-charts-incubator.storage.googleapis.com/,gradiant=https://gradiant.github.io/charts \
    | tee reports/hdfs.log
```

- See `reports/` file for generated console output.
- Ensure to remove any secret data when uploading logs.
