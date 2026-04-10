from pathlib import Path

import yaml

ROOT = Path(__file__).resolve().parents[1]
CHART = ROOT / "helm" / "open5gs-ueransim"


def test_chart_files_exist():
    required = [
        CHART / "Chart.yaml",
        CHART / "values.yaml",
        CHART / "templates" / "stack.yaml",
    ]
    for item in required:
        assert item.exists(), f"Missing required chart file: {item}"


def test_values_has_required_sections():
    values = yaml.safe_load((CHART / "values.yaml").read_text())
    for key in ["namespace", "images", "subscriber", "network"]:
        assert key in values, f"Missing key in values.yaml: {key}"


def test_template_contains_required_components():
    content = (CHART / "templates" / "stack.yaml").read_text()
    required_names = [
        "name: mongodb",
        "name: nrf",
        "name: amf",
        "name: smf",
        "name: upf",
        "name: ausf",
        "name: udm",
        "name: udr",
        "name: gnb",
        "name: ue",
        "kind: Job",
        "name: subscriber-bootstrap",
    ]
    for marker in required_names:
        assert marker in content, f"Missing marker in stack template: {marker}"


def test_template_includes_critical_ports_and_protocols():
    content = (CHART / "templates" / "stack.yaml").read_text()
    assert "protocol: SCTP" in content
    assert "port: 38412" in content
    assert "port: 8805" in content
    assert "port: 2152" in content


def test_template_includes_hostnetwork_toggle_for_ran():
    content = (CHART / "templates" / "stack.yaml").read_text()
    assert "hostNetworkForRan" in (CHART / "values.yaml").read_text()
    assert "hostNetwork: true" in content
    assert "ClusterFirstWithHostNet" in content
