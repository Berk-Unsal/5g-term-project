# Project 3: Open5GS + UERANSIM on Kubernetes

This project deploys a containerized 5G core (Open5GS) and radio/UE simulation (UERANSIM) onto Kubernetes using Helm.

## What Is Included

- Helm chart for Open5GS and UERANSIM: `helm/open5gs-ueransim`
- Deployment automation scripts: `scripts/`
- Validation tests for chart structure: `tests/`
- Pod/service architecture diagram (Mermaid): `diagrams/pods-services.mmd`
- Deployment report: `REPORT.md`

## Prerequisites

- Kubernetes cluster (Minikube or K3s)
- Helm v3+
- `kubectl` configured for your cluster
- SCTP support available on cluster nodes for NGAP (AMF <-> gNB)

## Quick Start

```bash
bash scripts/quickstart.sh
```

This performs a clean start by removing any existing release and namespace, deploying fresh, waiting for the core components, and printing a registration check summary.

## Configuration

Default parameters are in `helm/open5gs-ueransim/values.yaml`.

Important values:

- `images.open5gs`: Open5GS container image
- `images.ueransim`: UERANSIM container image
- `network.hostNetworkForRan`: host networking toggle for gNB/UE pods
- `subscriber.*`: IMSI, keys, and slice configuration for UE registration

Example override:

```bash
helm upgrade --install open5gs-lab ./helm/open5gs-ueransim \
  --namespace 5g-core --create-namespace \
  --set subscriber.imsi=001010000000002
```

## Testing

Tests validate chart completeness and required network markers.

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements-dev.txt
pytest -q
```

## Teardown

```bash
bash scripts/teardown.sh
```

## Notes

- For fully working UE data traffic, host and CNI networking setup may require additional tuning depending on Minikube/K3s mode.
- If your environment lacks SCTP in Kubernetes, use a cluster setup that supports SCTP modules and CNI capabilities.
