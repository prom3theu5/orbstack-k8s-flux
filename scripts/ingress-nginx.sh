#!/bin/bash
set -euo pipefail

echo "🌐 Applying ingress-nginx controller..."
kubectl apply -f ./apps/nginx/nginx.yaml

echo "⏳ Waiting for ingress-nginx to be ready..."
kubectl wait --for=condition=available deployment/ingress-nginx-controller -n ingress-nginx --timeout=60s || true

echo "✅ ingress-nginx controller is ready"

echo ""