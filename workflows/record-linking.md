---
title: Record Linking Workflow
purpose: Define how observations from separate records are compared and linked.
scope: Entity matching, identity splitting, and evidence reconciliation.
audience:
  - Implementers
  - Reasoning designers
dependencies:
  - /knowledge/naming-conventions.md
  - /knowledge/historical-geography.md
related_documents:
  - /specs/decision-trees.md
  - /workflows/person-investigation.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Record linking workflow added.
---

# Record Linking Workflow

## Purpose

This workflow describes how the framework should evaluate whether multiple records refer to the same person, household, event, or place.

## Scope

It focuses on linking logic rather than search strategy.

## Audience

- Implementers
- Reasoning designers

## Dependencies

Name and location interpretation depends on the related knowledge modules.

## Related Documents

- Decision trees: [`/specs/decision-trees.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/decision-trees.md)
- Person investigation: [`/workflows/person-investigation.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/person-investigation.md)

## Workflow Stages

1. Normalize comparable attributes.
2. Score strong, weak, and contradictory signals separately.
3. Preserve alternate hypotheses when evidence remains mixed.
4. Emit explicit justification for link or non-link decisions.

## TODO Checklist

- [ ] Add guidance for household and network-level linking.

## Future Improvements

- Add machine-readable matching feature definitions.

## References

- [`/specs/confidence-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/confidence-model.md)
