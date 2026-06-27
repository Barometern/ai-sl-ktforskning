---
title: Conflict Resolution Specification
purpose: Define how conflicting evidence and competing hypotheses should be handled.
scope: Contradiction classification, resolution paths, and output rules.
audience:
  - Reasoning designers
  - Implementers
dependencies:
  - /knowledge/evidence-model.md
  - /knowledge/source-evaluation.md
related_documents:
  - /templates/conflict-report.md
  - /workflows/brick-wall-workflow.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Conflict resolution spec added.
---

# Conflict Resolution Specification

## Purpose

Conflicts should be surfaced, classified, and managed deliberately. This specification defines how the framework should respond when evidence points in different directions.

## Scope

It covers reasoning policy rather than user interface decisions.

## Audience

- Reasoning designers
- Implementers

## Dependencies

Evidence and source characterization come from the knowledge modules.

## Related Documents

- Conflict report template: [`/templates/conflict-report.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/templates/conflict-report.md)
- Brick wall workflow: [`/workflows/brick-wall-workflow.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/brick-wall-workflow.md)

## Conflict Classes

- direct factual contradiction
- identity ambiguity
- chronology inconsistency
- location inconsistency
- source reliability imbalance

## Resolution Rules

- Do not collapse unresolved alternatives into one conclusion.
- Prefer explicit contradiction records over implicit confidence downgrades.
- Record what additional evidence would discriminate between alternatives.

## TODO Checklist

- [ ] Add conflict severity and escalation categories.

## Future Improvements

- Add rule examples mapped to benchmark cases.

## References

- [`/prompts/compare-sources.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/prompts/compare-sources.md)
