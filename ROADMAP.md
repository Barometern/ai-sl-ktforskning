---
title: Roadmap
purpose: Define the staged evolution of the project from repository bootstrap to framework implementation.
scope: Strategic milestones, not task-level backlog detail.
audience:
  - Maintainers
  - Contributors
  - Potential adopters
dependencies:
  - /README.md
  - /architecture/system-overview.md
related_documents:
  - /CHANGELOG.md
  - /docs/vision.md
status: draft
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Initial roadmap published.
---

# Roadmap

## Purpose

The roadmap sequences the project so that architecture, knowledge quality, and evaluation foundations exist before heavy implementation work begins.

## Scope

This roadmap describes major phases for the repository and framework. It is not a substitute for issue tracking.

## Audience

- Maintainers planning releases
- Contributors selecting workstreams
- Users evaluating adoption timing

## Dependencies

Milestones depend on the system boundaries in [`/architecture/system-overview.md`](architecture/system-overview.md).

## Related Documents

- Vision: [`/docs/vision.md`](docs/vision.md)
- Changelog: [`/CHANGELOG.md`](CHANGELOG.md)

## Phases

| Phase | Objective | Exit Criteria |
| --- | --- | --- |
| `0.1 Bootstrap` | Establish repository architecture and standards | Core documentation graph exists and validates |
| `0.2 Schemas` | Define machine-readable claim, evidence, and workflow contracts | Specs mapped to JSON schema drafts |
| `0.3 Runtime Core` | Implement package boundaries for orchestration and reasoning interfaces | `src/` contains minimal reusable abstractions |
| `0.4 Evaluation` | Add fixtures and scoring for record interpretation quality | `tests/` contains repeatable evaluation datasets |
| `0.5 Extensions` | Support country modules beyond Sweden | Extension guide and at least one non-Swedish pilot |

## Near-Term Priorities

- Formalize evidence and claim schemas.
- Document decision records and architecture changes.
- Define prompt contract test cases.
- Establish example agent compositions without provider lock-in.

## TODO Checklist

- [ ] Add milestone owners and dependency mapping.
- [ ] Add release criteria for experimental versus stable modules.
- [ ] Add compatibility policy for prompt and schema revisions.

## Future Improvements

- Publish a public project board once issue taxonomy exists.
- Add a roadmap view for country extension modules.

## References

- [`/specs/README.md`](specs/README.md)
- [`/examples/README.md`](examples/README.md)
