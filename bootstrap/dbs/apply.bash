#!/bin/bash

set -e
cd "$(dirname "$0")"
kubectl apply -f mongo-secret.yaml
kubectl apply -f mongo-init-configmap.yaml
kubectl apply -f mongo-statefulset.yaml
kubectl apply -f mongo-service.yaml
kubectl apply -f redis-statefulset.yaml
kubectl apply -f redis-service.yaml
