---
title: Historical Geography
purpose: Define location context needed for accurate record interpretation and linking.
scope: Administrative boundaries, parish context, and temporal location interpretation.
audience:
  - Genealogists
  - Workflow designers
  - Engineers building location-aware modules
dependencies:
  - /knowledge/swedish-genealogy.md
related_documents:
  - /knowledge/record-types.md
  - /workflows/timeline-construction.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Historical geography module added.
---

# Historical Geography

## Purpose

Locations in genealogy are time-bound concepts. The same place name may refer to different administrative entities across periods, and the same jurisdiction may appear under different spellings or boundary definitions.

## Scope

This module covers interpretive geography, not gazetteer implementation.

## Audience

- Genealogists
- Engineers handling location normalization

## Dependencies

Country context is defined in [`/knowledge/swedish-genealogy.md`](swedish-genealogy.md).

## Related Documents

- Record types: [`/knowledge/record-types.md`](record-types.md)
- Timeline construction: [`/workflows/timeline-construction.md`](../workflows/timeline-construction.md)

## Key Concerns

- Parish versus civil administrative boundaries
- Historical county and municipality changes
- Migration records referencing origin and destination at different jurisdiction levels

## TODO Checklist

- [ ] Add a location ambiguity taxonomy.

## Future Improvements

- Add schema hooks for period-aware place identifiers.

## References

- [`/templates/timeline.md`](../templates/timeline.md)
