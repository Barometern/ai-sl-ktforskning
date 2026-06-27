---
title: Confidence Model
purpose: Define how the framework represents, reasons about, and communicates confidence in genealogical claims without obscuring uncertainty or overstating evidentiary support.
scope: Confidence vocabulary, reasoning dimensions, propagation logic, output expectations, and the relationship between source quality and claim-level confidence.
audience:
  - Reasoning designers
  - AI systems designers
  - Workflow authors
  - Reviewers
  - Genealogists
dependencies:
  - /knowledge/research-principles.md
  - /knowledge/source-evaluation.md
  - /knowledge/evidence-model.md
related_documents:
  - /specs/conflict-resolution.md
  - /specs/agent-contracts.md
  - /templates/person-summary.md
  - /templates/research-report.md
status: canonical
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.2.0
    date: 2026-06-27
    summary: Expanded into a canonical specification for the framework confidence model.
  - version: 0.1.0
    date: 2026-06-27
    summary: Initial repository bootstrap version.
---

# Confidence Model

## Purpose

This document defines how confidence in genealogical claims is understood, assessed, communicated, and preserved within the Genealogy AI Framework. Its role is to make confidence language meaningful rather than decorative: a confidence statement should convey something specific about the evidentiary situation rather than projecting generic certainty.

Confidence is a reasoned assessment of how well available evidence supports a claim. It is not a model certainty score, a frequency estimate, or a statement about the probability of any abstract proposition. In genealogy, confidence is grounded in identifiable sources, named observations, and explicit reasoning. If confidence cannot be explained in those terms, it has not been properly established.

## Scope

This document covers the conceptual framework for confidence in claim-level genealogical reasoning. It defines the dimensions that determine confidence, the vocabulary used to express it, the rules governing how confidence is derived from source evaluation and evidence comparison, and the obligations that confidence carries in output and memory.

This document does not define machine-readable scoring algorithms, statistical confidence intervals, or numeric ranking functions. Those are implementation concerns that may be defined later. This document defines the conceptual layer that any such implementation must respect.

## Audience

- Reasoning designers specifying how agents assess evidentiary support
- AI systems designers building framework-compliant research agents
- Workflow authors incorporating confidence checkpoints into research stages
- Reviewers assessing whether conclusions are proportionate to evidence
- Genealogists evaluating whether framework outputs are methodologically sound

## Dependencies

This document depends on the methodological groundwork in [`/knowledge/research-principles.md`](../knowledge/research-principles.md), the source characterization framework in [`/knowledge/source-evaluation.md`](../knowledge/source-evaluation.md), and the evidence structure defined in [`/knowledge/evidence-model.md`](../knowledge/evidence-model.md).

## Related Documents

- Conflict resolution: [`/specs/conflict-resolution.md`](conflict-resolution.md)
- Agent contracts: [`/specs/agent-contracts.md`](agent-contracts.md)
- Person summary template: [`/templates/person-summary.md`](../templates/person-summary.md)
- Research report template: [`/templates/research-report.md`](../templates/research-report.md)

## Why a Confidence Model Is Necessary

Genealogical research produces conclusions of radically different evidentiary quality. A claim supported by two independent contemporary records naming the same individual in a consistent way is not in the same epistemic category as a claim inferred from a single undated summary compiled a century later. Without a structured confidence model, both claims may appear in an output with similar language and similar authority.

The consequence of unstructured confidence is that readers, downstream agents, and subsequent researchers cannot distinguish strong conclusions from speculative ones. This causes research memory to corrupt over time: weak inferences harden into assumed facts, and the methodology that produced them becomes invisible.

A confidence model makes the evidentiary quality of conclusions explicit, preservable, and revisable.

## What Confidence Is Not

Before defining what confidence is in this framework, it is important to state clearly what it is not.

### Confidence is not model certainty

An AI language model may assign high internal probability to a genealogical answer because the answer matches common patterns in training data. That is not genealogical confidence. Pattern recognition over historical naming conventions is not equivalent to evidentiary support for a specific claim about a specific individual.

### Confidence is not volume of evidence

Collecting many sources does not automatically increase confidence. Volume without comparison produces accumulation, not understanding. Confidence depends on the quality of evidence, its consistency, and its explanatory power relative to alternative hypotheses.

