---
title: Swedish Research Agent Example
purpose: Illustrate a plausible composition of the framework for Swedish genealogy research.
scope: Example architecture, data flow, and module selection.
audience:
  - Evaluators
  - Implementers
dependencies:
  - /knowledge/swedish-genealogy.md
  - /workflows/research-workflow.md
related_documents:
  - /prompts/investigate-person.md
  - /specs/agent-contracts.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Initial example composition added.
---

# Swedish Research Agent Example

## Purpose

This example shows how a Swedish-focused research agent could assemble the repository's modules into a coherent system.

## Scope

It is illustrative only and does not define a required implementation.

## Audience

- Implementers
- Evaluators

## Dependencies

The example uses Swedish knowledge modules and the core research workflow.

## Related Documents

- Investigate person prompt: [`/prompts/investigate-person.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/prompts/investigate-person.md)
- Agent contracts: [`/specs/agent-contracts.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/agent-contracts.md)

## Example Composition

- Knowledge: Swedish records, naming conventions, historical geography
- Reasoning: confidence model, conflict resolution, decision trees
- Workflows: document analysis, person investigation, timeline construction
- Outputs: person summary, timeline, research report

## TODO Checklist

- [ ] Add example memory snapshots and output payload shapes.

## Future Improvements

- Add provider-agnostic runtime sequence diagrams.

## References

- [`/templates/research-report.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/templates/research-report.md)
