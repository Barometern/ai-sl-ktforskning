---
title: Style Guide
purpose: Define the mandatory writing, structure, terminology, and documentation standards for the Genealogy AI Framework knowledge base.
scope: All repository documentation, including knowledge modules, workflow definitions, prompt contracts, architecture records, templates, specifications, examples, and future operational documentation.
audience:
  - Maintainers
  - Documentation authors
  - Domain experts
  - AI systems designers
  - Reviewers
dependencies:
  - /README.md
  - /docs/design-principles.md
  - /architecture/module-boundaries.md
related_documents:
  - /CONTRIBUTING.md
  - /docs/vision.md
  - /knowledge/README.md
  - /specs/README.md
status: canonical
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.2.0
    date: 2026-06-27
    summary: Rewritten as the normative publication standard for the repository knowledge base.
  - version: 0.1.0
    date: 2026-06-27
    summary: Initial repository bootstrap version.
---

# Style Guide

## Purpose

This document is the editorial and structural authority for the Genealogy AI Framework repository. Its function is not cosmetic. It exists to guarantee that every file in the knowledge base is internally consistent, interoperable with other files, legible to expert readers, and predictable for LLM-based systems that will consume the repository as reference material.

The repository is designed as a permanent knowledge system rather than a collection of notes. Documents must therefore be written with the assumption that they will be reused, quoted, operationalized, and extended over time by both humans and machines.

## Scope

This guide applies to every document that explains, defines, constrains, or operationalizes the framework. That includes high-level vision documents, domain knowledge, source interpretation rules, research workflows, prompt contracts, templates, examples, and formal specifications.

This guide does not govern implementation syntax in a future codebase beyond the documentation-facing rules that implementation artifacts must respect. When code is eventually introduced, code style may have language-specific supplements, but no supplement may override the terminology or conceptual rules in this document.

## Audience

- Maintainers responsible for publication quality
- Authors writing new knowledge-base documents
- Reviewers evaluating consistency and precision
- Genealogists contributing domain expertise
- AI engineers designing systems against the repository

## Dependencies

This guide depends on the architectural separation rules defined in [`/architecture/module-boundaries.md`](architecture/module-boundaries.md) and the conceptual principles defined in [`/docs/design-principles.md`](docs/design-principles.md). Repository-level intent is defined in [`/README.md`](README.md).

## Related Documents

- Repository overview: [`/README.md`](README.md)
- Vision: [`/docs/vision.md`](docs/vision.md)
- Design principles: [`/docs/design-principles.md`](docs/design-principles.md)
- Module boundaries: [`/architecture/module-boundaries.md`](architecture/module-boundaries.md)
- Contribution policy: [`/CONTRIBUTING.md`](CONTRIBUTING.md)

## Governing Principles

The repository must read as if it were authored by one disciplined editorial team. Differences in subject matter are expected; differences in document quality, terminology, granularity, and structure are not.

Every document must satisfy five governing principles:

1. It must own a clearly bounded responsibility.
2. It must define or apply terminology consistently.
3. It must distinguish fact, interpretation, and instruction.
4. It must be useful both as a human reference and as machine-consumable guidance.
5. It must reduce ambiguity rather than merely describe it.

These principles are stricter in this repository than in ordinary technical documentation because the documents will serve as operational input to AI systems. An imprecise sentence is not just an editorial flaw; it is a future reasoning defect.

## Language Policy

### Canonical language

The canonical language for repository documentation is English. This rule exists to support global contributors, downstream open-source adoption, and consistent model consumption across environments.

### Allowed exceptions

Swedish may appear in the following cases:

- quoted record text
- archival titles in their original language
- examples where Swedish wording is itself the object of interpretation
- domain terms for which translation would destroy precision

When Swedish is used inside an English document, the author must make its role explicit. The reader should never have to guess whether a Swedish phrase is a literal transcription, a normalized form, an interpretation, or a label.

### Translation discipline

If a document introduces a Swedish source term that matters beyond a single example, the first occurrence must include a concise English explanation. Repeated explanations are unnecessary after the term is established, but silent use of unexplained domain language is not acceptable.

## Document Authority and Ownership

Each document must have a single primary job. A file may summarize neighboring modules, but it must not quietly become the canonical owner of concepts defined elsewhere.

The following ownership rules are mandatory:

