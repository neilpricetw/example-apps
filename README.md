# Crossplane, Helm and ArgoCD Experimentation Repo

## Overview

This repository contains experimentation code for deploying Crossplane resources and Helm chartswith ArgoCD to manage Kubernetes resources which could be running on the cluster or external to it (like cloud resources). 

## Pre-requisites

- Colima with support for Kubernetes

```
colima start --kubernetes --cpu 4 --memory 8 
```

## ArgoCD Setup

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

## ArgoCD Access

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

Then access via `https://localhost:8080`

## ArgoCD Admin Password

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

## ArgoCD UI Repo/Application Setup

1. Login with the admin password
2. Add a new repository
3. Add a new application
4. Select your repository you added in step 2
5. Set the path to the application you want to deploy (e.g. `example-voting-app`)
6. Set the target namespace
7. Click "Create"
8. Wait for the application to sync
