---
title: Template Index
purpose: Organize structured output templates used by workflows and prompts.
scope: Human-readable and machine-aligned research artifacts.
audience:
  - Template authors
  - Workflow designers
  - Implementers
dependencies:
  - /workflows/README.md
related_documents:
  - /templates/research-report.md
  - /templates/person-summary.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Template index created.
---

# Template Index

## Purpose

Templates provide stable output shapes for reports, summaries, plans, and conflict tracking. They help align human-readable results with future structured schemas.

## Scope

Templates define output structure, not reasoning rules or workflow logic.

## Audience

- Template authors
- Workflow designers

## Dependencies

Workflow ownership is defined in [`/workflows/README.md`](../workflows/README.md).

## Related Documents

- Research report: [`/templates/research-report.md`](research-report.md)
- Person summary: [`/templates/person-summary.md`](person-summary.md)

## Modules

- `research-report.md`
- `person-summary.md`
- `research-plan.md`
- `conflict-report.md`
- `timeline.md`

## TODO Checklist

- [ ] Add schema mappings for each template.

## Future Improvements

- Add rendering guidelines for web, PDF, and notebook outputs.

## References

- [`/specs/agent-contracts.md`](../specs/agent-contracts.md)
