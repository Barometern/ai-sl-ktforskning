---
title: Knowledge Index
purpose: Organize domain knowledge modules that research agents can use without mixing them with reasoning or workflow logic.
scope: Genealogical knowledge assets, beginning with Swedish research.
audience:
  - Genealogists
  - AI engineers
  - Knowledge curators
dependencies:
  - /architecture/module-boundaries.md
related_documents:
  - /knowledge/research-principles.md
  - /knowledge/swedish-genealogy.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Knowledge index created.
---

# Knowledge Index

## Purpose

Knowledge modules define the factual and interpretive material required for genealogical research. They describe records, naming practices, geography, and evidence characteristics without specifying how an agent should reason about them.

## Scope

The initial modules emphasize Swedish genealogy because Swedish sources are highly structured and historically rich, making them a strong design target for an AI research framework.

## Audience

- Genealogists curating source context
- Engineers building retrieval or reasoning components

## Dependencies

Boundary rules are defined in [`/architecture/module-boundaries.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/architecture/module-boundaries.md).

## Related Documents

- Evidence contract context: [`/knowledge/evidence-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/evidence-model.md)
- Confidence policy: [`/specs/confidence-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/confidence-model.md)

## Modules

- `research-principles.md`
- `swedish-genealogy.md`
- `naming-conventions.md`
- `historical-geography.md`
- `record-types.md`
- `source-evaluation.md`
- `evidence-model.md`

## TODO Checklist

- [ ] Add glossaries for historical abbreviations and archive references.
- [ ] Add country module guidelines for non-Swedish contributors.

## Future Improvements

- Add machine-readable lookup tables for record and location types.

## References

- [`/workflows/research-workflow.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/research-workflow.md)
