---
title: Document Analysis Workflow
purpose: Define how an agent should inspect a single genealogical document.
scope: Record intake, extraction, provenance capture, and ambiguity logging.
audience:
  - Workflow designers
  - Prompt authors
dependencies:
  - /knowledge/record-types.md
  - /knowledge/source-evaluation.md
related_documents:
  - /prompts/analyze-document.md
  - /templates/research-report.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Document analysis workflow added.
---

# Document Analysis Workflow

## Purpose

This workflow defines the sequence for turning a raw document into structured observations with provenance and uncertainty markers.

## Scope

It applies to one source artifact at a time.

## Audience

- Prompt authors
- Implementers

## Dependencies

Record taxonomy and source evaluation criteria are defined in the knowledge modules.

## Related Documents

- Analyze document prompt: [`/prompts/analyze-document.md`](../prompts/analyze-document.md)

## Workflow Stages

1. Identify source type and archival context.
2. Extract explicit observations.
3. Separate interpretation from transcription.
4. Mark illegible or uncertain segments.
5. Emit normalized observations for downstream reasoning.

## TODO Checklist

- [ ] Add OCR quality and handwriting confidence checkpoints.

## Future Improvements

- Add multimodal handling guidance for scanned record images.

## References

- [`/knowledge/evidence-model.md`](../knowledge/evidence-model.md)
