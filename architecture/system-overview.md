---
title: System Overview
purpose: Describe the framework as a set of cooperating modules with clear responsibilities.
scope: Conceptual system architecture for the initial repository stage.
audience:
  - Maintainers
  - Framework implementers
  - Advanced contributors
dependencies:
  - /docs/design-principles.md
related_documents:
  - /architecture/module-boundaries.md
  - /specs/agent-contracts.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Initial system overview added.
---

# System Overview

## Purpose

The framework is organized as a layered system in which domain knowledge, reasoning policies, workflow logic, prompt interfaces, and runtime services remain independently evolvable.

## Scope

This document defines conceptual layers and integration points. It does not prescribe a specific programming language or AI provider.

## Audience

- Architecture reviewers
- Runtime implementers

## Dependencies

This overview depends on the design rules in [`/docs/design-principles.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/docs/design-principles.md).

## Related Documents

- Module boundaries: [`/architecture/module-boundaries.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/architecture/module-boundaries.md)
- Agent contracts: [`/specs/agent-contracts.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/agent-contracts.md)

## Layers

| Layer | Responsibility | Examples |
| --- | --- | --- |
| Knowledge | Domain facts, record conventions, naming systems, geography | Swedish parish records, patronymics |
| Reasoning | Confidence scoring, contradiction handling, hypothesis updates | conflict resolution, evidence weighting |
| Workflow | Ordered research tasks and checkpoints | person investigation, document analysis |
| Prompt Interface | Structured model instructions and outputs | analyze-document, compare-sources |
| Runtime | Orchestration, storage, adapters, evaluation | agent runner, memory store, provider adapters |

## Integration Rule

Lower layers must not depend on higher layers. For example, a knowledge module should not reference a prompt implementation, and a workflow definition should call reasoning rules rather than duplicate them.

## TODO Checklist

- [ ] Add a package diagram once initial runtime code exists.

## Future Improvements

- Add runtime lifecycle diagrams for memory, evidence extraction, and review loops.

## References

- [`/workflows/research-workflow.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/research-workflow.md)
