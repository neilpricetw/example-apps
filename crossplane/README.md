# Crossplane

## Pre-requisites

- AWS credentials with access
- kubectl configured to access your Kubernetes cluster

```
kubectl create ns crossplane-system
```

## Crossplace Installation

### Add the Crossplane Helm repository
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update

### Install the Crossplane core components
helm install crossplane crossplane-stable/crossplane --namespace crossplane-system --create-namespace

## Install AWS S3 Provider

The AWS providers allow you to create and manage AWS resources from Kubernetes.

``` 
kubectl apply -f ./aws-providers/provider.yaml
kubectl get provider # should show HEALTHY: True
```

## Install AWS S3 Provider Config

``` 
kubectl apply -f ./aws-providers/provider-config.yaml
```

## Add AWS Credentials as Kubernetes Secret

To allow the AWS provider to create and manage AWS resources, you need to provide AWS credentials as a Kubernetes secret in the `crossplane-system` namespace. IF you are running this in AWS EKS, you can use IAM roles for service accounts (IRSA) to avoid managing credentials manually.

Create a file called `aws-credentials.ini` with the following content:

```
[default]
aws_access_key_id=****
aws_secret_access_key=****
```

If you are using AWS keys from an assumed role then the file would look like this:

```
[default]
aws_access_key_id=****
aws_secret_access_key=****
aws_session_token=****
```

Then create the Kubernetes secret referencing `aws-credentials.ini`.

```
# delete it first if you wish to recreate it
kubectl delete secret aws-secret -n crossplane-system 

kubectl create secret generic aws-secret -n crossplane-system --from-file=creds=./aws-credentials.ini
```