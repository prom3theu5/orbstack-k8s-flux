#!/bin/bash
set -euo pipefail

echo "🧼 Deleting Kubernetes cluster in OrbStack..."
orb stop k8s || true
orb delete k8s -f || true
orb stop
orb start