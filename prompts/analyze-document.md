---
title: Analyze Document Prompt Contract
purpose: Define the prompt interface for single-document genealogical analysis.
scope: Inputs, outputs, and behavioral constraints for document analysis tasks.
audience:
  - Prompt authors
  - Implementers
dependencies:
  - /workflows/document-analysis.md
  - /knowledge/record-types.md
related_documents:
  - /knowledge/source-evaluation.md
  - /templates/research-report.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Document analysis prompt contract added.
---

# Analyze Document Prompt Contract

## Purpose

This prompt contract defines how a model should analyze a genealogical document and return structured observations with provenance and uncertainty.

## Scope

It is a task interface, not a reusable source of domain truth.

## Audience

- Prompt authors
- Implementers

## Dependencies

Workflow ownership is defined in [`/workflows/document-analysis.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/document-analysis.md).

## Related Documents

- Source evaluation: [`/knowledge/source-evaluation.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/source-evaluation.md)

## Contract Summary

- Input: source metadata, image or transcription, relevant record-type context
- Output: structured observations, uncertainty markers, source characterization, open questions
- Constraint: transcription and interpretation must be clearly separated

## TODO Checklist

- [ ] Add example output objects when schemas are available.

## Future Improvements

- Add multimodal guidance for image-first extraction flows.

## References

- [`/specs/agent-contracts.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/agent-contracts.md)