| Directory | Owns | Must not become |
| --- | --- | --- |
| `knowledge/` | Domain facts, historical context, source characteristics, terminology | A workflow manual or prompt library |
| `specs/` | Normative reasoning rules, contract definitions, controlled decision logic | A country-specific research guide |
| `workflows/` | Ordered process definitions, checkpoints, escalation points, outputs | A general encyclopedia of genealogical knowledge |
| `prompts/` | LLM task interface definitions and output constraints | The source of truth for domain rules |
| `templates/` | Output structures and report shapes | A reasoning engine in prose form |
| `architecture/` | System structure, boundaries, extension rules | A backlog or casual planning area |
| `docs/` | Repository-wide framing and navigation | A duplicate copy of module-level specifications |

Whenever a document drifts outside its ownership boundary, the correction is to move or split content, not to add caveats around the drift.

## Required Structural Pattern

Every Markdown document in the repository must follow a stable structural pattern so both readers and tools can infer how to use it.

### Frontmatter

Frontmatter is mandatory. It must be complete, accurate, and updated when the document meaning changes. Frontmatter is not metadata decoration; it is part of the document interface.

Required frontmatter fields:

- `title`
- `purpose`
- `scope`
- `audience`
- `dependencies`
- `related_documents`
- `status`
- `maintainer`
- `revision_history`

The values must be meaningful. Vague values such as "general", "misc", or "TBD" are not acceptable.

### Required sections

All Markdown documents must include the following sections at minimum:

- `Purpose`
- `Scope`
- `Audience`
- `Dependencies`
- `Related Documents`
- `TODO Checklist`
- `Future Improvements`
- `References`

The presence of these headings alone is not sufficient. They must contain content specific to the document's function.

### Section ordering

The default order should remain stable across files unless there is a strong reason to diverge:

1. Purpose
2. Scope
3. Audience
4. Dependencies
5. Related Documents
6. The document-specific substantive sections
7. TODO Checklist
8. Future Improvements
9. References

Predictable ordering improves skimmability for humans and segmentation reliability for AI systems.

## Writing Standard

### Tone

The house style is professional, technical, and restrained. The repository should sound like a serious reference work, not a marketing site, internal brainstorm, or tutorial blog.

Write with:

- precision
- confidence proportionate to evidence
- explicit scope boundaries
- low rhetorical noise
- high information density

Avoid:

- motivational language
- casual filler
- exaggerated claims
- vague abstractions presented as conclusions
- pseudo-inspirational framing about the future of AI

### Sentence design

Prefer declarative sentences with one clear claim at a time. A long sentence is acceptable only when its structure improves precision. A short sentence is not automatically better if it removes necessary qualifiers.

Documents should use qualification carefully. The goal is not maximal certainty; the goal is accurate certainty. In genealogy, overstatement is a substantive error.

### Paragraph design

Each paragraph should perform one of four functions:

- define
- distinguish
- constrain
- explain implications

If a paragraph does none of these, it probably does not belong.

### Lists and tables

Use lists when sequence, criteria, or category membership matters. Use tables when the reader needs to compare stable dimensions across concepts. Do not convert nuanced reasoning into bullets if prose is clearer.

## Normative Language

Normative terms must be used deliberately:

- `must` indicates a non-optional requirement
- `must not` indicates a prohibited behavior
- `should` indicates a strong recommendation with limited exceptions
- `should not` indicates a generally disallowed pattern unless an explicit reason is documented
- `may` indicates a permitted option

Do not use normative verbs casually. If a statement is descriptive rather than binding, write it descriptively.

Examples:

- Correct: "A prompt contract must define its output constraints."
- Correct: "Household records often support longitudinal identity tracking."
- Incorrect: "Authors must understand that Swedish records are useful."  
  The sentence is rhetorical, not normative.

## Terminology Standard

Terminology is a core interface surface. The same concept must not be renamed opportunistically for variety.

### Canonical terms

The following terms are canonical and should be preferred unless a document explicitly defines a narrower variant:

| Canonical term | Meaning |
| --- | --- |
| `knowledge` | Domain facts, conventions, and interpretive context |
| `reasoning` | Rules for evaluating, comparing, and synthesizing evidence |
| `workflow` | Ordered process with stages, checkpoints, and outputs |
| `prompt contract` | Definition of model-facing task behavior, inputs, and outputs |
| `source` | The underlying artifact from which information is drawn |
| `observation` | A recorded detail extracted from a source |
| `claim` | A proposition asserted about a person, event, place, or relationship |
| `evidence` | Structured support for or against a claim |
| `hypothesis` | A provisional explanatory candidate under active investigation that has not yet been evaluated against sufficient evidence to become a claim. Once evaluated, a hypothesis becomes a claim at the appropriate confidence level. The formal mapping is defined in `/specs/claim-model.md`. |
| `conflict` | An explicit contradiction or incompatibility requiring evaluation |
| `confidence` | A structured assessment of support quality, not model self-belief |

