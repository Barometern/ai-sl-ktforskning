---
title: Swedish Genealogy Domain Module
purpose: Define the initial country-specific knowledge assumptions for the framework.
scope: Swedish research context, source landscape, and extension boundaries.
audience:
  - Genealogists
  - AI engineers
  - Extension authors
dependencies:
  - /knowledge/record-types.md
  - /knowledge/naming-conventions.md
related_documents:
  - /architecture/extensibility-model.md
  - /workflows/person-investigation.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Initial Swedish domain framing added.
---

# Swedish Genealogy Domain Module

## Purpose

This module explains why Swedish genealogy is the first supported domain and what assumptions follow from that choice.

## Scope

It summarizes the research environment rather than cataloging every archive or parish series.

## Audience

- Contributors building Swedish modules
- Maintainers planning future country extensions

## Dependencies

Detailed record and naming guidance is split into [`/knowledge/record-types.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/record-types.md) and [`/knowledge/naming-conventions.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/naming-conventions.md).

## Related Documents

- Extensibility model: [`/architecture/extensibility-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/architecture/extensibility-model.md)
- Person investigation workflow: [`/workflows/person-investigation.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/person-investigation.md)

## Domain Notes

- Swedish parish and household records often enable longitudinal tracking across residences and life events.
- Patronymics, farm names, soldier names, and urban name stabilization can all affect identity resolution.
- Historical county, parish, and municipality boundaries must be interpreted in period context.

## TODO Checklist

- [ ] Add archive-specific notes for household examination books and moving records.
- [ ] Add a boundary note for Finland under Swedish rule where relevant.

## Future Improvements

- Add references to archival series taxonomies and abbreviation maps.

## References

- [`/knowledge/historical-geography.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/historical-geography.md)
