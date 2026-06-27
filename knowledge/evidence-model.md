---
title: Evidence Model
purpose: Define the conceptual structure of evidence within the framework, including how sources, observations, support edges, and conflict edges combine to form a traceable evidentiary basis for genealogical claims.
scope: Evidence units, observation extraction, support and conflict structure, evidence accumulation, direct and indirect evidence, provenance requirements, and the relationship between evidence and confidence.
audience:
  - Reasoning designers
  - Workflow designers
  - AI systems designers
  - Reviewers
  - Genealogists
dependencies:
  - /knowledge/research-principles.md
  - /knowledge/source-evaluation.md
related_documents:
  - /specs/claim-model.md
  - /specs/confidence-model.md
  - /specs/conflict-resolution.md
  - /workflows/research-workflow.md
  - /workflows/research-memory.md
  - /templates/conflict-report.md
status: canonical
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.2.0
    date: 2026-06-27
    summary: Expanded into a canonical conceptual model for evidence structure and accumulation.
  - version: 0.1.0
    date: 2026-06-27
    summary: Initial repository bootstrap version.
---

# Evidence Model

## Purpose

This document defines the conceptual structure of evidence within the Genealogy AI Framework. It describes what evidence is, how it is organized, how it connects sources to claims, and how it accumulates across a research investigation.

The evidence model occupies the middle layer of the framework's reasoning architecture. Source evaluation, defined in [`/knowledge/source-evaluation.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/source-evaluation.md), characterizes the evidentiary objects from which observations are drawn. Claim reasoning, defined in [`/specs/claim-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/claim-model.md), describes how conclusions are formed, supported, and revised. The evidence model defines the connective layer between those two: the structured set of relationships that allows a claim to be traced back to its observational basis and its observational basis to be traced back to its sources.

Without this middle layer, genealogical reasoning becomes opaque. Conclusions may appear plausible without being auditable, and the distinction between strong support and compatible speculation becomes invisible.

## Scope

This document covers the conceptual components of evidence: what constitutes an evidence unit, how observations are extracted and characterized, how support and conflict relationships are represented, how direct and indirect evidence differ, and how evidence accumulates into a structured basis for claim assessment. It also covers provenance requirements and the relationship between evidence quality and confidence.

This document does not define source evaluation criteria, which belong to [`/knowledge/source-evaluation.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/source-evaluation.md). It does not define claim types or the claim lifecycle, which belong to [`/specs/claim-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/claim-model.md). It does not define conflict resolution procedures, which belong to [`/specs/conflict-resolution.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/conflict-resolution.md). Each of those documents depends on the model defined here.

## Audience

- Reasoning designers specifying how agents structure and evaluate evidence
- Workflow designers integrating evidence handling into research stages
- AI systems designers implementing evidence-aware research agents
- Reviewers assessing whether conclusions rest on properly structured evidence
- Genealogists understanding how the framework represents evidentiary relationships

## Dependencies

This document depends on the methodological principles in [`/knowledge/research-principles.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/research-principles.md) and the source characterization framework in [`/knowledge/source-evaluation.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/source-evaluation.md).

## Related Documents

- Claim model: [`/specs/claim-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/claim-model.md)
- Confidence model: [`/specs/confidence-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/confidence-model.md)
- Conflict resolution: [`/specs/conflict-resolution.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/conflict-resolution.md)
- Research workflow: [`/workflows/research-workflow.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/research-workflow.md)
- Research memory: [`/workflows/research-memory.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/research-memory.md)
- Conflict report template: [`/templates/conflict-report.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/templates/conflict-report.md)

## Why a Formal Evidence Model Is Necessary

Genealogical research produces many conclusions. Without a formal model of how evidence relates to those conclusions, the research process cannot be audited, replicated, corrected, or extended with confidence.

A formal evidence model makes the following possible:

- a reviewer can trace any conclusion back through the reasoning chain to the observations and sources that produced it
- an agent resuming a research session can understand what has been established, what remains open, and what was considered but set aside
- conflicts between records can be represented explicitly rather than absorbed silently into narrative
- confidence assessments can be grounded in identified evidence rather than in general impressions

Without a structured model, conclusions tend to harden into facts without a visible evidentiary basis. Research memory degrades. Errors propagate without detection. The evidence model exists to prevent that outcome.

## The Primary Concepts

The framework defines five primary concepts in its evidence model. These concepts are defined here for the first time and used consistently throughout all other documents.

### Source

A source is the artifact from which observations are derived. Sources may include original records, derivative compilations, indexes, transcriptions, photographs, official certificates, family histories, correspondence, or any other documentary object that a researcher examines for genealogical information.

A source is not itself a unit of evidence. It is the evidentiary object from which evidence is drawn. The same source may contribute strong evidence for one claim and weak or irrelevant evidence for another, depending on what information it contains, what recording context produced it, and how close it is to the relevant events.

Source characterization — evaluating the type, proximity, informant quality, and transmission status of a source — is defined fully in [`/knowledge/source-evaluation.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/source-evaluation.md). The evidence model depends on that characterization but does not reproduce it.

