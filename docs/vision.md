---
title: Project Vision
purpose: Define the long-term direction and non-goals of the framework.
scope: Strategic intent and product positioning.
audience:
  - Maintainers
  - Contributors
  - Potential adopters
dependencies:
  - /README.md
related_documents:
  - /ROADMAP.md
  - /docs/design-principles.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Initial vision statement.
---

# Project Vision

## Purpose

The framework aims to make genealogy AI systems auditable, modular, and domain-aware. A strong genealogy agent should not merely produce plausible text; it should reason from records, preserve provenance, expose uncertainty, and support human review.

## Scope

The project focuses on framework capabilities rather than end-user tree management, website features, or repository-specific prompt engineering.

## Audience

- Maintainers defining scope
- Contributors evaluating feature fit
- Teams assessing the framework as a foundation

## Dependencies

The repository overview in [`/README.md`](../README.md) and the roadmap in [`/ROADMAP.md`](../ROADMAP.md) define the project context.

## Related Documents

- Design principles: [`/docs/design-principles.md`](design-principles.md)
- System overview: [`/architecture/system-overview.md`](../architecture/system-overview.md)

## Non-Goals

- Shipping a genealogy database application
- Providing legal identity verification
- Replacing human genealogical judgment
- Hard-coding one provider, model vendor, or national research method as universal

## Success Criteria

- Knowledge can be updated without rewriting workflows.
- Prompts can evolve without changing source evaluation rules.
- Research outputs are explainable and traceable to evidence.
- Country modules can be added without breaking the core architecture.

## TODO Checklist

- [ ] Add measurable adoption and quality goals for the first public milestone.

## Future Improvements

- Add governance and sustainability plans for a growing contributor base.

## References

- [`/knowledge/swedish-genealogy.md`](../knowledge/swedish-genealogy.md)
- [`/specs/confidence-model.md`](../specs/confidence-model.md)
