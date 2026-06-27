---
title: Compare Sources Prompt Contract
purpose: Define the prompt interface for comparing two or more sources about the same claim space.
scope: Contradiction detection, corroboration, and synthesis behavior.
audience:
  - Prompt authors
  - Implementers
dependencies:
  - /knowledge/source-evaluation.md
  - /specs/conflict-resolution.md
related_documents:
  - /workflows/record-linking.md
  - /templates/conflict-report.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Source comparison prompt contract added.
---

# Compare Sources Prompt Contract

## Purpose

This prompt contract defines how a model should compare sources, identify agreement and conflict, and summarize implications for downstream reasoning.

## Scope

It supports focused comparison tasks rather than end-to-end investigation.

## Audience

- Prompt authors
- Implementers

## Dependencies

Source characterization and conflict policy are required inputs.

## Related Documents

- Record linking workflow: [`/workflows/record-linking.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/record-linking.md)
- Conflict report template: [`/templates/conflict-report.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/templates/conflict-report.md)

## Contract Summary

- Input: source set, target claims, comparison dimensions
- Output: agreements, contradictions, missing evidence, confidence implications
- Constraint: conflict explanation must cite the differentiating observations

## TODO Checklist

- [ ] Add a minimal structured comparison schema.

## Future Improvements

- Add batch comparison guidance for repeated source classes.

## References

- [`/specs/conflict-resolution.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/conflict-resolution.md)
