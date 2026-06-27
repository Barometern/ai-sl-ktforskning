---
title: Evidence Model
purpose: Define the conceptual ingredients of evidence used by the framework.
scope: Evidence units, claims, provenance, and contradiction surfaces.
audience:
  - Reasoning designers
  - Workflow designers
  - Implementers
dependencies:
  - /knowledge/source-evaluation.md
related_documents:
  - /specs/confidence-model.md
  - /templates/conflict-report.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Conceptual evidence model added.
---

# Evidence Model

## Purpose

The framework treats evidence as structured support for or against claims, always tied to provenance and interpretation context. This model is the bridge between document extraction and reasoning.

## Scope

This is a conceptual model pending machine-readable schemas.

## Audience

- Reasoning designers
- Implementers

## Dependencies

Source characterization is defined in [`/knowledge/source-evaluation.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/source-evaluation.md).

## Related Documents

- Confidence model: [`/specs/confidence-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/confidence-model.md)
- Conflict report template: [`/templates/conflict-report.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/templates/conflict-report.md)

## Core Concepts

- `source`: the artifact from which observations are derived
- `observation`: a recorded detail extracted from a source
- `claim`: an asserted proposition about a person, event, relationship, or place
- `support edge`: the link between an observation and a claim
- `conflict edge`: an explicit contradiction requiring review

## TODO Checklist

- [ ] Add schema candidates for observation and claim identifiers.

## Future Improvements

- Add a graph representation for evidence accumulation.

## References

- [`/workflows/research-memory.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/research-memory.md)
