# docker-kubectl

A base image with `kubectl`, `doctl` and `aws`.

Base on `alpine:3.12`.

Provides the following version:

* `kubectl`: v1.18.6
* `doctl`: v1.46.0
* `aws`: 1.18.55

---

### Usage

Standard Kubernetes:

```bash
docker run --name kubectl --rm \
  -v /path/to/.kube:/root/.kube \
  simonjensen/docker-kubectl:latest \
  kubectl config get-contexts
```

The image also comes with `doctl` for communicating with Digital Ocean Kubernetes. To make this work, you simply provide an API token for the environment variable `DIGITALOCEAN_ACCESS_TOKEN`:

```bash
docker run --name kubectl --rm \
  -e DIGITALOCEAN_ACCESS_TOKEN=<your-token-here> \
  simonjensen/docker-kubectl:latest \
  doctl kubernetes cluster kubeconfig save <cluster-name>
```

Finally we stuffed the `aws`-cli in there as well, making it possible to interact with AWS like below:

```bash
export AWS_ACCESS_KEY_ID=<your-access-key>
export AWS_SECRET_ACCESS_KEY=<your-secret-key>
export AWS_DEFAULT_REGION=<your-default-region>
docker run -it --rm \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
  simonjensen/docker-kubectl:latest \
  aws ecr get-login-password --region $AWS_DEFAULT_REGION
```
