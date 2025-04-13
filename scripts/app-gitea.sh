#!/bin/bash
set -euo pipefail

read -p "❓ Do you want to deploy Gitea? (y/n) " deploy_gitea
if [[ "$deploy_gitea" == "y" ]]; then
  echo "🚀 Deploying Gitea..."
  helm upgrade --install gitea ./apps/gitea/chart \
  -n gitea --create-namespace \
  -f ./apps/gitea/values.yaml
  echo "✅ Gitea deployed"
else
  echo "❌ Skipping Gitea deployment"
fi

echo ""