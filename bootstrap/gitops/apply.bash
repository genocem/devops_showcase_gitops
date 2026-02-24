#!/bin/bash
set -e
cd "$(dirname "$0")"
helm upgrade --install argocd argo/argo-cd -n argocd --create-namespace --set server.extraArgs[0]="--insecure" --wait 
kubectl get namespace argo-rollouts >/dev/null 2>&1 || kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml
kubectl apply -f appset.yaml
kubectl apply -f repo.yaml
