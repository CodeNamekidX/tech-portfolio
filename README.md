# Elliott Young — Technical Portfolio

## About

Hands-on technology portfolio focused on Linux systems administration, infrastructure, automation, networking, Docker, security practices, and self-hosted services.

I built and maintain a personal Linux homelab on a Lenovo ThinkCentre M920q and use it as a practical environment for learning infrastructure, system administration, networking, automation, and security.

My approach is project-based: build real systems, troubleshoot failures, document the solution, and automate repetitive tasks.

---

# Projects

## 1. Linux Homelab & Self-Hosted Infrastructure

Built and maintain a Linux-based homelab running multiple containerized services and network configurations.

### Technologies

- Linux Mint
- Docker
- Docker networking
- Bridge networks
- macvlan networking
- Pi-hole
- SearXNG
- Open WebUI
- cAdvisor
- systemd
- Linux administration

### What I Built

- Linux server environment on a Lenovo ThinkCentre M920q
- Multiple Dockerized services
- Dedicated Docker networks
- macvlan networking for Pi-hole
- Self-hosted applications
- Container monitoring
- Infrastructure documentation
- Hardware and storage documentation

[View Linux Homelab Project](projects/linux-homelab/README.md)

---

## 2. Bitcoin Knots Verified Update Automation

Built a Bash-based automated update workflow for a self-hosted Bitcoin Knots full node.

The system verifies software authenticity and integrity before installing updates.

### Technologies

- Bash
- Linux
- Bitcoin Knots
- GnuPG / OpenPGP
- SHA-256
- systemd
- systemd timers
- curl
- wget

### Security Controls

- GPG signature verification
- Trusted signing-key fingerprint verification
- SHA-256 checksum verification
- Dedicated GPG keyring
- Binary backups before upgrades
- Service health verification after installation

### Automation

The update system:

1. Checks for the latest release
2. Compares the installed version
3. Downloads the release files
4. Verifies the GPG signature
5. Verifies the SHA-256 checksum
6. Creates a backup
7. Stops the Bitcoin service
8. Installs the verified binaries
9. Restarts the service
10. Verifies the service is running

The update process is automatically checked using a weekly systemd timer.

[View Bitcoin Knots Updater](projects/bitcoin-knots-updater/README.md)

---

# Technical Skills

### Operating Systems

- Linux
- Linux Mint
- Linux command line
- system administration

### Infrastructure

- Docker
- Container management
- Docker networking
- Bridge networking
- macvlan networking
- Self-hosted services
- Infrastructure monitoring

### Automation

- Bash scripting
- systemd
- systemd timers
- Automated software deployment
- Backup procedures

### Security

- GPG / OpenPGP
- Cryptographic signature verification
- SHA-256 integrity verification
- Trusted key management
- Secure software update workflows

### Networking

- TCP/IP fundamentals
- DNS
- Docker networks
- macvlan
- LAN services
- Network-level DNS filtering

### Version Control

- Git
- Git repositories
- Commit-based workflow
- Technical documentation

---

# Homelab Hardware

| Component | Specification |
|---|---|
| Manufacturer | Lenovo |
| Model | ThinkCentre M920q |
| Operating System | Linux Mint 22.3 |
| Architecture | x86-64 |
| Storage | 1.8 TB NVMe |
| RAM | 8 GB |

---

# Current Learning Focus

Continuing to develop practical skills in:

- Linux administration
- Infrastructure automation
- Networking
- Docker
- Cybersecurity fundamentals
- System monitoring
- Git and GitHub
- Cloud and infrastructure technologies

---

# Philosophy

> Build it. Break it. Troubleshoot it. Document it. Automate it.

This portfolio represents hands-on projects built and maintained in my own lab environment.
