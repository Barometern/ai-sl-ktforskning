---
title: Decision Trees
purpose: Define structured decision points used across research and linking workflows.
scope: Deterministic branching logic for common research situations.
audience:
  - Workflow designers
  - Implementers
dependencies:
  - /workflows/record-linking.md
related_documents:
  - /specs/confidence-model.md
  - /specs/conflict-resolution.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Decision tree spec added.
---

# Decision Trees

## Purpose

Decision trees provide deterministic checkpoints around recurring questions such as whether two records likely refer to the same person or whether additional evidence is required before accepting a claim.

## Scope

This document specifies branching concepts, not executable flowcharts.

## Audience

- Workflow designers
- Implementers

## Dependencies

Record linking provides the primary workflow context.

## Related Documents

- Confidence model: [`/specs/confidence-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/confidence-model.md)
- Conflict resolution: [`/specs/conflict-resolution.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/conflict-resolution.md)

## Initial Decision Areas

- sufficient evidence to merge identity hypotheses
- evidence conflict requiring parallel hypotheses
- source quality too weak for conclusion
- additional record class likely to resolve ambiguity

## TODO Checklist

- [ ] Add machine-readable decision tree representations.

## Future Improvements

- Add worked examples drawn from Swedish source combinations.

## References

- [`/workflows/record-linking.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/record-linking.md)
