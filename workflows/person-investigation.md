---
title: Person Investigation Workflow
purpose: Define how an agent investigates a person or identity hypothesis across multiple records.
scope: Identity resolution, claim accumulation, and evidence synthesis.
audience:
  - Workflow designers
  - Implementers
dependencies:
  - /workflows/research-workflow.md
  - /knowledge/naming-conventions.md
related_documents:
  - /workflows/record-linking.md
  - /templates/person-summary.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Person investigation workflow added.
---

# Person Investigation Workflow

## Purpose

This workflow manages multi-record investigation of an individual, including name variation, movement, and conflicting identity signals.

## Scope

It assumes that documents have already been analyzed into observations or can be analyzed during the workflow.

## Audience

- Workflow designers
- Implementers

## Dependencies

The core workflow and naming conventions modules are required inputs.

## Related Documents

- Record linking: [`/workflows/record-linking.md`](record-linking.md)
- Person summary template: [`/templates/person-summary.md`](../templates/person-summary.md)

## Workflow Stages

1. Define the target identity question.
2. Gather candidate records and prior claims.
3. Compare names, dates, places, relationships, and occupations.
4. Merge or split identity hypotheses based on evidence quality.
5. Produce a summary with confidence and open questions.

## TODO Checklist

- [ ] Add cluster research hooks for associates, sponsors, and witnesses.

## Future Improvements

- Add support for household-based identity inference.

## References

- [`/prompts/investigate-person.md`](../prompts/investigate-person.md)