### Observation

An observation is a discrete detail extracted from a source. It is the primary unit of information that enters the reasoning process from the documentary record. Observations may include names, dates, places, occupational designations, status categories, ages, relationship labels, household configurations, physical descriptions, or any other recorded detail that bears on a research question.

Several properties define a well-formed observation within this framework:

**Source binding.** Every observation must be bound to a specific source. An observation without a source attribution is not a framework-compliant observation. The binding must be specific enough that the observation can later be re-examined in its original context.

**Extraction precision.** An observation records what the source says, not what the researcher infers from what the source says. The distinction between observation and inference is fundamental. An observation from a baptism record may be that a name appears in the godparent column. The inference that this person had a close relationship with the family is a separate step, not part of the observation itself.

**Scope limitation.** Each observation should be scoped to a specific detail rather than bundling multiple details into one unit. A bundled observation obscures which elements carry strong evidence and which carry weak evidence from the same source.

**Uncertainty marking.** When an observation is uncertain due to illegibility, indexing distortion, or translation ambiguity, that uncertainty must be marked at the observation level rather than silently resolved or silently carried forward as though it were certain.

### Support Edge

A support edge is the explicit link between one or more observations and a claim. It represents the reasoning relationship: these observations, drawn from these sources, provide evidence for this claim in the following way.

A support edge has direction. It connects observation to claim, and that direction matters. A claim is upstream of the reasoning process; observations are downstream from sources. The support edge is the structure that joins them.

Support edges vary in character depending on how the observations relate to the claim:

- a direct support edge connects an observation that closely matches the claim to the claim itself
- an indirect support edge connects an observation that contributes to the claim through correlated reasoning rather than direct statement
- a negative support edge connects an observation of absence to a claim, where the absence is methodologically interpretable

Not every observation that is compatible with a claim constitutes a support edge. Compatibility is not the same as support. A support edge must reflect an identified reasoning relationship, not merely a failure to contradict.

### Conflict Edge

A conflict edge is an explicit link between two observations, or between an observation and a claim, that records a contradiction requiring attention. Conflict edges are first-class elements of the evidence model. They are not error states to be eliminated but structural features to be managed.

A conflict edge exists when:

- two observations from separate sources disagree on a detail relevant to the same claim
- an observation conflicts with an established claim it should be compatible with
- the combination of observations logically precludes a claim that would otherwise seem supported

