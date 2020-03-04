#!/bin/bash

ARGS=$@

docker run -ti --rm \
  --net=host \
  -v $PWD:/gradiant \
  -v $HOME/.kube/config:/root/.kube/config \
  --workdir=/gradiant quay.io/helmpack/chart-testing ct $ARGS