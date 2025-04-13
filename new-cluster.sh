#!/bin/bash
set -euo pipefail

./delete-cluster.sh

echo "Creating Kubernetes cluster in OrbStack..."
orb start k8s
echo ""
echo "🧭 Switching to OrbStack context..."
kubectl config use-context orbstack
echo ""
echo "🔁 Waiting for Kubernetes node to be Ready..."
until kubectl get nodes --no-headers | grep -q " Ready"; do
  sleep 1
done
echo ""
echo "✅ Kube API is up"
echo ""
./scripts/ingress-nginx.sh
./scripts/app-gitea.sh
./scripts/flux-bootstrap.sh

echo "✅ Cluster ready!"