Conflict edges carry information about the nature and severity of the conflict. They are the primary input to the conflict resolution process defined in [`/specs/conflict-resolution.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/conflict-resolution.md).

A conflict edge must not be removed by choosing one side of the contradiction without explanation. Resolution of a conflict edge requires an explicit resolution record that states which observations were preferred, why, and what the alternative now represents.

### Provenance

Provenance is the full traceable path from a claim back through its support edges, observations, and sources to the documentary record. A claim has adequate provenance when this path can be reconstructed without gaps or hidden steps.

Provenance is not simply a citation. It includes:

- the source or sources from which each relevant observation was extracted
- the source characterization applied to those sources
- the reasoning that connects observations to claims via support edges
- any conflict edges that were present and how they were handled
- the confidence assessment and its basis

Provenance is required at every stage of the research workflow where claims are formed or revised. A claim that cannot be reconstructed through its provenance cannot be reliably audited, extended, or corrected.

## Direct, Indirect, and Negative Evidence

The framework distinguishes three modes in which observations may support claims. These modes are not mutually exclusive, but they differ in their reasoning requirements and their confidence implications.

### Direct evidence

Direct evidence exists when an observation closely and explicitly supports a claim without requiring correlated reasoning across multiple sources or inferences about what is not stated.

A baptism record naming a child, their parents, and the date of baptism provides direct evidence for an event claim about that baptism. A household record explicitly labeling two individuals as parent and child provides direct evidence for a relationship claim.

Direct evidence does not eliminate the need for source evaluation. A directly stated claim may still be weak if the source is derivative, the informant was not positioned to know the fact reliably, or the recording context introduces systematic distortion. But direct evidence reduces the inferential distance between observation and conclusion, which generally supports higher confidence.

### Indirect evidence

Indirect evidence exists when a claim emerges through the combination of observations that each contribute partial support, and where the claim itself is not explicitly stated in any single source.

A person's residence in a parish may be inferred from their consistent appearance as witness in that parish's records over several years, even though no document directly states their residence. A parentage relationship may be inferred from naming patterns, geographic proximity, and generational fit, even in the absence of a direct statement of the relationship.

Indirect evidence requires more explicit reasoning to be auditable. Each observation's contribution to the claim must be identified, and the reasoning chain that connects them must be traceable. Indirect evidence is legitimate and often the only evidence available, but it should not be presented as though it were direct.

The confidence implications of indirect evidence depend on how many observations contribute, how independent they are, and how specifically they implicate the claimed conclusion rather than a range of compatible alternatives.

### Negative evidence

Negative evidence exists when the absence of an expected observation in a source that should contain it constitutes a meaningful evidential contribution.

The absence of a person in a tax record, a military muster roll, or a household enumeration may support a hypothesis about when they died, moved, or changed status — but only when the record context justifies expecting their presence if they were alive, resident, or in the relevant status category.

Negative evidence is methodologically fragile because it depends on strong assumptions about completeness, coverage, and indexing. The framework requires that negative evidence be explicitly marked as such, that the assumptions justifying it be stated, and that alternative explanations for absence be considered before negative evidence is used to support a claim.

## Evidence Accumulation

Evidence accumulates as a research investigation progresses. The evidence model must represent not only the current evidence state but also how that state was reached.

### Accumulation as structure, not volume

Evidence accumulation is not simply the collection of more documents. It is the progressive construction of a structured network of sources, observations, support edges, and conflict edges that together characterize what is known, what is contested, and what remains open.

More documents do not automatically strengthen a claim. Documents that share a common transmission origin are not independent, so accumulating copies of derivative sources does not improve the evidentiary basis. New observations that are compatible with a claim but do not differentiate between it and its alternatives do not raise confidence. Accumulation improves evidentiary quality only when it adds genuine independent coverage of the relevant dimensions.

### The evidence network

The full set of sources, observations, support edges, and conflict edges for a given research problem forms an evidence network. This network is the structured evidentiary basis for all claims, confidence assessments, and conflict records in the research problem.

The evidence network has useful properties. It makes clear which claims rest on a rich observational base and which rest on a single weak observation. It makes explicit where conflict edges exist and how they are distributed across the support structure. It allows the research state to be summarized without losing the reasoning that produced it.

The evidence network is not a static artifact. It grows and changes as research progresses, as new sources are consulted, as observations are revised, and as conflicts are resolved or reframed.

### Independence and corroboration

The evidentiary value of accumulation depends critically on whether the contributing observations are genuinely independent. Two observations are independent when they derive from sources that do not share a common transmission path.

An original parish record and a transcription of that record are not independent. A household record and an index entry derived from that household record are not independent. An emigration record and a church emigration register based on the same underlying reporting are not independent.

Independence matters because corroboration between genuinely independent observations constitutes meaningful evidentiary reinforcement. Agreement between dependent sources may reflect nothing more than shared copying. The evidence model must preserve source provenance precisely enough to allow independence to be assessed.

## Evidence and Confidence

The evidence model feeds directly into confidence assessment, but the relationship is not mechanical. Evidence quality shapes confidence; it does not determine it automatically.

The confidence model, defined in [`/specs/confidence-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/confidence-model.md), defines five assessment dimensions: source quality, evidence consistency, identity fit, temporal and geographic plausibility, and residual unresolved conflict. Each of these dimensions draws on the evidence structure defined in this document.

Source quality is assessed through source evaluation applied to the sources from which observations were drawn. Evidence consistency is assessed by comparing observations across the support structure. Identity fit is assessed by examining whether the observations differentiate the subject from plausible alternatives. Residual unresolved conflict is assessed by examining whether any active conflict edges remain unresolved.

The important principle is that confidence cannot outrun its evidentiary basis. A claim whose support structure is thin, whose sources are derivative, whose independence is doubtful, or whose conflict edges are unresolved cannot carry established or probable confidence regardless of how plausible the conclusion appears.

## Evidence and Claims

The relationship between evidence and claims is defined in [`/specs/claim-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/claim-model.md). The evidence model and the claim model are complementary: the evidence model defines how support is structured; the claim model defines what is being supported and how conclusions are formed, revised, and preserved.

Two aspects of that relationship are worth noting here because they bear on how the evidence model is used in practice.

### Claims do not inherit source quality globally

A claim is not simply as strong as its best source. Each observation contributes to specific aspects of the claim. A source that is strong for recording the date of an event may be weak for reporting the birthplace of the subject. The support structure must preserve this field-level differentiation rather than assigning a single quality rating to the source as a whole.

This is consistent with the field-specific evaluation principle in source evaluation: source quality is assessed at the level of information type, not at the level of the document as a whole.

### Support edges require explicit reasoning

A support edge is not simply the co-occurrence of an observation and a claim. It requires an identifiable reasoning relationship that explains why and how the observation bears on the claim. An observation that is merely compatible with a claim does not constitute a support edge. The researcher or agent must be able to state the reasoning that connects them.

This requirement applies with particular force to indirect support edges, where the reasoning chain is longer and more susceptible to hidden inference steps.

## Evidence in Research Memory

The evidence structure produced during a research investigation must be preserved for future use. Research memory, defined in [`/workflows/research-memory.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/research-memory.md), depends on the evidence model to preserve not only conclusions but the support structure that produced them.

