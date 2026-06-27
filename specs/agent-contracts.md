---
title: Agent Contracts
purpose: Define the core interfaces future runtime agents should implement.
scope: Task interfaces, memory expectations, and output contract boundaries.
audience:
  - Implementers
  - Maintainers
dependencies:
  - /architecture/system-overview.md
  - /prompts/README.md
related_documents:
  - /workflows/research-memory.md
  - /specs/confidence-model.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Agent contract spec added.
---

# Agent Contracts

## Purpose

This specification defines the stable interface expectations for future research agents built on the framework.

## Scope

It covers contract boundaries, not internal implementation details.

## Audience

- Runtime implementers
- Maintainers reviewing API design

## Dependencies

Architecture and prompt modules define the surrounding structure.

## Related Documents

- Research memory workflow: [`/workflows/research-memory.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/research-memory.md)
- Confidence model: [`/specs/confidence-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/confidence-model.md)

## Contract Areas

- task invocation envelope
- knowledge context attachment
- structured output payloads
- memory read and write expectations
- provenance and confidence fields
- review and escalation hooks

## TODO Checklist

- [ ] Add language-neutral interface sketches.

## Future Improvements

- Add protocol bindings for Python and TypeScript implementations.

## References

- [`/src/README.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/src/README.md)
