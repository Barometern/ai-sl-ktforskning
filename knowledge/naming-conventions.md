---
title: Naming Conventions
purpose: Describe naming behaviors that affect identity resolution in genealogy research.
scope: Personal names, patronymics, aliases, and stable identifiers in Swedish context.
audience:
  - Genealogists
  - Reasoning designers
  - Prompt authors
dependencies:
  - /knowledge/swedish-genealogy.md
related_documents:
  - /specs/decision-trees.md
  - /workflows/record-linking.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Naming conventions module added.
---

# Naming Conventions

## Purpose

Names are central but unstable identity signals. This module documents the kinds of naming change an agent must tolerate without treating all variation as equivalent.

## Scope

The initial focus is Swedish naming practice, with room for later comparative modules.

## Audience

- Identity resolution designers
- Genealogists

## Dependencies

Country context is defined in [`/knowledge/swedish-genealogy.md`](swedish-genealogy.md).

## Related Documents

- Record linking workflow: [`/workflows/record-linking.md`](../workflows/record-linking.md)
- Decision trees: [`/specs/decision-trees.md`](../specs/decision-trees.md)

## Key Cases

- Patronymic variation across generations
- Alternate spellings and orthographic normalization
- Farm names or residence-based identifiers
- Soldier names and occupational aliases
- Shifts toward fixed surnames in later periods

## TODO Checklist

- [ ] Add examples of ambiguous same-name cases.

## Future Improvements

- Add normalization guidelines for machine-readable name comparison.

## References

- [`/specs/confidence-model.md`](../specs/confidence-model.md)