### Terminology rules

- Do not alternate between synonyms merely to avoid repetition.
- Do not use `fact` where `claim` is intended.
- Do not use `record` and `source` as universal substitutes for one another.
- Do not use `memory` to mean both agent context and persistent claim storage in the same document unless the distinction is explicitly drawn.

### Genealogical precision

Genealogy requires distinctions that many software documents collapse. The repository must preserve at least these differences:

- source versus transcription
- transcription versus interpretation
- observation versus conclusion
- direct evidence versus indirect evidence
- identity signal versus identity proof
- unresolved alternative versus rejected hypothesis

If a document blurs these distinctions, it is not publication-ready.

## Evidence and Uncertainty Language

The repository must model uncertainty explicitly and consistently.

### Prohibited patterns

The following patterns are not allowed:

- presenting an interpretation as though it were a direct transcription
- presenting a likely identity match as a confirmed identification without justification
- using confidence language with no stated basis
- collapsing multiple unresolved persons into one narrative because one version is cleaner

### Preferred formulations

Use language that separates observation from inference:

- "The record states ..."
- "This supports the claim that ..."
- "This may indicate ..."
- "The evidence remains insufficient to conclude ..."
- "An alternative hypothesis remains viable because ..."

### Confidence wording

When confidence is discussed in prose, the basis must be legible. A confidence statement should be traceable to one or more of the following:

- source quality
- source proximity to the event
- consistency across records
- temporal or geographic plausibility
- remaining contradiction

Confidence must never be described as a model feeling or intuitive certainty.

## Country-Specific Content Rules

The repository begins with Swedish genealogy, but Swedish practice must not be silently universalized.

Authors must:

- mark Swedish-specific rules as Swedish-specific
- state when a pattern is common rather than mandatory
- distinguish archival practice from genealogical inference
- avoid implying that Swedish source abundance is representative of all research environments

When a rule is likely to differ by country, the document should either:

- narrow its scope explicitly to Sweden, or
- abstract the rule so it remains valid across countries

## Cross-Referencing Policy

Cross-references are mandatory because this repository is designed as an interconnected knowledge graph in prose form.

### Required behavior

- Link to the canonical owner of a concept when that concept is discussed but not defined locally.
- Add references that help the reader move from domain knowledge to reasoning, or from reasoning to workflow, without guesswork.
- Prefer a small number of intentional references over long indiscriminate lists.

### Prohibited behavior

- Do not create isolated documents with no outgoing references.
- Do not duplicate a definition locally when a precise canonical definition exists elsewhere.
- Do not link merely because two files share a general topic; the relationship should be operationally relevant.

### Bidirectional linking

When two documents have a stable dependency relationship, authors should update both sides over time. The repository should gradually form a deliberate graph rather than a set of one-way dead ends.

## Heading and Hierarchy Rules

Headings must communicate function, not mood. A heading such as `Important Notes` is almost always weaker than a specific heading such as `Conflict Classes` or `Source Reliability Limits`.

Use heading levels consistently:

- `#` for the document title
- `##` for primary sections
- `###` for document-specific subsections
- `####` only when a subsection genuinely contains multiple independently useful units

Do not create deep heading stacks simply to imitate structure. If a section becomes too fragmented, the document may need to be split.

## Examples Policy

Examples are allowed only when they clarify a rule, distinction, or workflow stage that would otherwise remain abstract.

Good examples:

- show the difference between transcription and interpretation
- illustrate why two similar names should remain separate hypotheses
- demonstrate how a source class changes evidentiary weight

Weak examples:

- generic "John Doe" filler with no genealogical meaning
- examples that simply restate the rule in shorter form
- examples detached from a concrete reasoning problem

Examples should be concise, realistic, and explicitly labeled as examples rather than normative definitions.

## Tables, Decision Structures, and AI Readability

The repository should be optimized for both close reading and structured extraction by LLMs.

Authors should therefore prefer:

- stable headings
- consistent term reuse
- compact comparison tables
- clearly delimited criteria lists
- explicit stage or state descriptions
- visible scope boundaries

When a reader or model needs to answer questions such as "what is the difference between these concepts?" or "what are the required steps?", the answer should be inferable without reconstructing the author's intent from scattered prose.

### Machine-readable prose habits

Documents should be written so that an AI system can reliably identify:

- what the document owns
- what it depends on
- what rules are binding
- what terminology is canonical
- what remains unresolved

This does not require unnatural writing. It requires disciplined writing.

## Naming Rules for Files and Directories

### Filenames