### Confidence is not source appearance

A formally created, officially preserved, digitally indexed document does not automatically carry high confidence. The administrative appearance of a source is not a substitute for understanding how the information it contains entered the record, how reliable the informant was, and how many transmission steps separate the record from the event.

### Confidence is not resolution of ambiguity by elimination

If three candidate persons are considered and two are ruled out, the remaining candidate does not automatically become a high-confidence match. What remains must still be affirmatively supported. Elimination reduces alternatives; it does not substitute for positive evidence.

## The Confidence Dimensions

Framework-compliant confidence assessment must evaluate the following dimensions explicitly. These dimensions are complementary. They should not be collapsed into a single judgment without preserving the reasoning behind each.

### Source quality

The first dimension concerns the evidentiary weight of the sources supporting a claim. This is not a property of a single source in isolation. It concerns how the relevant sources characterize the claim as a group: whether they are original or derivative, how close they are to the event, who supplied the information, and what recording context shaped their content.

Source quality is evaluated through the framework defined in [`/knowledge/source-evaluation.md`](../knowledge/source-evaluation.md). A high source quality rating for a claim requires at least one source that is close to the event, uses an informant with likely firsthand knowledge, and is not primarily a derivative or compiled summary.

A claim supported only by derivative or compiled sources should not be assigned high confidence regardless of other factors.

### Evidence consistency

The second dimension concerns whether the observations extracted from the supporting sources agree with one another in the details relevant to the claim.

High consistency means that multiple independent sources, examined separately, produce compatible observations across the key identifying dimensions: name forms, dates, places, relationships, and life-course sequence. Consistency strengthens a claim because it reduces the probability that the alignment is accidental.

Low consistency does not automatically disqualify a claim. But any inconsistency must be accounted for before confidence can be raised. Unexamined inconsistency is not the same as resolved inconsistency.

Independence is important here. Sources that derive from a single underlying record, even if they look like multiple documents, do not produce genuine corroboration. The confidence model must therefore ask whether sources are independently informative or whether they share a common origin.

### Identity fit

The third dimension concerns how specifically the available evidence maps to the particular individual rather than to a class of plausible individuals with similar characteristics.

A claim has good identity fit when the evidence that supports it is sufficient to differentiate the subject from other plausible candidates who might otherwise match. Genealogical research frequently encounters environments with common names, overlapping life-course patterns, and limited discriminating detail. In those environments, identity fit becomes the central constraint on confidence.

Poor identity fit means that the same evidence could reasonably describe more than one individual. In such cases, confidence cannot be high, even if the sources are of good quality and mutually consistent.

The researcher must therefore ask not only whether the evidence is consistent with the claimed individual, but whether it provides enough differentiation to rule out competing identities.

### Temporal and geographic plausibility

The fourth dimension concerns whether the claim is coherent with respect to the timeline of life events and the geographic context in which the person is documented.

Genealogical claims often involve movement, succession, and sequence. A claimed identity may be internally consistent across documents while still being implausible because it requires a person to appear in two distant locations simultaneously, age in a biologically implausible direction, or follow a migration path inconsistent with known historical patterns.

Temporal and geographic plausibility is an interpretive check rather than a primary source of support. It can lower confidence when implausibility is detected, but it cannot raise confidence independently. Plausibility is not evidence; it is a constraint on what evidence can responsibly support.

### Residual unresolved conflict

The fifth dimension concerns whether active contradictions remain in the evidence set at the time of assessment.

Even when the first four dimensions are generally favorable, unresolved conflict in the evidence must be treated as a confidence constraint. An unresolved contradiction involving key identifying details, such as a birthplace recorded differently in two roughly contemporary sources of similar quality, cannot simply be set aside. It must be either resolved, explained, or preserved as an acknowledged limit on the current conclusion.

Residual unresolved conflict is not always fatal to a bounded conclusion. A low-severity conflict on a peripheral detail may coexist with a well-supported core claim. But the conflict must remain visible, and its severity and relevance to the claim must be assessed explicitly.

## The Confidence Vocabulary

The framework uses a defined vocabulary for expressing claim confidence. This vocabulary is structured to convey the evidentiary situation rather than a vague impression of certainty.

### Established

A claim is `established` when it is supported by evidence that is:

