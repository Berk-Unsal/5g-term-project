# Deployment Report: Open5GS + UERANSIM in Kubernetes

## Objective

Deploy a microservice-based 5G core (Open5GS) and UERANSIM in Kubernetes, then verify UE registration from logs.

## Environment

- Platform: Kubernetes (Minikube/K3s compatible)
- Packaging: Helm chart
- Network functions: NRF, AMF, SMF, UPF, AUSF, UDM, UDR
- Data store: MongoDB
- RAN/UE simulation: UERANSIM gNB + UE

## Deployment Steps

1. Deploy chart:
   - `bash scripts/deploy.sh`
2. Wait for core components and subscriber bootstrap job completion.
3. Verify runtime objects:
   - `kubectl get pods,svc -n 5g-core`
4. Verify registration evidence:
   - `bash scripts/check_registration.sh`
   - Review AMF and UE logs for registration/session accept messages.

## Design Notes

- Each Open5GS NF is deployed as an independent Kubernetes `Deployment`.
- Services expose SBI/NGAP/PFCP/GTP-U interfaces.
- Subscriber is inserted by a Kubernetes `Job` into MongoDB during bootstrap.
- UERANSIM gNB/UE can run on host network to reduce packet path issues in local clusters.

## Verification Method

Registration is considered successful when logs include indicators such as:

- AMF: UE SUPI visibility, registered state, registration complete markers
- UE: registration accept and PDU session establishment accept markers

## Artifacts

- Helm chart: `helm/open5gs-ueransim`
- Scripts: `scripts/deploy.sh`, `scripts/check_registration.sh`, `scripts/teardown.sh`
- Diagram: `diagrams/pods-services.mmd`
- Tests: `tests/test_chart_structure.py`

## Limitations and Next Improvements

- Image compatibility can vary by architecture and tag availability.
- Networking requirements for full user-plane traffic can differ per CNI/runtime.
- Future improvement: add CI pipeline to run `helm lint` and `helm template` validation automatically.
