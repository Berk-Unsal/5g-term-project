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

dump_debug() {
  local reason=${1:-"unknown"}
  echo ""
  echo "Debug dump ($reason):"
  set +e
  kubectl get pods -n "$NAMESPACE" -o wide
  kubectl get events -n "$NAMESPACE" --sort-by=.lastTimestamp | tail -n 50
  while read -r name ready status rest; do
    if [[ "$status" != "Running" && "$status" != "Completed" ]]; then
      echo ""
      echo "Describe pod $name"
      kubectl describe pod -n "$NAMESPACE" "$name"
      echo ""
      echo "Logs for $name"
      kubectl logs -n "$NAMESPACE" "$name" --tail=200
    fi
  done < <(kubectl get pods -n "$NAMESPACE" --no-headers)
  set -e
}

wait_for_rollout() {
  local deployment_name=$1
  if ! kubectl rollout status deployment/"$deployment_name" --namespace "$NAMESPACE" --timeout=300s; then
    dump_debug "rollout $deployment_name"
    return 1
  fi
}

trap 'echo "Quickstart failed. Check the output above for the first error." >&2; dump_debug "trap"' ERR

cleanup

echo "Starting fresh deployment of $RELEASE_NAME into namespace $NAMESPACE..."
helm upgrade --install "$RELEASE_NAME" "$CHART_PATH" --namespace "$NAMESPACE" --create-namespace

echo "Waiting for database and control-plane components..."
if ! kubectl wait --namespace "$NAMESPACE" --for=condition=Available deployment/mongodb --timeout=300s; then
  dump_debug "mongodb"
  exit 1
fi
if ! kubectl wait --namespace "$NAMESPACE" --for=condition=Complete job/subscriber-bootstrap --timeout=300s; then
  dump_debug "subscriber-bootstrap"
  exit 1
fi
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