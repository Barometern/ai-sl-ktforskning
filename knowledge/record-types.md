---
title: Record Types
purpose: Describe the major categories of genealogical records relevant to the framework.
scope: Record families, evidentiary strengths, and interpretive considerations.
audience:
  - Genealogists
  - Workflow designers
  - Prompt authors
dependencies:
  - /knowledge/source-evaluation.md
related_documents:
  - /workflows/document-analysis.md
  - /workflows/person-investigation.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Initial record type module authored.
---

# Record Types

## Purpose

Research agents need a stable record taxonomy so that extraction, comparison, and confidence rules can vary by source class rather than treat all documents as equivalent.

## Scope

This document provides a conceptual taxonomy for the first release.

## Audience

- Knowledge curators
- Workflow designers

## Dependencies

Evaluation guidance is defined in [`/knowledge/source-evaluation.md`](source-evaluation.md).

## Related Documents

- Document analysis workflow: [`/workflows/document-analysis.md`](../workflows/document-analysis.md)
- Person investigation workflow: [`/workflows/person-investigation.md`](../workflows/person-investigation.md)

## Initial Taxonomy

- Parish births, baptisms, marriages, and burials
- Household examination books and catechetical registers
- Migration in and out records
- Census-like summaries and tax records
- Probate, military, and court-derived identity evidence

## TODO Checklist

- [ ] Add source-specific extraction hints for Swedish core records.

## Future Improvements

- Add mappings to external archival series where licensing permits.

## References

- [`/prompts/analyze-document.md`](../prompts/analyze-document.md)
