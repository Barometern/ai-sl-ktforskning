---
title: Security Policy
purpose: Define how security issues and sensitive research risks should be reported and handled.
scope: Repository security, dependency hygiene, secrets, and misuse scenarios in future implementations.
audience:
  - Security researchers
  - Maintainers
  - Contributors
dependencies:
  - /CONTRIBUTING.md
related_documents:
  - /CODE_OF_CONDUCT.md
  - /architecture/extensibility-model.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Initial security policy.
---

# Security Policy

## Purpose

The framework is documentation-first today, but its future implementation surface will include prompts, workflows, adapters, and evidence storage. Security work must therefore account for both software concerns and misuse risks related to personal historical data.

## Scope

This policy covers repository vulnerabilities, dependency risks, credential exposure, automation misuse, unsafe prompt behavior, and handling of sensitive genealogical material.

## Audience

- Security reporters
- Maintainers
- Implementation contributors

## Dependencies

Contributors should coordinate architectural changes through [`/CONTRIBUTING.md`](CONTRIBUTING.md) before landing mitigation work that changes public contracts.

## Related Documents

- Conduct policy: [`/CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md)
- Extensibility rules: [`/architecture/extensibility-model.md`](architecture/extensibility-model.md)

## Reporting

Until a dedicated security contact is published, open a private GitHub security advisory or contact maintainers through repository security reporting when available. Do not disclose exploitable details publicly before maintainers have had time to reproduce and assess the issue.

## Security Priorities

- Prevent prompt and workflow modules from embedding secrets.
- Keep provider-specific credentials out of examples and scripts.
- Treat evidence and claim stores as auditable records with least-privilege access.
- Design future adapters so archival scraping, OCR ingestion, and exports are rate-limited and traceable.

## Supported Versions

During the bootstrap stage, the `main` branch is the only supported line. Once releases exist, supported versions should be listed here with maintenance windows.

## TODO Checklist

- [ ] Publish a maintainer contact for private disclosures.
- [ ] Add a threat model for evidence storage and audit trails.
- [ ] Define redaction rules for sample datasets and fixtures.

## Future Improvements

- Add dependency update automation and signed release guidance.
- Add model-provider security notes once runtime packages exist.

## References

- [`/README.md`](README.md)
- [`/specs/agent-contracts.md`](specs/agent-contracts.md)
