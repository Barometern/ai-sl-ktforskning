---
title: Script Strategy
purpose: Define the role of repository maintenance scripts and validation utilities.
scope: Development support scripts, not framework runtime code.
audience:
  - Maintainers
  - Contributors
dependencies:
  - /tests/README.md
related_documents:
  - /scripts/validate_frontmatter.sh
  - /scripts/validate_structure.sh
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Script strategy added.
---

# Script Strategy

## Purpose

Scripts in this directory support repository hygiene, validation, and future developer workflows. They should remain small, explicit, and language-agnostic where possible.

## Scope

This directory is not for production runtime logic.

## Audience

- Maintainers
- Contributors

## Dependencies

Testing strategy is defined in [`/tests/README.md`](../tests/README.md).

## Related Documents

- Frontmatter validation: [`/scripts/validate_frontmatter.sh`](validate_frontmatter.sh)
- Structure validation: [`/scripts/validate_structure.sh`](validate_structure.sh)

## TODO Checklist

- [ ] Add schema validation scripts when formal schemas exist.

## Future Improvements

- Add release preparation and changelog automation.

## References

- [`/.github/workflows/ci.yml`](../.github/workflows/ci.yml)
