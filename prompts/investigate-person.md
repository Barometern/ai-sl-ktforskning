---
title: Investigate Person Prompt Contract
purpose: Define the prompt interface for person-level multi-source investigation.
scope: Identity reasoning input and output expectations for an LLM task.
audience:
  - Prompt authors
  - Implementers
dependencies:
  - /workflows/person-investigation.md
  - /knowledge/naming-conventions.md
related_documents:
  - /specs/conflict-resolution.md
  - /templates/person-summary.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Person investigation prompt contract added.
---

# Investigate Person Prompt Contract

## Purpose

This prompt contract defines how a model should synthesize multiple observations into identity-level analysis without hiding uncertainty or contradiction.

## Scope

It governs the person investigation task and expected outputs.

## Audience

- Prompt authors
- Implementers

## Dependencies

The workflow owner is [`/workflows/person-investigation.md`](../workflows/person-investigation.md).

## Related Documents

- Conflict resolution: [`/specs/conflict-resolution.md`](../specs/conflict-resolution.md)
- Person summary template: [`/templates/person-summary.md`](../templates/person-summary.md)

## Contract Summary

- Input: research question, candidate records, prior claims, confidence rules
- Output: identity hypotheses, accepted and contested claims, reasoning summary, next actions
- Constraint: unresolved alternatives must remain visible when evidence is insufficient

## TODO Checklist

- [ ] Add structured output field definitions for hypotheses and claim sets.

## Future Improvements

- Add variants for collaborative human review loops.

## References

- [`/specs/decision-trees.md`](../specs/decision-trees.md)
