---
title: Prompt Composition
purpose: Define how prompt modules should be assembled from reusable parts.
scope: Prompt architecture, input contracts, and output discipline.
audience:
  - Prompt authors
  - Implementers
dependencies:
  - /docs/design-principles.md
related_documents:
  - /prompts/analyze-document.md
  - /prompts/investigate-person.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Prompt composition rules added.
---

# Prompt Composition

## Purpose

Prompt modules should be assembled from stable components so that domain context, reasoning constraints, workflow stage, and output schemas can evolve independently.

## Scope

This document covers composition strategy, not task-specific prompt content.

## Audience

- Prompt authors
- Implementers

## Dependencies

Design principles define the required separation of concerns.

## Related Documents

- Analyze document prompt: [`/prompts/analyze-document.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/prompts/analyze-document.md)
- Investigate person prompt: [`/prompts/investigate-person.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/prompts/investigate-person.md)

## Composition Components

- task objective
- workflow stage context
- relevant knowledge references
- reasoning and confidence constraints
- output schema or template mapping

## TODO Checklist

- [ ] Add reusable composition blocks once runtime prompt assembly exists.

## Future Improvements

- Add provider-specific adaptation guidance that does not alter semantics.

## References

- [`/specs/confidence-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/confidence-model.md)
