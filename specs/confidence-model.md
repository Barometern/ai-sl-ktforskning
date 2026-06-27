---
title: Confidence Model
purpose: Define how the framework represents confidence without obscuring uncertainty.
scope: Confidence dimensions, interpretation, and output expectations.
audience:
  - Reasoning designers
  - Implementers
dependencies:
  - /knowledge/source-evaluation.md
related_documents:
  - /specs/conflict-resolution.md
  - /templates/person-summary.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Confidence model spec added.
---

# Confidence Model

## Purpose

Confidence in genealogy must reflect evidence quality, agreement, and explanatory adequacy rather than generic model certainty. This specification defines that distinction.

## Scope

It covers conceptual confidence outputs and their drivers, not a numeric scoring implementation.

## Audience

- Reasoning designers
- Implementers

## Dependencies

Source evaluation inputs come from [`/knowledge/source-evaluation.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/source-evaluation.md).

## Related Documents

- Conflict resolution: [`/specs/conflict-resolution.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/conflict-resolution.md)
- Person summary template: [`/templates/person-summary.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/templates/person-summary.md)

## Confidence Dimensions

- source quality
- evidence consistency
- identity fit
- temporal and geographic plausibility
- residual unresolved conflict

## TODO Checklist

- [ ] Define the first discrete confidence vocabulary.

## Future Improvements

- Add calibration guidance using benchmark fixtures.

## References

- [`/knowledge/evidence-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/evidence-model.md)
