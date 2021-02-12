# Hive Tutorial


# Required Helm Charts

This tutorial requires the following charts:

- gradiant/hive
- gradiant/jupyter

Add helm repos:

```
helm repo add gradiant https://gradiant.github.io/charts/
```

Install helm charts:

```
helm install hive gradiant/hive
helm install jupyter gradiant/jupyter --set  ingress.enabled=true --set ingress.hosts[0]="jupyter.127-0-0-1.nip.io"
```

Copy notebooks to jupyter server:
```
kubectl cp notebooks/ jupyter-jupyter-0:/home/jovyan
```

Get jupyter access token from jupyter server log:
```
   kubectl logs -f svc/jupyter-jupyter
```

Open [http://jupyter.127-0-0-1.nip.io](http://jupyter.127-0-0-1.nip.io)

open `/notebooks/hive/` to start tutorials.
