---
title: Source Evaluation
purpose: Define how genealogical sources should be described, differentiated, and evaluated before claim-level reasoning is applied.
scope: Source characterization, evidentiary posture, provenance quality, information proximity, distortion risk, and methodological cautions relevant to genealogical records.
audience:
  - Genealogists
  - AI systems designers
  - Reasoning designers
  - Workflow authors
  - Reviewers
dependencies:
  - /STYLE_GUIDE.md
  - /knowledge/research-principles.md
  - /knowledge/record-types.md
related_documents:
  - /knowledge/evidence-model.md
  - /specs/confidence-model.md
  - /specs/conflict-resolution.md
  - /workflows/document-analysis.md
status: canonical
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.2.0
    date: 2026-06-27
    summary: Expanded into a canonical source characterization and evidentiary evaluation reference.
  - version: 0.1.0
    date: 2026-06-27
    summary: Initial repository bootstrap version.
---

# Source Evaluation

## Purpose

This document defines how a genealogical source should be evaluated before its contents are used in broader reasoning. Its role is to characterize the source itself, the conditions under which it was created, the kind of information it can plausibly support, and the risks that accompany its use.

This distinction is essential. A researcher cannot responsibly weigh evidence until the source supplying that evidence has been described with adequate precision. Source evaluation is therefore not the same as confidence scoring and not the same as claim acceptance. It is the disciplined characterization that must occur first.

## Scope

This document covers source-level evaluation, including original versus derivative status, proximity to the recorded event, informant quality, completeness, legibility, distortion risk, and contextual limits. It also defines how these dimensions should be interpreted without collapsing them into a single oversimplified score.

This document does not define the final confidence attached to a claim, nor does it define conflict resolution logic or workflow stage sequencing. Those concerns are owned elsewhere.

## Audience

- Genealogists evaluating records
- AI systems designers building evidence-aware agents
- Reasoning designers converting source characterization into downstream rules
- Workflow authors defining document analysis behavior
- Reviewers assessing whether conclusions rest on properly understood sources

## Dependencies

