---
title: Prompt Index
purpose: Organize prompt interface specifications for agent tasks.
scope: Prompt contracts, composition rules, and task-specific interfaces.
audience:
  - Prompt authors
  - Implementers
dependencies:
  - /architecture/module-boundaries.md
related_documents:
  - /prompts/prompt-composition.md
  - /workflows/README.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Prompt index added.
---

# Prompt Index

## Purpose

Prompt modules specify interfaces for LLM interactions. They define intent, inputs, outputs, and constraints without becoming the source of truth for domain knowledge or reasoning policy.

## Scope

The directory is for prompt specifications, not provider-specific prompt tuning.

## Audience

- Prompt authors
- Implementers

## Dependencies

Prompt ownership rules come from [`/architecture/module-boundaries.md`](../architecture/module-boundaries.md).

## Related Documents

- Prompt composition: [`/prompts/prompt-composition.md`](prompt-composition.md)
- Workflow index: [`/workflows/README.md`](../workflows/README.md)

## Modules

- `prompt-composition.md`
- `analyze-document.md`
- `investigate-person.md`
- `compare-sources.md`

## TODO Checklist

- [ ] Add structured output examples once schemas are stable.

## Future Improvements

- Add provider adaptation notes that preserve the same contract.

## References

- [`/specs/agent-contracts.md`](../specs/agent-contracts.md)
