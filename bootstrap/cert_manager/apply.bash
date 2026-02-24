#!/bin/bash
set -e

cd "$(dirname "$0")"
helm upgrade --install \
  cert-manager oci://quay.io/jetstack/charts/cert-manager \
  --version v1.19.2 \
  --namespace cert-manager \
  --create-namespace \
  --set crds.enabled=true --wait
  
kubectl apply -f certmanager-issuer-secret.yaml

kubectl apply -f certmanager-cluster-issuer.yaml
kubectl get namespace argocd >/dev/null 2>&1 || kubectl create namespace argocd
kubectl apply -f argocd-certificate.yaml
kubectl apply -f default-certificate.yaml
kubectl get namespace monitoring >/dev/null 2>&1 || kubectl create namespace monitoring
kubectl apply -f monitoring-certificate.yaml
