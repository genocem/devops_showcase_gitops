#!/bin/bash
set -e
cd "$(dirname "$0")"
kubectl apply -f grafana_email.yaml 
helm upgrade --install promstack prometheus-community/kube-prometheus-stack --namespace monitoring --create-namespace -f promstack_values.yml --wait 
kubectl apply -f alloy-configmap.yaml
helm upgrade --install --namespace monitoring alloy grafana/alloy -f alloy-values.yaml --wait
helm upgrade --install loki grafana/loki --namespace monitoring -f loki_values.yaml --wait 
