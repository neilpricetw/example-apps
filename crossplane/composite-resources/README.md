# Crossplane Composite Resource Examples (XR)

## Overview

This directory contains examples of Crossplane Composite Resources (XRs) that demonstrate how to create custom resources that compose multiple managed resources.

## Prerequisites

See [README.md](../README.md) for Crossplane installation instructions, configuring AWS credentials, and installing AWS providers.

### Install Function

Functions are used to extend Crossplane's capabilities. They are installed once and can be used by multiple compositions.

```bash
kubectl apply -f functions/fn-merge-patch.yaml
```

## Examples

### Install S3 Bucket Composite Resource (XR)

This example demonstrates how to create a custom S3 bucket resource.

```bash
kubectl apply -f XRDs/xrd-bucket.yaml  
kubectl apply -f compositions/bucket.yaml
kubectl apply -f claim/bucket.yaml
```

## Install VPC Composite Resource (XR)

This example demonstrates how to create a custom VPC and subnet resource.

```bash
kubectl apply -f XRDs/xrd-vpc.yaml  
kubectl apply -f compositions/vpc.yaml
kubectl apply -f claim/vpc.yaml
```

## Install Application Composite Resource (XR)

This example demonstrates how to create a custom application resource that composes multiple managed resources.

```bash
kubectl apply -f XRDs/xrd-app.yaml  
kubectl apply -f compositions/app.yaml
kubectl apply -f claim/apps.yaml
```

## Describe Resources and Managed Resources

This section shows how to describe the composite resources and their underlying managed resources.

```bash
kubectl describe -f claim/bucket.yaml
kubectl describe -f claim/vpc.yaml
kubectl describe -f claim/apps.yaml
kubectl get managed
```

## Delete Resources

This section shows how to delete the composite resources and their underlying managed resources.

```bash
kubectl delete -f claim/bucket.yaml
kubectl delete -f compositions/bucket.yaml
kubectl delete -f XRDs/xrd-bucket.yaml 

kubectl delete -f claim/vpc.yaml
kubectl delete -f compositions/vpc.yaml
kubectl delete -f XRDs/xrd-vpc.yaml 

kubectl delete -f claim/apps.yaml
kubectl delete -f compositions/app.yaml
kubectl delete -f XRDs/xrd-app.yaml
```


