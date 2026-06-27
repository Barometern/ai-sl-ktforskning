---
title: Architecture Index
purpose: Provide navigation for the framework's structural design documents.
scope: System boundaries, module contracts, and extension rules.
audience:
  - Maintainers
  - Contributors
  - Framework implementers
dependencies:
  - /README.md
related_documents:
  - /architecture/system-overview.md
  - /architecture/module-boundaries.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Architecture index created.
---

# Architecture Index

## Purpose

The architecture directory contains the repository's structural contracts. These documents explain how modules interact and where future implementation packages should draw their boundaries.

## Scope

Architecture documents define stable design intent; they should not be used for transient planning or issue-level discussion.

## Audience

- Maintainers
- Runtime implementers
- Proposal authors

## Dependencies

Project-level context lives in [`/README.md`](../README.md).

## Related Documents

- System overview: [`/architecture/system-overview.md`](system-overview.md)
- Module boundaries: [`/architecture/module-boundaries.md`](module-boundaries.md)
- Extensibility model: [`/architecture/extensibility-model.md`](extensibility-model.md)

## TODO Checklist

- [ ] Add architecture decision records once the process is defined.

## Future Improvements

- Add diagrams for package boundaries and workflow execution paths.

## References

- [`/src/README.md`](../src/README.md)