Use lowercase kebab-case for ordinary repository files:

- `source-evaluation.md`
- `research-workflow.md`
- `conflict-resolution.md`

Exceptions are allowed only where the repository intentionally exposes a title-style artifact as a publication-facing deliverable. Such exceptions should be rare and deliberate.

### Directory entry points

Use `README.md` only for directory-level orientation. A directory `README.md` should explain the directory's purpose, boundaries, and navigation model. It should not silently become the most detailed document in the directory.

### Stability

Do not rename files casually. File names are part of the repository's addressing system for both humans and machines.

## Citation and Reference Rules

The repository is not primarily a bibliography, but it must still behave like serious reference material.

### Internal references

Internal references are mandatory whenever a concept depends on a canonical owner elsewhere in the repository.

### External references

External references should be used when:

- a historical claim depends on authoritative context
- an archival concept is likely to be misunderstood without source grounding
- a future implementation standard is being aligned to a real external protocol

External references must be chosen conservatively. Prefer authoritative and stable sources over blog posts or derivative summaries.

### Genealogical sourcing

When a document discusses genealogical method rather than a specific archival record, it should still be possible for a knowledgeable reader to understand what type of evidence tradition or methodological practice is being invoked.

## Revision History Standard

Revision history entries should record substantive meaning changes, not trivial formatting edits unless those edits affect interpretation or document interface.

Good revision history summaries:

- "Clarified difference between source characterization and confidence scoring."
- "Split Swedish naming discussion from general research principles."
- "Added normative rules for unresolved identity hypotheses."

Weak revision history summaries:

- "Updated doc"
- "Changes"
- "Fixed stuff"

## Publication Quality Checklist

Before a document is considered ready, reviewers should be able to answer "yes" to all of the following:

- Does the document have a single, well-defined job?
- Is its terminology consistent with repository standards?
- Does it separate observation, interpretation, and instruction where relevant?
- Does it avoid duplicating a canonical definition from another file?
- Does it state scope boundaries explicitly?
- Does it provide enough detail to be operationally useful?
- Does it include meaningful references to related repository modules?
- Could an LLM use this document without having to guess the author's intended semantics?

If the answer to any of these is no, the document should be revised before being treated as canonical knowledge.

## Review Heuristics

Reviewers should look for the following failure modes:

- conceptual overlap disguised as completeness
- synonym drift that weakens term precision
- country-specific claims framed as general method
- summaries that replace needed operational detail
- normative language used where only description is warranted
- ambiguity about whether a statement is a record fact, an extracted observation, or an inference

These are not stylistic preferences. They are structural defects in a knowledge repository.

## Repository-Specific Editorial Rules

### No placeholder writing

The repository must not contain filler such as:

- "TBD"
- "More details later"
- "This section will be expanded"
- generic instructional boilerplate with no repository-specific value

If a topic is not ready, the correct action is to omit it, narrow scope, or describe the known boundary clearly.

### No false completeness

Authors must not create an illusion of completeness by listing broad topic headings with shallow content underneath. A document may be narrow, but if it exists, it must be genuinely useful within its scope.

### No hidden implementation assumptions

Documentation must not quietly assume a specific model provider, orchestration library, storage engine, or archive vendor unless the document explicitly states that its scope is provider-specific.

## TODO Checklist

- [ ] Add a repository-wide glossary document once the first wave of canonical knowledge files has stabilized.
- [ ] Add a formal diagram standard for evidence graphs, workflow states, and architectural layer diagrams.
- [ ] Add explicit guidance for machine-readable schema prose once JSON schema artifacts are introduced.
- [ ] Add a controlled vocabulary appendix for Swedish archival abbreviations and record-series references.

## Future Improvements

Future iterations of this guide should deepen, not relax, the publication standard. The next improvements should focus on three areas: a formal glossary that locks high-value terminology; diagram conventions that make visual assets as disciplined as prose; and schema-writing rules that ensure parity between narrative definitions and machine-readable contracts.

Another likely improvement is a companion editorial checklist for domain reviewers, especially genealogists who may contribute knowledge without daily familiarity with software architecture. That supplement should help preserve methodological rigor without forcing contributors to infer the repository's documentation philosophy from examples alone.

## References

- [`/README.md`](README.md)
- [`/docs/design-principles.md`](docs/design-principles.md)
- [`/architecture/module-boundaries.md`](architecture/module-boundaries.md)
- [`/knowledge/research-principles.md`](knowledge/research-principles.md)
- [`/knowledge/source-evaluation.md`](knowledge/source-evaluation.md)
- [`/specs/confidence-model.md`](specs/confidence-model.md)
