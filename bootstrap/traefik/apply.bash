#!/bin/bash
set -e
cd "$(dirname "$0")"
helm upgrade --install traefik traefik/traefik --namespace traefik --create-namespace -f traefik_values.yaml --wait
kubectl apply -f traefik-dashboard-login.yaml
# for now i'll just add the charts for the routes manually and in the future everything here will become a helm chart


kubectl apply -f traefik_ingressroute.yaml #ingress route for traefik cause why not
kubectl apply -f argocd_traefik.yaml
kubectl apply -f monitoring_traefik.yaml
#kubectl apply -f services_traefik.yaml #change this to a frontend route


