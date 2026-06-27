---
title: Research Memory Workflow
purpose: Define how agent memory should preserve claims, decisions, and unresolved questions over time.
scope: Memory lifecycle for research sessions and multi-step investigations.
audience:
  - Implementers
  - Workflow designers
dependencies:
  - /knowledge/evidence-model.md
  - /specs/agent-contracts.md
related_documents:
  - /templates/research-plan.md
  - /workflows/research-workflow.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Research memory workflow added.
---

# Research Memory Workflow

## Purpose

Genealogy research is cumulative. Agent memory must therefore preserve not only conclusions, but also provenance, rejected hypotheses, and pending questions.

## Scope

This document defines what should be remembered and how it should be categorized. Storage implementation is deferred.

## Audience

- Implementers
- Workflow designers

## Dependencies

Evidence concepts come from [`/knowledge/evidence-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/evidence-model.md).

## Related Documents

- Agent contracts: [`/specs/agent-contracts.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/agent-contracts.md)
- Research workflow: [`/workflows/research-workflow.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/research-workflow.md)

## Memory Categories

- active research question
- accepted claims
- contested claims
- open hypotheses
- source inventory
- next actions and rationale

## TODO Checklist

- [ ] Add retention and compaction rules for long-running projects.

## Future Improvements

- Add schema guidance for memory snapshots and replay.

## References

- [`/templates/research-plan.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/templates/research-plan.md)