This document depends on the methodological guardrails in [`/knowledge/research-principles.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/research-principles.md), the terminology and precision rules in [`/STYLE_GUIDE.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/STYLE_GUIDE.md), and the source taxonomy context in [`/knowledge/record-types.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/record-types.md).

## Related Documents

- Evidence model: [`/knowledge/evidence-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/evidence-model.md)
- Confidence model: [`/specs/confidence-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/confidence-model.md)
- Conflict resolution: [`/specs/conflict-resolution.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/conflict-resolution.md)
- Document analysis workflow: [`/workflows/document-analysis.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/document-analysis.md)

## Why Source Evaluation Comes First

Genealogical reasoning fails early when source interpretation is skipped or flattened. A record may contain a name, date, and place, but those details cannot be treated as equally trustworthy merely because they appear in the same document. The value of a record depends on what kind of source it is, who supplied the information, how close it was to the event, how the record has been transmitted, and what kinds of mistakes are common in that documentary context.

Source evaluation therefore answers a foundational question: what kind of evidentiary object is this, and what can it responsibly support?

Without that step, later reasoning tends to inherit hidden distortions. An agent may compare records numerically, narratively, or structurally, but if it has not first characterized their evidentiary posture, its confidence language will be shallow and its conclusions fragile.

## Conceptual Boundary

Source evaluation must be kept distinct from several neighboring tasks.

### It is not transcription

Transcription attempts to represent what the record says. Source evaluation asks what kind of record this is, how it came into existence, and what methodological caution its use requires.

### It is not interpretation of a claim

A record may be well characterized and still support multiple interpretations. Source evaluation does not decide whether a person in one source is the same person in another. It supplies the conditions under which such a comparison should later occur.

### It is not final confidence

High-quality sources can support weak conclusions if the evidence is sparse or conflicting. Lower-quality sources can still contribute meaningfully when used in combination with stronger material. Source evaluation informs confidence; it does not replace it.

## Core Evaluation Principle

The researcher must evaluate a source according to how the information entered the record, not merely how formal, old, or authoritative the document appears.

This principle matters because genealogical records often project institutional legitimacy. A parish register, court abstraction, household record, family history, or later certificate may all look authoritative in different ways. But the correct evaluative question is not "does this document look official?" The correct question is "what is the path between the event and the information now recorded here?"

## Major Evaluation Dimensions

Source evaluation in this framework should be organized across multiple dimensions. These dimensions are complementary rather than interchangeable.

### Source status: original, derivative, or compiled

The first question concerns the relationship between the record at hand and the earlier act of recording or observation.

- An `original` source is close to the initial act of documentation.
- A `derivative` source reproduces, abstracts, indexes, copies, translates, or summarizes earlier material.
- A `compiled` source assembles information from multiple earlier sources, often with additional interpretation.

These categories are useful but not sufficient on their own. An original record may still contain secondhand information. A derivative source may accurately preserve a now-lost original. A compiled source may be methodologically excellent or deeply unreliable. The category is a starting point, not a verdict.

### Proximity to the event

The second question concerns how close the record is to the event it reports.

Events recorded near the time they occurred are often less vulnerable to memory drift, retelling, later harmonization, and inherited error. However, proximity does not guarantee accuracy. A contemporary record may still contain rumor, assumption, or clerical misunderstanding.

The methodological importance of event proximity is therefore conditional. It generally strengthens evidentiary value, but only in combination with the other dimensions below.

### Informant proximity

The third question concerns who supplied the information and how directly that person was positioned relative to the event.

The researcher should distinguish among situations such as:

- the person directly involved in the event
- a close witness or participant
- a household member or relative reporting from memory
- an official recording information supplied by others
- a later compiler with unknown informational basis

Informant proximity is often more important than documentary appearance. A later death record may be an original administrative record in formal terms while still containing weak information about a birth that occurred decades earlier and was reported by someone with limited knowledge.

### Recording context

The fourth question concerns why the record was created and what institutional or social setting shaped it.

Records are created for reasons: taxation, parish oversight, migration control, legal administration, sacramental recording, inheritance, military organization, burial registration, or later retrospective certification. The purpose of the record affects what was recorded carefully, what may have been abbreviated, and what may have been irrelevant to the recorder.

The recording context can therefore influence:

- which details are likely to be accurate
- which details may have been standardized
- which omissions are unsurprising
- which categories may reflect administrative convenience rather than lived reality

### Completeness and specificity

Some records provide dense identity detail. Others provide minimal signals. A source should be evaluated according to whether it contains enough specificity to support the type of conclusion being asked of it.

Completeness should not be confused with evidentiary strength. A verbose record is not always a strong record. But the amount and specificity of information matter for later comparison. Sparse records can support narrow conclusions while remaining unsuitable for broader identity claims.

### Legibility and extractive reliability

The reliability of a source as used in practice depends partly on whether it can be read and extracted accurately. Poor handwriting, physical damage, faded ink, OCR errors, indexing mistakes, and partial scans may introduce uncertainty even when the underlying source would otherwise be strong.

This dimension concerns the quality of access to the source, not just the source itself. A damaged image of a strong source may function as weak evidence in the current state because the relevant content cannot be recovered confidently.

### Transmission and transformation risk

The researcher should ask what transformations the information may have undergone between the event and the current representation.

Examples include:

- copying from one register to another
- extraction into an index
- translation across languages
- normalization of names or dates
- editorial summarization
- transcription by a modern volunteer or archive staff member

Every transformation is a possible error surface. Transformation does not automatically invalidate the source, but it changes how the information should be interpreted.

## Source Evaluation Is Field-Specific

A single source may deserve different evaluations for different pieces of information.

For example, a death record may be strong evidence for the date and place of death while providing weaker evidence for the exact birth details of the deceased. A household record may be strong for residence continuity but weaker for inferred kinship unless the relationship is explicitly documented. A probate document may be strong for named heirs but incomplete for the full household structure.

This principle is essential: source evaluation should be applied at the level of information type, not merely at the document level.

## Common Source Categories and Typical Strengths

The framework should not reduce all source types to universal rankings, but it is still useful to describe common tendencies.

| Source tendency | Often stronger for | Often weaker for |
| --- | --- | --- |
| Near-contemporary vital record | Event timing and local administrative details | Remote biographical details supplied secondhand |
| Household continuity record | Residence sequence, household composition over time | Exact identity proof where multiple similar individuals exist |
| Migration record | Administrative movement details | Full prior life history |
| Probate or legal record | Named relationships with legal significance | Complete life chronology |
| Later family compilation | Leads, lineage hypotheses, remembered connections | Unverified dates, merged identities, undocumented assumptions |

These are tendencies, not fixed rankings. The same source category can vary considerably by jurisdiction, period, recorder, and preservation history.

## Direct, Indirect, and Negative Use of Sources

Source evaluation must account not only for what a record states, but for how it is being used.

### Direct use

A source is used directly when the relevant conclusion closely matches a statement or observation preserved in the record. This does not eliminate the need for evaluation, but it narrows the interpretive gap.

### Indirect use

A source is used indirectly when the conclusion emerges through correlation with other records rather than through one explicit statement. In these cases, source evaluation becomes especially important because small distortions can accumulate across the comparison set.

### Negative use

A source may also matter because an expected detail is absent. Negative use requires caution. An omission has meaning only when the record type, coverage, and recording practice justify expecting the detail to appear.

## Original Versus Derivative: Necessary but Incomplete

Researchers often over-rely on the distinction between original and derivative sources. That distinction remains useful, but it must be handled carefully.

### Why the distinction matters

Derivative sources increase the risk of transmission error, editorial interpretation, abbreviation, normalization, and omission. They should therefore not be treated as transparent windows into the original without reason.

### Why the distinction is not enough

A derivative source can sometimes preserve information accurately when the original is inaccessible, lost, or otherwise unavailable. Conversely, an original source may contain weak secondhand information or careless recording. The methodological error is to treat originality as an automatic proxy for reliability in every field.

### Practical rule

Use originality as one dimension of evaluation, never as the entire evaluation.

## Informant Analysis

Understanding who supplied the information is often decisive.

### Stronger informational positions

Informants are often stronger when they:

- directly participated in the event
- had personal knowledge close in time to the event
- had a reason to know the relevant fact with precision

### Weaker informational positions

Informants are often weaker when they:

- report events long after they occurred
- rely on family recollection or inherited narrative
- report details outside their likely firsthand knowledge
- have unclear or undocumented relationships to the person concerned

### Mixed informational records

Some records combine stronger and weaker informational fields. A single document may contain one detail reported by a direct witness and another reported from memory or assumption. The researcher must be prepared to evaluate fields unevenly within the same document.

## Administrative and Social Context

The creation environment of the source matters because it shapes both what gets recorded and what gets ignored.

### Administrative incentives

If a record was created for taxation, movement control, parish oversight, inheritance, military service, or civil registration, the administrative purpose may strengthen some fields while leaving others secondary. A source created to monitor residence may be especially useful for movement patterns even if it says little about extended family structure.

### Social naming practice

Names in records may reflect local convention, clerk preference, status marking, occupational identity, military naming, farm association, or later standardization. These are not merely linguistic curiosities. They affect whether a recorded identity signal should be treated as stable, weak, ambiguous, or transformable.

### Historical record culture

The researcher should remain aware that recordkeeping practices differ over time and place. Gaps, abbreviations, categories, and naming treatments that are normal in one context may be surprising in another. Source evaluation must therefore remain historically situated.

## Distortion Risks

No source is used in a neutral environment. The researcher should actively consider common distortion pathways.

### Transcription distortion

A transcription may modernize spelling, misread handwriting, expand abbreviations incorrectly, or silently omit uncertain text. If the transcription source is not transparent, its evidentiary use should be constrained accordingly.

### Indexing distortion

Indexes are invaluable access tools but should not be mistaken for full evidentiary representations. They are especially vulnerable to name normalization, date miskeying, incomplete fields, and category loss.

### Translation distortion

Translation can affect kinship terms, statuses, occupations, place descriptors, and administrative labels. A translated term may be directionally useful while still losing nuance relevant to later reasoning.

### Editorial harmonization

Compiled works and modern summaries may smooth contradictions, standardize identities, or silently choose among alternatives. Such harmonization can make a source easier to read while simultaneously making it less methodologically transparent.

## Practical Evaluation Questions

Before treating a source as meaningful evidence, the researcher should be able to answer most of the following questions:

- What kind of source is this?
- Is it original, derivative, compiled, or mixed?
- How close is it to the event in time?
- Who likely supplied the information?
- Which fields are likely to be strongest in this recording context?
- Which fields may be weak, inherited, normalized, or secondhand?
- Is the source complete enough for the claim being considered?
- Are there legibility, indexing, translation, or transmission risks?
- What kinds of conclusions would be methodologically unsafe to draw from this source alone?

If these questions cannot be addressed, the source has not been adequately characterized.

## Evaluation Outcomes

Source evaluation should produce a structured descriptive outcome rather than a vague global judgment.

A useful source evaluation outcome typically identifies:

- the source category
- the transmission status
- likely strong informational fields
- likely weak informational fields
- distortion risks
- scope limits on responsible use

The outcome should help downstream reasoning systems understand not only whether a source appears useful, but why, for what, and under what cautions.

## Common Evaluation Errors

The following errors are common and should be explicitly avoided.

### Treating one strong field as proof of all fields

A source that is strong for one detail is not automatically strong for all details. This is one of the most common genealogical errors in both manual and AI-assisted work.

### Treating official appearance as methodological authority

Administrative or ecclesiastical formality can create a false sense of certainty. A formally created record may still contain weak inherited information.

### Treating indexes as substitutes for source analysis

Indexes should guide access, not replace evaluation. An index entry is rarely a sufficient evidentiary unit by itself.

### Ignoring how the information entered the record

If the researcher cannot explain how the information likely entered the document, source evaluation remains incomplete.

## Relationship to Confidence and Conflict

Source evaluation feeds into later modules, but it should not collapse into them.

### Relationship to confidence

The confidence model uses source characterization as one of several inputs. A strong source can still yield low confidence if the broader evidence pattern is contradictory or sparse.

### Relationship to conflict

Conflict resolution uses source evaluation to compare competing records more intelligently. When two records disagree, the point is not merely to prefer the one that "looks better," but to understand the different informational paths that produced the disagreement.

## Implications for AI Agents

AI systems are especially prone to using sources as containers of facts rather than as historically situated evidentiary objects. This document exists partly to correct that tendency.

A framework-compliant agent must not:

- flatten all source types into generic evidence units
- treat any extracted field as equally reliable by default
- skip source characterization because later synthesis seems easier
- use a derivative summary as though it were transparent access to the original
- confuse easy retrieval with evidentiary strength

Instead, the agent should preserve explicit source-level caution so that later reasoning remains interpretable and correctable.

## TODO Checklist

- [ ] Add source evaluation examples for common Swedish parish, household, migration, probate, and derivative research materials.
- [ ] Add a field-level evaluation matrix that maps common source classes to stronger and weaker informational categories.
- [ ] Add machine-readable metadata candidates for source characterization.
- [ ] Add dedicated treatment of indirect evidence chains and how source quality propagates through them.

## Future Improvements

The most important next step for this document is to add worked examples. Source evaluation becomes significantly easier to apply when researchers can compare parallel cases such as a household record versus a later death record, or an index entry versus a manuscript image. Those examples should be added carefully and tied to real evaluative distinctions rather than generic teaching scenarios.

Another important future improvement is schema alignment. The framework will benefit from a structured source characterization format that mirrors the distinctions in this document without oversimplifying them into a single scalar value. When that work is done well, it will strengthen every downstream reasoning and workflow module.

## References

- [`/STYLE_GUIDE.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/STYLE_GUIDE.md)
- [`/knowledge/research-principles.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/research-principles.md)
- [`/knowledge/record-types.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/record-types.md)
- [`/knowledge/evidence-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/evidence-model.md)
- [`/specs/confidence-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/confidence-model.md)
- [`/specs/conflict-resolution.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/conflict-resolution.md)
- [`/workflows/document-analysis.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/document-analysis.md)