- drawn from at least one source close to the event with strong informant proximity
- consistent across independent evidence points relevant to the claim
- specific enough to differentiate the subject from likely alternatives
- free from unresolved material conflict

Established does not mean immune to future revision. All genealogical conclusions are subject to revision if new evidence requires it. Established means that the current evidence base is sufficient to treat the claim as a foundation for subsequent reasoning under normal research conditions.

### Probable

A claim is `probable` when it is supported by evidence that is coherent and directionally consistent but falls short of established status because:

- supporting sources are partially derivative or of mixed informant quality
- identity differentiation is good but not complete
- minor inconsistencies remain that have not been fully resolved
- temporal or geographic plausibility is good but rests partly on contextual inference rather than direct record support

A probable claim may function as a reasonable working conclusion for continuing research. It should not be reported as established, and downstream work depending on it should acknowledge the status.

### Possible

A claim is `possible` when it is consistent with the available evidence but the evidence is insufficient to distinguish it clearly from alternative explanations. This status applies when:

- only weak, derivative, or sparse sources are available
- identity fit is low because the evidence does not adequately differentiate the subject
- multiple candidates remain viable under the same evidence
- significant temporal, geographic, or informant plausibility concerns exist

A possible claim is a lead or hypothesis rather than a conclusion. It may guide further research. It should not be reported as a finding or treated as a foundation for subsequent claims.

### Unresolved

A claim is `unresolved` when the evidence is insufficient to assess it reliably in either direction, or when active conflicts prevent any honest confidence assignment.

Unresolved is a research state, not an evasion. An honest record of unresolved status is more valuable than a forced probable or possible assignment. Unresolved claims define the boundary of responsible knowledge and are essential inputs to research planning.

### Contradicted

A claim is `contradicted` when the weight of evidence runs against it. This applies when:

- better-sourced or more proximate evidence supports an alternative claim
- the claim depends on sources that have been identified as weak, derivative, or unreliable for the relevant field
- the claim requires evidence that is absent despite a record context where it would be expected to appear

A contradicted claim should not simply be dropped. It should be recorded with its source basis, its contradicting evidence, and the reasoning that produced the contradiction assessment. That record has future research value.

## Confidence Propagation

Confidence is attached to claims, not to sources. A strong source can support a weak claim if the claim goes beyond what the source can responsibly justify. A weaker source can contribute to a stronger claim if corroborated by independent evidence.

The following rules govern how confidence propagates through the evidence structure.

### Source quality sets a ceiling

The quality of the supporting sources constrains the maximum confidence attainable for a claim regardless of other dimensions. A claim supported only by derivative summaries without access to the underlying originals cannot be established no matter how consistent or plausible it appears.

### Corroboration raises the floor

When independent sources agree on the same claim-relevant details, confidence can be raised above what any single source could justify. But corroboration requires genuine independence: sources that share a common transmission path are not independent in the relevant sense.

### Unresolved conflict lowers the ceiling

Active unresolved conflict on a material detail constrains confidence downward even when source quality is otherwise high. The conflict must be explicitly handled before confidence can be elevated past possible.

### Identity fit can veto established status

Even when source quality and consistency are high, poor identity differentiation prevents established status. A strong consistent body of evidence that could equally describe multiple individuals supports only a probable or possible conclusion until the identity is adequately differentiated.

## Confidence in Outputs

Confidence language must be used accurately and consistently in all framework outputs. This includes research reports, person summaries, conflict records, and research memory artifacts.

### Requirements for every stated claim

Every claim that appears in a framework output should carry:

- an explicit confidence level from the vocabulary above
- a brief basis for that level referencing the relevant sources and dimensions
- an acknowledgment of any active limits such as residual conflict or identity fit concerns

A claim without a confidence level is incomplete. A confidence level without a basis is not genealogically meaningful.

### Prohibition on implicit confidence inflation

Confidence must not be inflated by presentation. A probable claim that appears in a narrative alongside established claims acquires unearned authority. Framework-compliant outputs must distinguish confidence levels clearly, either through explicit labeling or through consistent prose conventions that signal the distinction.

### Preservation for future review

