#!/usr/bin/env bash
set -euo pipefail

RELEASE_NAME=${RELEASE_NAME:-open5gs-lab}
NAMESPACE=${NAMESPACE:-5g-core}
CHART_PATH=${CHART_PATH:-./helm/open5gs-ueransim}
OUTPUT=${OUTPUT:-./manifests/all-in-one.yaml}

mkdir -p "$(dirname "$OUTPUT")"
helm template "$RELEASE_NAME" "$CHART_PATH" --namespace "$NAMESPACE" > "$OUTPUT"
echo "Rendered manifests at: $OUTPUT"
