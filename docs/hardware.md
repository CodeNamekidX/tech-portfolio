# Homelab Hardware

## Host System

| Component | Specification |
|---|---|
| Manufacturer | Lenovo |
| Model | ThinkCentre M920q |
| Operating System | Linux Mint 22.3 |
| Kernel | Linux 7.0.0-28-generic |
| Architecture | x86-64 |
| Storage | 1.8 TB NVMe |
| RAM | 8 GB |
| Swap | 2 GB |
| Firmware | M1UKT79A |

## Storage

The system uses a 1.8 TB NVMe drive.

- EFI partition: ~512 MB
- Linux root filesystem: ~1.8 TB
- Approximately 761 GB available at time of documentation

## Purpose

The ThinkCentre M920q serves as the primary homelab host.

It is used for:

- Linux system administration
- Docker workloads
- Network services
- Self-hosted applications
- Monitoring experiments
- Bitcoin Knots full-node infrastructure
- Automated software deployment

## Architecture

```text
Internet / LAN
      |
      v
Lenovo ThinkCentre M920q
      |
      +-- Linux Mint
      |
      +-- Docker
      |
      +-- Bitcoin Knots
      |
      +-- systemd services
      |
      +-- Automated maintenance

> Sensitive system identifiers such as machine IDs, boot IDs, MAC addresses, and other unique identifiers are intentionally excluded from this documentation.