Confidence assessments must be preserved in research memory in a form that allows future researchers or agents to understand the reasoning that produced them. A confidence level is not durable if its basis is lost. The preserved record must include the sources, observations, and reasoning dimensions that produced the assessment.

## Revising Confidence

Confidence is not a permanent property of a claim. It is an assessment of the current evidentiary state. New sources, reinterpretation of existing sources, resolution of conflicts, or discovery of additional differentiating evidence may all warrant revision.

Revision should always be explicit. The revised confidence should be stated, the reason for revision should be noted, and the prior assessment should be preserved with its basis intact. Confidence revision without explanation produces opaque research history.

Confidence should never be revised downward silently. A claim that was assessed as probable and later found to be contradicted by new evidence must have its status updated with an explanation of why the revision occurred.

## Confidence and Conflict Resolution

Confidence and conflict resolution are related but distinct. Unresolved conflict constrains confidence; it does not replace the need to assess the other dimensions independently.

The conflict resolution specification at [`/specs/conflict-resolution.md`](conflict-resolution.md) defines how conflicts are classified and managed. The confidence model depends on that classification to apply the residual conflict dimension accurately. A conflict that has been formally resolved under the conflict resolution specification should no longer count as residual against a confidence assessment, even if the underlying disagreement in the sources remains visible.

## Implications for AI Agents

AI systems face specific difficulties in genealogical confidence assessment that must be actively designed against.

### Overconfidence through fluency

A well-formed genealogical narrative tends to produce an implicit sense of authority. An AI agent that generates fluent prose describing a lineage may inadvertently suggest high confidence through stylistic smoothness rather than evidentiary support. Framework-compliant agents must separate prose quality from confidence level.

### Underspecified evidence basis

AI agents often reach conclusions without tracing the evidence pathway that produced them. A confidence statement that cannot be tied to specific sources, observations, and comparison decisions is not framework-compliant. The agent must be able to explain confidence in terms that a reviewer can examine.

### Compression of uncertainty

Language model outputs often compress uncertainty into singular confident answers because that is the pattern they have been trained toward. The confidence vocabulary exists to counteract that compression. An agent that defaults to probable when it should say possible, or to possible when it should say unresolved, is producing outputs that will mislead downstream research.

### Treating internal consistency as external support

A claim that is internally consistent with all retrieved sources may still have a weak evidence base if the sources are few, derivative, or low in informant proximity. An agent must not mistake the absence of contradiction for the presence of support.

## Practical Confidence Tests

Before assigning a confidence level to a claim, the researcher or agent should be able to answer the following questions:

- What sources support this claim, and what is their source quality characterization?
- Do the supporting sources provide independent evidence or do they share a transmission path?
- Is the evidence specific enough to differentiate this subject from plausible alternatives?
- Are all relevant details temporally and geographically coherent?
- Are there unresolved conflicts affecting a material element of this claim?
- Can the confidence level and its basis be preserved for future review?

If these questions cannot be answered, the confidence assessment is incomplete.

## TODO Checklist

- [ ] Add calibration examples mapping specific evidence scenarios to each confidence vocabulary term.
- [ ] Add guidance on how confidence should be expressed in the person summary template.
- [ ] Add confidence revision protocol for common scenarios such as new-source discovery and conflict resolution.
- [ ] Add cross-reference to evidence model once that document is expanded.

## Future Improvements

The most important future improvement is to develop calibration examples that show how the same vocabulary term applies across different evidence scenarios. The definitions in this document are designed to be stable and precise, but precision becomes easier to apply when paired with worked cases. Those cases should be developed in coordination with the evidence model and tied to real record situations drawn from the Swedish-first knowledge base.

A second important improvement is to formalize the relationship between confidence propagation and research memory. When a confidence-level revision occurs, the research memory system should have a clear protocol for updating assessments while preserving the prior record. That protocol is a natural extension of this specification and should be documented in a future revision.

## References

- [`/knowledge/research-principles.md`](../knowledge/research-principles.md)
- [`/knowledge/source-evaluation.md`](../knowledge/source-evaluation.md)
- [`/knowledge/evidence-model.md`](../knowledge/evidence-model.md)
- [`/specs/conflict-resolution.md`](conflict-resolution.md)
- [`/templates/person-summary.md`](../templates/person-summary.md)
- [`/templates/research-report.md`](../templates/research-report.md)