A research session that produces claims without preserving their evidence structure creates fragile memory. Future researchers or agents resuming the investigation will be unable to distinguish supported conclusions from inherited assumptions, and will be unable to revise conclusions intelligently when new evidence arrives.

The minimum evidence preservation requirements for any completed research stage are:

- the sources consulted and their characterizations
- the observations extracted and their source bindings
- the support edges connecting observations to active claims
- any conflict edges identified, including their current resolution status
- the confidence assessments applied to active claims and their stated basis

These requirements ensure that research continuity is maintained across sessions and that the evidentiary basis of conclusions remains auditable over time.

## Implications for AI Agents

Evidence modeling is the area where AI systems most consistently fail in genealogical work. The following failures are common and must be actively designed against.

### Treating extraction as conclusion

An AI agent that extracts details from a source may treat those extracted details as established conclusions rather than as observations requiring further evaluation and comparison. This collapses the distinction between observation and claim, eliminates the support edge as a reasoning artifact, and produces outputs that cannot be audited.

### Treating co-occurrence as support

Two observations that appear together in the same record, or in records about the same apparent person, are not automatically in a support relationship. The reasoning that connects them to a claim must be stated. An agent that generates support edges implicitly, without stated reasoning, produces an evidence structure that looks complete but cannot be evaluated.

### Ignoring the conflict edge

An AI agent presented with contradictory observations will often resolve the contradiction by selecting the more plausible alternative without recording the conflict or the reasoning behind the selection. This is a significant failure. The unrecorded conflict may contain information essential for later research stages, and the unrecorded reasoning cannot be reviewed or corrected.

### Treating derivative corroboration as independent

An agent that counts multiple sources as independent when they share a transmission origin will overestimate the strength of corroboration. This inflates confidence. The agent must be capable of tracking source provenance through transmission chains, not just counting citations.

### Failing to preserve provenance

An agent that produces conclusions without preserving their evidentiary basis creates research outputs that cannot be extended or corrected. Every claim output must be accompanied by enough provenance information that a future reviewer can assess the basis without reconstructing the original reasoning from scratch.

## Practical Evidence Tests

Before treating an evidence structure as adequate for claim formation, the researcher or agent should be able to answer the following:

- What sources were consulted, and have they been characterized using the source evaluation framework?
- What observations were extracted, and are they bound to their sources with sufficient specificity?
- Are the support edges between observations and claims explicit, or have they been left implicit?
- Are observations genuinely independent, or do they share a common transmission origin?
- Are all conflict edges identified and recorded, even those not yet resolved?
- Is the provenance of each active claim traceable without gaps?
- Is the evidence structure preserved in a form that supports future research continuation?

If these questions cannot be answered, the evidence structure is incomplete.

## TODO Checklist

- [ ] Add guidance on minimum observation specificity requirements by claim type.
- [ ] Add a section on evidence handling in cluster research, where the subject of observations may be individuals related to but distinct from the primary research subject.
- [ ] Add worked examples of direct, indirect, and negative evidence chains drawn from Swedish record contexts.
- [ ] Add guidance on how to handle partially legible or uncertain observations without suppressing their contribution.

## Future Improvements

The most important future improvement for this document is the addition of worked examples. The conceptual structure defined here becomes practically applicable when illustrated through real or realistic evidence chains. Those examples should demonstrate both clean corroboration cases and messy conflict cases, because the model's value lies equally in both situations.

A second important improvement is closer integration with the research memory workflow. The evidence model defines what must be preserved; the research memory workflow defines how. A formal alignment between the two, specifying the minimum evidence record that constitutes adequate memory for a completed research stage, would strengthen both documents.

## References

- [`/knowledge/research-principles.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/research-principles.md)
- [`/knowledge/source-evaluation.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/source-evaluation.md)
- [`/specs/claim-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/claim-model.md)
- [`/specs/confidence-model.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/confidence-model.md)
- [`/specs/conflict-resolution.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/conflict-resolution.md)
- [`/workflows/research-workflow.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/research-workflow.md)
- [`/workflows/research-memory.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/research-memory.md)
- [`/templates/conflict-report.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/templates/conflict-report.md)
