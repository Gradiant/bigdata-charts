# Kubernetes in Docker test environment

We recommend [kind](https://kind.sigs.k8s.io/) (kubernetes-in-docker) to have a testing environment for the tutorials.
You also need an [ingress controller installed in your kind cluster](https://kind.sigs.k8s.io/docs/user/ingress/).

The following instructions are just here to keep a receipt of the steps that work for us. 
You should follow kind documentation if you find any problems deploying your kubernetes-in-docker.

Get kind binary:
```
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.10.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
```

Get kubectl:
```
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```

Get helm:
```
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
```

Deploy kind cluster with 80/443 port mappings:
```
cat <<EOF | kind create cluster --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
EOF
```

Deploy nginx ingress-controller:
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml

```

You are ready to go!