---
title: Workflow Index
purpose: Organize reusable genealogy research workflows for AI agents.
scope: Ordered research procedures and state transitions.
audience:
  - Workflow designers
  - Prompt authors
  - Implementers
dependencies:
  - /architecture/system-overview.md
related_documents:
  - /workflows/research-workflow.md
  - /prompts/README.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Workflow index created.
---

# Workflow Index

## Purpose

Workflow modules define repeatable research sequences that orchestrate knowledge access, reasoning checkpoints, and output artifacts.

## Scope

Workflows describe process logic, not prompt wording or implementation strategy.

## Audience

- Workflow designers
- Implementers

## Dependencies

Conceptual layer boundaries come from [`/architecture/system-overview.md`](../architecture/system-overview.md).

## Related Documents

- Prompt index: [`/prompts/README.md`](../prompts/README.md)

## Modules

- `research-workflow.md`
- `document-analysis.md`
- `person-investigation.md`
- `brick-wall-workflow.md`
- `record-linking.md`
- `timeline-construction.md`
- `research-memory.md`

## TODO Checklist

- [ ] Add workflow state diagrams and failure modes.

## Future Improvements

- Add batch and collaborative research workflow variants.

## References

- [`/templates/README.md`](../templates/README.md)
