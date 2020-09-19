# docker-kubectl

A base image with `kubectl` and `doctl`.

Base on `alpine:3.12`.

Provides the following version:

* `kubectl`: v1.18.6
* `doctl`: v1.46.0


### Usage

Standard Kubernetes:

```
docker run --name kubectl --rm -v /path/to/.kube:/root/.kube simonjensen/docker-kubectl:latest kubectl config get-contexts
```


The image also comes with `doctl` for communicating with Digital Ocean Kubernetes. To make this work, you simply provide an API token for the environment variable `DIGITALOCEAN_ACCESS_TOKEN`:

```
docker run --name kubectl --rm -e DIGITALOCEAN_ACCESS_TOKEN=<your-token-here> simonjensen/docker-kubectl:latest doctl kubernetes cluster kubeconfig save <cluster-name>
```
