---
title: Source Directory Plan
purpose: Describe how future implementation packages should be organized under src.
scope: Planned runtime package boundaries only.
audience:
  - Implementers
  - Maintainers
dependencies:
  - /architecture/system-overview.md
related_documents:
  - /specs/agent-contracts.md
  - /tests/README.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Source directory plan added.
---

# Source Directory Plan

## Purpose

The `src/` tree is reserved for runtime implementation packages that honor the published architecture and specifications.

## Scope

No framework code is implemented in the bootstrap stage, but the package boundaries are prepared for future work.

## Audience

- Implementers
- Maintainers

## Dependencies

Architecture and agent contracts define the package plan.

## Related Documents

- Agent contracts: [`/specs/agent-contracts.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/agent-contracts.md)
- Tests plan: [`/tests/README.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/tests/README.md)

## Planned Packages

- `core/`: orchestration primitives and task lifecycle
- `knowledge/`: loaders and adapters for knowledge modules
- `reasoning/`: confidence and conflict engines
- `workflows/`: executable workflow definitions
- `memory/`: persistence contracts and session state
- `interfaces/`: provider, storage, and external adapter boundaries

## TODO Checklist

- [ ] Add language-specific package manifests when implementation begins.

## Future Improvements

- Add code generation from specs and template schemas.

## References

- [`/architecture/module-boundaries.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/architecture/module-boundaries.md)
