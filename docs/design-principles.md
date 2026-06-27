---
title: Design Principles
purpose: Define the repository's core architectural and documentation principles.
scope: Cross-cutting rules that shape all modules.
audience:
  - Contributors
  - Maintainers
dependencies:
  - /README.md
related_documents:
  - /architecture/module-boundaries.md
  - /STYLE_GUIDE.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Initial design principles authored.
---

# Design Principles

## Purpose

This document defines the stable principles that make the repository composable, reviewable, and implementation-ready.

## Scope

These principles apply to documentation design, runtime package layout, prompt contracts, and future evaluation assets.

## Audience

- Architecture contributors
- Maintainers reviewing structural changes

## Dependencies

Principles should be applied together with the style rules in [`/STYLE_GUIDE.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/STYLE_GUIDE.md).

## Related Documents

- Module boundaries: [`/architecture/module-boundaries.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/architecture/module-boundaries.md)

## Principles

1. Separate domain knowledge from reasoning policy.
2. Separate reasoning policy from workflow sequencing.
3. Separate workflow definitions from prompt formulations.
4. Separate prompts from runtime implementation.
5. Separate implementation from datasets and provider-specific integrations.
6. Preserve provenance and confidence as first-class outputs.
7. Prefer explicit interfaces over implicit conventions.

## TODO Checklist

- [ ] Add decision record criteria for exceptions to these principles.

## Future Improvements

- Add concrete anti-pattern examples as the codebase grows.

## References

- [`/specs/agent-contracts.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/agent-contracts.md)
