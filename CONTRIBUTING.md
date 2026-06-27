---
title: Contributing Guide
purpose: Define the process and quality bar for contributions to the repository.
scope: All documentation, specifications, examples, scripts, and future implementation work.
audience:
  - Contributors
  - Reviewers
  - Maintainers
dependencies:
  - /STYLE_GUIDE.md
  - /architecture/module-boundaries.md
related_documents:
  - /CODE_OF_CONDUCT.md
  - /SECURITY.md
  - /docs/design-principles.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Initial contribution policy.
---

# Contributing Guide

## Purpose

This document defines how changes are proposed, reviewed, and merged. Contributions are expected to improve clarity, modularity, and long-term maintainability rather than add isolated content.

## Scope

The guide applies to documentation, architecture specifications, scripts, templates, tests, and future framework code. Country-specific modules are welcome when they follow the same separation of concerns used by the core repository.

## Audience

- New contributors preparing a first change
- Domain experts adding knowledge modules
- Maintainers reviewing architectural impact

## Dependencies

Contributors must follow the rules in [`/STYLE_GUIDE.md`](STYLE_GUIDE.md) and preserve the boundaries in [`/architecture/module-boundaries.md`](architecture/module-boundaries.md).

## Related Documents

- Conduct expectations: [`/CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md)
- Security reporting: [`/SECURITY.md`](SECURITY.md)
- Design principles: [`/docs/design-principles.md`](docs/design-principles.md)

## Contribution Workflow

1. Open an issue or draft proposal for non-trivial architectural changes.
2. Identify the module boundary affected by the change.
3. Update the narrowest document or component that owns the concern.
4. Add or update cross-references so the change is discoverable.
5. Run repository validation before opening a pull request.

## Review Criteria

- Single responsibility is preserved.
- Terminology stays consistent with existing modules.
- Cross-document duplication is reduced rather than increased.
- Swedish-specific guidance is not incorrectly presented as universal behavior.
- Future implementation implications are explicit when relevant.

## Pull Request Expectations

- Summarize the problem, not just the change.
- List impacted modules and contracts.
- Note whether the contribution changes knowledge, reasoning, workflow, prompts, or implementation boundaries.
- Add follow-up issues for deliberately deferred work.

## TODO Checklist

- [ ] Add a decision record template for architectural proposals.
- [ ] Define labeling conventions for module categories.
- [ ] Add an examples review checklist for proposed agent compositions.

## Future Improvements

- Add a maintainer guide for release management.
- Add contribution templates for new country modules.
- Add schema evolution guidance for machine-readable artifacts.

## References

- [`/README.md`](README.md)
- [`/scripts/validate_frontmatter.sh`](scripts/validate_frontmatter.sh)
- [`/scripts/validate_structure.sh`](scripts/validate_structure.sh)
