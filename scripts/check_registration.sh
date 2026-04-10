#!/usr/bin/env bash
set -euo pipefail

NAMESPACE=${NAMESPACE:-5g-core}

echo "AMF logs (last 200 lines):"
kubectl logs -n "$NAMESPACE" deploy/amf --tail=200 || true

echo
echo "UE logs (last 200 lines):"
kubectl logs -n "$NAMESPACE" deploy/ue --tail=200 || true

echo
echo "Quick registration checks:"
if kubectl logs -n "$NAMESPACE" deploy/amf --tail=500 | grep -Ei "Registration complete|gmm-state\[registered\]|UE SUPI" >/dev/null; then
  echo "AMF indicates successful UE registration."
else
  echo "No explicit AMF registration match found yet."
fi

if kubectl logs -n "$NAMESPACE" deploy/ue --tail=500 | grep -Ei "Registration accept|PDU Session Establishment Accept" >/dev/null; then
  echo "UE indicates successful registration and/or PDU session establishment."
else
  echo "No explicit UE registration/session accept match found yet."
fi
