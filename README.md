# DevOps Showcase GitOps

Kubernetes manifests and GitOps configurations for deploying the application using ArgoCD.

## Architecture Diagram

<!-- TODO: Add architecture diagram showing GitOps workflow -->

## Structure

```
devops_showcase_gitops/
├── bootstrap/
│   ├── startCluster           # Main bootstrap script
│   ├── cert_manager/          # TLS certificate management
│   ├── dbs/                   # Database deployments (MongoDB, Redis)
│   ├── gitops/                # ArgoCD configuration
│   ├── monitoring/            # Prometheus & Grafana
│   └── traefik/               # Ingress controller
├── charts/
│   └── generic_chart/         # Reusable Helm chart
│       ├── templates/
│       └── microservice_values/
│           ├── cart/
│           ├── stock/
│           ├── transaction/
│           └── frontend/
```

## Prerequisites

- Kubernetes cluster (AKS, EKS, GKE, kind, minikube)
- kubectl configured
- Helm 3.x installed

## Bootstrap Cluster

```bash
cd bootstrap
./startCluster
```

Deploys: cert-manager, Traefik, Monitoring, Databases, ArgoCD

### Manual Setup

```bash
./cert_manager/apply.bash
./traefik/apply.bash
./monitoring/apply.bash
./dbs/apply.bash
./gitops/apply.bash
```

## Generic Helm Chart

Reusable chart for all microservices with:
- Deployment with configurable replicas and resources
- ClusterIP Service
- Traefik IngressRoute with TLS
- Rolling update strategy

## Databases

- MongoDB - StatefulSet for data persistence
- Redis - Celery message broker

## Infrastructure Components

| Component | Purpose |
|-----------|---------|
| cert-manager | TLS certificate automation |
| Traefik | Ingress controller with TLS |
| Prometheus | Metrics collection |
| Grafana | Visualization |
| ArgoCD | GitOps continuous deployment |

## GitOps Workflow

1. Push to Git repository
2. ArgoCD detects changes
3. Kubernetes state updated
4. Health check verification

## GitOps Flow Diagram

<!-- TODO: Add diagram showing the GitOps sync workflow -->

## License

MIT License
