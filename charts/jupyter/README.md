jupyter
=======
Helm for jupyter single server with pyspark support.
For jupyterhub chart see [zero-to-jupyterhub](https://zero-to-jupyterhub.readthedocs.io/en/latest/).

Current chart version is `0.1.0`

Source code can be found [here]((https://github.com/gradiant/charts/charts/jupyter)


## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"gradiant/jupyter"` |  |
| image.tag | string | `"6.0.1"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `"jupyter.127-0-0-1.nip"` |  |
| ingress.path | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| lab | bool | `true` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `true` |  |
| persistence.size | string | `"50Gi"` |  |
| persistence.storageClass | string | `nil` |  |
| resources | object | `{}` |  |
| service.externalPort | int | `8888` |  |
| service.nodePort.http | string | `nil` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |
