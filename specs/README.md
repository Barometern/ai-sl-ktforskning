---
title: Specification Index
purpose: Organize formal reasoning and interface specifications.
scope: Normative contracts for confidence, conflict handling, decision logic, and agent interfaces.
audience:
  - Maintainers
  - Implementers
  - Advanced contributors
dependencies:
  - /architecture/README.md
related_documents:
  - /specs/confidence-model.md
  - /specs/agent-contracts.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Specification index created.
---

# Specification Index

## Purpose

Specification modules define normative rules and contracts that future runtime code should implement consistently.

## Scope

These documents are the bridge between conceptual documentation and executable components.

## Audience

- Implementers
- Maintainers

## Dependencies

Architectural ownership is defined in [`/architecture/README.md`](../architecture/README.md).

## Related Documents

- Confidence model: [`/specs/confidence-model.md`](confidence-model.md)
- Agent contracts: [`/specs/agent-contracts.md`](agent-contracts.md)

## Modules

- `confidence-model.md`
- `conflict-resolution.md`
- `decision-trees.md`
- `agent-contracts.md`

## TODO Checklist

- [ ] Add schema identifiers and versioning policy.

## Future Improvements

- Add JSON schema and protocol bindings for each contract.

## References

- [`/tests/README.md`](../tests/README.md)
