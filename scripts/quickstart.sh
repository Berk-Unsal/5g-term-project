#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
ROOT_DIR=$(cd -- "$SCRIPT_DIR/.." && pwd)
RELEASE_NAME=${RELEASE_NAME:-open5gs-lab}
NAMESPACE=${NAMESPACE:-5g-core}
CHART_PATH=${CHART_PATH:-"$ROOT_DIR/helm/open5gs-ueransim"}

cleanup() {
  echo "Cleaning existing release and namespace..."
  helm uninstall "$RELEASE_NAME" --namespace "$NAMESPACE" >/dev/null 2>&1 || true
  kubectl delete namespace "$NAMESPACE" --ignore-not-found=true --wait=true >/dev/null 2>&1 || true
}

wait_for_rollout() {
  local deployment_name=$1
  kubectl rollout status deployment/"$deployment_name" --namespace "$NAMESPACE" --timeout=300s
}

trap 'echo "Quickstart failed. Check the output above for the first error." >&2' ERR

cleanup

echo "Starting fresh deployment of $RELEASE_NAME into namespace $NAMESPACE..."
helm upgrade --install "$RELEASE_NAME" "$CHART_PATH" --namespace "$NAMESPACE" --create-namespace

echo "Waiting for database and control-plane components..."
kubectl wait --namespace "$NAMESPACE" --for=condition=Available deployment/mongodb --timeout=300s
kubectl wait --namespace "$NAMESPACE" --for=condition=Complete job/subscriber-bootstrap --timeout=300s
wait_for_rollout nrf
wait_for_rollout amf
wait_for_rollout smf
wait_for_rollout upf
wait_for_rollout gnb
wait_for_rollout ue

echo ""
echo "Deployment summary:"
kubectl get pods,svc -n "$NAMESPACE"

echo ""
echo "Registration check:"
bash "$ROOT_DIR/scripts/check_registration.sh"

echo ""
echo "Quickstart complete."