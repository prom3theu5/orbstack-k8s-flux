#!/bin/bash
set -euo pipefail

read -p "❓ Do you want to deploy FluxCD? (y/n) " deploy_fluxcd
if [[ "$deploy_fluxcd" == "y" ]]; then
  echo "🚀 Deploying FluxCD..."
  flux install \
    --components-extra=image-reflector-controller,image-automation-controller \
    --version=v2.5.1 \
    --toleration-keys node-role.kubernetes.io/control-plane
  echo "✅ FluxCD deployed"
else
  echo "❌ Skipping FluxCD deployment"
fi

echo ""