---
title: Genealogy AI Framework
purpose: Define the repository's mission, structure, and architectural intent.
scope: Repository-wide overview for contributors, maintainers, and downstream integrators.
audience:
  - Maintainers
  - Contributors
  - AI systems engineers
  - Genealogy domain specialists
dependencies:
  - /docs/vision.md
  - /architecture/system-overview.md
  - /ROADMAP.md
related_documents:
  - /CONTRIBUTING.md
  - /STYLE_GUIDE.md
  - /knowledge/README.md
  - /workflows/README.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Initial repository bootstrap.
---

# Genealogy AI Framework

## Purpose

Genealogy AI Framework is an architecture-first open-source project for building AI genealogy research agents. The repository defines modular contracts for genealogy knowledge, reasoning policies, workflow orchestration, prompt design, and implementation boundaries without coupling those concerns together.

## Scope

This repository is not a family tree product, a genealogy database, or a prompt dump. It is a framework specification intended to support research agents that can analyze records, formulate hypotheses, track claims, and explain decisions in auditable ways.

## Audience

- AI engineers designing research agents
- Genealogists contributing domain knowledge
- Maintainers building reusable components
- Researchers evaluating evidence-driven reasoning systems

## Dependencies

The repository depends on the documentation system in [`/docs/README.md`](docs/README.md), the architecture contracts in [`/architecture/README.md`](architecture/README.md), and the standards defined in [`/STYLE_GUIDE.md`](STYLE_GUIDE.md).

## Related Documents

- Vision: [`/docs/vision.md`](docs/vision.md)
- Architecture: [`/architecture/system-overview.md`](architecture/system-overview.md)
- Knowledge modules: [`/knowledge/README.md`](knowledge/README.md)
- Workflow modules: [`/workflows/README.md`](workflows/README.md)
- Contribution policy: [`/CONTRIBUTING.md`](CONTRIBUTING.md)

## Repository Layout

| Path | Responsibility |
| --- | --- |
| `docs/` | Project-level intent, principles, and navigational documentation |
| `architecture/` | System boundaries, module contracts, and extensibility rules |
| `knowledge/` | Domain knowledge modules separated from reasoning logic |
| `workflows/` | Reusable research workflows and operational sequences |
| `prompts/` | Prompt interface specifications and composition rules |
| `templates/` | Structured report and planning artifacts |
| `specs/` | Formal decision models, reasoning rules, and interface contracts |
| `examples/` | Reference compositions showing how modules fit together |
| `src/` | Reserved implementation surface for framework packages |
| `tests/` | Validation strategy and future automated checks |
| `scripts/` | Repository maintenance and validation scripts |

## Architectural Principles

1. Knowledge modules contain facts, conventions, and interpretive guidance.
2. Reasoning modules define how evidence is weighed and conflicts are resolved.
3. Workflow modules determine sequence, checkpoints, and deliverables.
4. Prompt modules define interface contracts for LLM-facing behavior.
5. Implementation modules consume the above artifacts without embedding them.

## Initial Focus

Version `0.1` is optimized for Swedish genealogy because Swedish parish, household, migration, and civil records provide a strong environment for designing traceable research agents. The framework is explicitly designed so country-specific knowledge can be added without rewriting reasoning or workflow modules.

## Development Expectations

- Prefer additive modules over monolithic guides.
- Keep documents narrow in responsibility and rich in cross-reference.
- Treat provenance, confidence, and contradiction handling as first-class concerns.
- Design every interface for human review and machine execution.

## TODO Checklist

- [ ] Define the first machine-readable schema for evidence and claims.
- [ ] Add implementation package boundaries under `src/`.
- [ ] Add automated doc validation beyond frontmatter and directory checks.
- [ ] Add country extension guidance for non-Swedish modules.

## Future Improvements

- Publish JSON schemas that mirror the markdown specifications.
- Add reference adapters for archival providers and OCR pipelines.
- Add evaluation fixtures for record interpretation and evidence synthesis.

## References

- [`/docs/design-principles.md`](docs/design-principles.md)
- [`/specs/agent-contracts.md`](specs/agent-contracts.md)
- [`/ROADMAP.md`](ROADMAP.md)
