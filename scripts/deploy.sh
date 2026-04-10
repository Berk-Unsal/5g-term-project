#!/usr/bin/env bash
set -euo pipefail

RELEASE_NAME=${RELEASE_NAME:-open5gs-lab}
NAMESPACE=${NAMESPACE:-5g-core}
CHART_PATH=${CHART_PATH:-./helm/open5gs-ueransim}

helm upgrade --install "$RELEASE_NAME" "$CHART_PATH" --namespace "$NAMESPACE" --create-namespace

echo "Waiting for core components..."
kubectl wait --namespace "$NAMESPACE" --for=condition=Available deployment/mongodb --timeout=300s
kubectl wait --namespace "$NAMESPACE" --for=condition=Complete job/subscriber-bootstrap --timeout=300s
kubectl wait --namespace "$NAMESPACE" --for=condition=Available deployment/nrf --timeout=300s
kubectl wait --namespace "$NAMESPACE" --for=condition=Available deployment/amf --timeout=300s
kubectl wait --namespace "$NAMESPACE" --for=condition=Available deployment/smf --timeout=300s
kubectl wait --namespace "$NAMESPACE" --for=condition=Available deployment/upf --timeout=300s
kubectl wait --namespace "$NAMESPACE" --for=condition=Available deployment/gnb --timeout=300s
kubectl wait --namespace "$NAMESPACE" --for=condition=Available deployment/ue --timeout=300s

echo "Deployment complete."
