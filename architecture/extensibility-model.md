---
title: Extensibility Model
purpose: Define how new country modules, providers, and runtime components can be added safely.
scope: Framework extension strategy and compatibility expectations.
audience:
  - Maintainers
  - Extension authors
dependencies:
  - /architecture/module-boundaries.md
related_documents:
  - /ROADMAP.md
  - /specs/agent-contracts.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Initial extensibility guidance added.
---

# Extensibility Model

## Purpose

The framework must support new countries, archives, models, and orchestration runtimes without forcing a redesign of the core concepts.

## Scope

This document covers extension categories and compatibility rules, not implementation mechanics for a specific language ecosystem.

## Audience

- Maintainers reviewing new extensions
- Teams building downstream packages

## Dependencies

Extensions must honor the ownership rules in [`/architecture/module-boundaries.md`](module-boundaries.md).

## Related Documents

- Agent contracts: [`/specs/agent-contracts.md`](../specs/agent-contracts.md)
- Roadmap: [`/ROADMAP.md`](../ROADMAP.md)

## Extension Categories

- Country knowledge packs
- Archive and OCR adapters
- Prompt packs tuned for specific model families
- Runtime memory and evidence store backends
- Evaluation datasets and benchmark suites

## Compatibility Rules

- New knowledge packs must reuse shared claim and evidence contracts.
- Provider adapters must not redefine reasoning policies.
- Prompt packs may optimize wording but must preserve output contracts.
- Runtime packages must treat template and schema modules as public interfaces.

## TODO Checklist

- [ ] Add versioning rules for extension compatibility.
- [ ] Add a country module template once the first external pack is designed.

## Future Improvements

- Add plugin discovery and registration guidelines.

## References

- [`/knowledge/swedish-genealogy.md`](../knowledge/swedish-genealogy.md)
