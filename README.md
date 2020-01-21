# docker-kubectl

A base image for Kubectl.

Base on `alpine:3.11`.


### Usage

Standard Kubernetes:

```
docker run --name kubectl --rm -v /path/to/.kube:/root/.kube simonjensen/docker-kubectl:latest kubectl config get-contexts
```


The image also comes with `doctl` for communicating with Digital Ocean Kubernetes. To make this work, you simply provide an API token for the environment variable `DIGITALOCEAN_ACCESS_TOKEN`:

```
docker run --name kubectl --rm -v /path/to/.kube:/root/.kube -e DIGITALOCEAN_ACCESS_TOKEN=<your-token-here> simonjensen/docker-kubectl:latest kubectl config get-contexts
```
