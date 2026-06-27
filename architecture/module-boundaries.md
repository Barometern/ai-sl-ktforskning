---
title: Module Boundaries
purpose: Define what each major repository module may own and what it must not duplicate.
scope: Knowledge, reasoning, workflow, prompt, template, and runtime boundaries.
audience:
  - Contributors
  - Maintainers
dependencies:
  - /architecture/system-overview.md
related_documents:
  - /docs/design-principles.md
  - /STYLE_GUIDE.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Module ownership rules defined.
---

# Module Boundaries

## Purpose

This document prevents concept drift and duplication by defining ownership for each major directory.

## Scope

Boundary rules apply to documentation today and to implementation packages later.

## Audience

- Contributors planning new modules
- Reviewers evaluating overlap or misplaced content

## Dependencies

The layered model from [`/architecture/system-overview.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/architecture/system-overview.md) is authoritative.

## Related Documents

- Design principles: [`/docs/design-principles.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/docs/design-principles.md)
- Style guide: [`/STYLE_GUIDE.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/STYLE_GUIDE.md)

## Ownership Matrix

| Module | Owns | Must Not Own |
| --- | --- | --- |
| `knowledge/` | Domain rules, source context, conventions | Workflow steps, prompt wording |
| `specs/` | Formal reasoning policies and contracts | Country-specific evidence details |
| `workflows/` | Ordered research procedures | Domain fact catalogs |
| `prompts/` | LLM interaction contracts | Canonical reasoning rules |
| `templates/` | Output structures for humans and systems | Extraction logic |
| `src/` | Implementations of the published contracts | Hidden undocumented policy |

## TODO Checklist

- [ ] Add examples of acceptable cross-module references.

## Future Improvements

- Add package-level ownership examples once runtime code is introduced.

## References

- [`/knowledge/README.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/README.md)
- [`/prompts/prompt-composition.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/prompts/prompt-composition.md)
