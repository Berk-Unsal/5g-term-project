#!/usr/bin/env bash
set -euo pipefail

RELEASE_NAME=${RELEASE_NAME:-open5gs-lab}
NAMESPACE=${NAMESPACE:-5g-core}

helm uninstall "$RELEASE_NAME" --namespace "$NAMESPACE" || true
kubectl delete namespace "$NAMESPACE" --ignore-not-found=true

echo "Teardown complete."
