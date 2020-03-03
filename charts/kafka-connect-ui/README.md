kafka-connect-ui
================
Helm for Landoop/kafka-connect-ui

Current chart version is `0.1.0`

Source code can be found [here](https://github.com/Landoop/kafka-connect-ui)

## Installing the Chart

Add gradiant helm repo:

```
helm repo add gradiant https://gradiant.github.io/charts
```

To install the chart with the release name `kafka-connect-ui`:

```
$ helm install --name kafka-connect-ui gradiant/kafka-connect-ui
```

## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| connectCluster.url | string | `""` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"landoop/kafka-connect-ui"` |  |
| image.tag | string | `"0.9.7"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `"kafka-connect-ui.127-0-0-1.nip"` |  |
| ingress.path | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |

# References

 Original k8s adaptation this chart was derived from:
  - "https://github.com/astrobounce/helm-kafka-connect-ui"

