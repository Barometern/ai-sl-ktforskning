---
title: Conflict Resolution Specification
purpose: Define how conflicting evidence and competing hypotheses should be identified, classified, managed, and resolved within the framework.
scope: Conflict classification, severity assessment, resolution paths, escalation conditions, the conflict record as a research artifact, and the relationship between conflict handling and confidence.
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
  - /specs/confidence-model.md
related_documents:
  - /specs/claim-model.md
  - /workflows/research-workflow.md
  - /workflows/brick-wall-workflow.md
  - /templates/conflict-report.md
  - /prompts/compare-sources.md
status: canonical
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.2.0
    date: 2026-06-27
    summary: Expanded into a canonical specification for conflict identification, classification, and resolution.
  - version: 0.1.0
    date: 2026-06-27
    summary: Initial repository bootstrap version.
---

# Conflict Resolution Specification

## Purpose

This document defines how the framework identifies, classifies, manages, and resolves conflicts in genealogical evidence. A conflict exists when two or more observations, claims, or sources cannot all be true simultaneously given the available interpretive context. Conflicts are not exceptional conditions to be minimized. They are a predictable feature of serious genealogical research, and their systematic handling is a mark of methodological maturity.

This specification defines the policy for that handling. It does not define the procedures for all research workflows generally, nor does it govern confidence scoring in detail. Those concerns belong to [`/workflows/research-workflow.md`](../workflows/research-workflow.md) and [`/specs/confidence-model.md`](confidence-model.md) respectively.

## Scope

This document covers conflict identification, the classification of conflict types, the assessment of conflict severity, the available resolution paths for each class, the conditions under which conflict should be escalated rather than resolved locally, and the requirements for conflict records as durable research artifacts.

This document does not define source evaluation criteria, claim formation procedures, or confidence vocabulary. Those are defined in the documents this specification depends on.

## Audience

- Reasoning designers specifying how agents should detect and handle contradictory evidence
- AI systems designers building conflict-aware research agents
- Workflow authors integrating conflict handling into research stages
- Reviewers assessing whether evidence conflicts have been addressed appropriately
- Genealogists evaluating whether framework outputs represent the evidence landscape honestly

## Dependencies

This document depends on the methodological principles in [`/knowledge/research-principles.md`](../knowledge/research-principles.md), the source characterization framework in [`/knowledge/source-evaluation.md`](../knowledge/source-evaluation.md), the evidence structure in [`/knowledge/evidence-model.md`](../knowledge/evidence-model.md), and the confidence vocabulary in [`/specs/confidence-model.md`](confidence-model.md).

## Related Documents

- Claim model: [`/specs/claim-model.md`](claim-model.md)
- Research workflow: [`/workflows/research-workflow.md`](../workflows/research-workflow.md)
- Brick wall workflow: [`/workflows/brick-wall-workflow.md`](../workflows/brick-wall-workflow.md)
- Conflict report template: [`/templates/conflict-report.md`](../templates/conflict-report.md)
- Compare sources prompt: [`/prompts/compare-sources.md`](../prompts/compare-sources.md)

## The Role of Conflict in Genealogical Research

Conflicts arise in genealogical research for many reasons. Records may disagree because informants had different knowledge. Ages may drift across records because reporting was imprecise or done from memory. Names may appear in incompatible forms because naming conventions changed, because clerks standardized idiosyncratically, or because two different individuals share similar profiles. Places may appear inconsistently because administrative boundaries shifted or because reporters described location at different scales.

The correct response to a conflict is not to select the more convenient record and ignore the other. The correct response is to identify the conflict explicitly, characterize its nature and severity, compare the sources that produce it, and determine whether the conflict can be resolved with available evidence or must be preserved as an acknowledged limit on the current conclusion.

This approach treats conflict as information. A well-characterized conflict often contains the very structure needed to understand what went wrong in an identity assumption, what records to seek next, or why two lineage branches have been incorrectly merged.

## Conflict Identification

A conflict exists within the framework when a conflict edge is present in the evidence structure. As defined in the evidence model, a conflict edge is an explicit link between two observations, or between an observation and a claim, that records a contradiction requiring attention.

Conflict identification is therefore not a separate process but a responsibility of the observation extraction and comparison stages of the research workflow. As observations are extracted from sources and compared across the evidence network, contradictions should be flagged as conflict edges rather than silently resolved or absorbed into narrative.

The following situations require a conflict edge to be recorded:

- two observations from separate sources report incompatible values for the same identity-relevant field
- an observation from a newly consulted source contradicts a claim that was previously treated as active
- the combined implication of multiple observations logically excludes a claim that would otherwise be supported
- an expected observation is absent in a source that should contain it, and that absence conflicts with a current working claim

Not every difference between records constitutes a material conflict. Naming variants, abbreviations, spelling variation, and minor date rounding may reflect normal recording practice rather than genuine contradiction. The researcher must distinguish variation that is expected given the source context from contradiction that requires active handling.

## Conflict Classification

The framework recognizes five classes of conflict. These classes are not mutually exclusive. A single conflict may involve multiple classes simultaneously, and classification should reflect the dominant character of the contradiction.

### Direct factual contradiction

A direct factual contradiction exists when two sources report incompatible values for the same specific field, such as a birthdate, birthplace, or parent name, where normal recording variation does not explain the gap.

For example: one record states that a subject was born in one parish and another record, of similar quality and comparable proximity to the event, states a different parish. If both sources are plausibly reliable and the difference is not attributable to administrative boundary differences or naming conventions, a direct factual contradiction exists.

Direct factual contradictions are the clearest class of conflict to identify and the most tractable to resolve through careful source comparison. Resolution typically depends on comparing the informant quality and event proximity of the competing sources, as defined in source evaluation.

### Identity ambiguity

An identity ambiguity exists when the evidence does not clearly distinguish between two or more individuals who might plausibly match the same observation or set of observations.

This class of conflict is especially common in environments with high rates of name repetition, small communities with limited surname differentiation, or life-course patterns that overlap across multiple individuals of the same generation and locality.

Identity ambiguity is not simply a case where the evidence is weak. It is a case where the evidence is genuinely compatible with more than one subject. Resolution requires finding observations that differentiate between the candidate individuals, not simply finding more observations that are consistent with one of them.

### Chronology inconsistency

A chronology inconsistency exists when the sequence or timing of events implied by the evidence is internally incoherent. Events may appear in an implausible order, ages may be inconsistent across records, or calculated birth years may disagree across documents in ways that cannot be explained by normal age-rounding.

Chronology inconsistencies are often symptoms of underlying identity problems. A person whose recorded age varies by more than a few years across roughly contemporary records may in fact be two different individuals whose records have been merged. Alternatively, the inconsistency may reflect a recording convention, a change of informant, or a systematic error in a particular source class.

### Location inconsistency

A location inconsistency exists when the geographic information in the evidence produces an implausible or internally contradictory account of a subject's movements or residence.

A subject who is documented in a distant location with no evidence of travel, who appears simultaneously in records from incompatible places, or whose stated place of origin conflicts with the jurisdiction of the records in which they appear, may represent either a genuine location inconsistency or a hidden identity problem.

Location inconsistencies are often underweighted in genealogical research because geographic details feel less central than names or dates. This is a methodological error. Place information constrains identity and is often essential for distinguishing between individuals with similar profiles.

### Source reliability imbalance

A source reliability imbalance exists when competing observations come from sources of meaningfully different evidentiary quality, and that difference is relevant to choosing between the conflicting values.

This class of conflict does not involve two equally credible records disagreeing. Instead, one source is characteristically stronger for the relevant field — closer to the event, produced by a better-positioned informant, less subject to transmission error — and that difference should influence how the conflict is interpreted.

Source reliability imbalance is the most common mechanism through which conflicts are appropriately resolved. When one observation comes from a source that is stronger for the relevant informational field by the criteria defined in source evaluation, that source's observation is generally preferable, provided the imbalance is genuine and the reasoning is stated explicitly.

## Conflict Severity

Not every conflict has the same consequence for the current research problem. The framework assesses conflict severity along two dimensions: materiality and resolubility.

### Materiality

A conflict is material if it affects a claim that is central to the current research question. A conflict over a peripheral detail — such as a minor variation in the spelling of a given name — may be noted but does not necessarily affect the research outcome. A conflict over a birthplace, a parentage relationship, or an identity link is material because it directly affects whether a core claim can be supported.

Before determining how much effort to invest in resolution, the researcher must assess whether the conflict is material to the problem currently being investigated. A conflict that is material for one research question may be peripheral for another.

### Resolubility

A conflict is resoluble if additional evidence exists that could plausibly discriminate between the competing observations. A conflict is not resoluble within the current evidence set if neither the available sources nor the plausibly reachable sources can settle the question.

Identifying resolubility is important because it determines the appropriate response. A resoluble conflict should prompt a research plan for acquiring the discriminating evidence. An irresolvable conflict should be documented as a known limit on the conclusion and factored into the confidence assessment accordingly.

## Resolution Paths

The framework defines four resolution paths. Each is appropriate in different circumstances and requires a different type of reasoning and record.

### Resolution by source comparison

The most common resolution path applies the source reliability imbalance class. When competing observations can be traced to sources of meaningfully different quality for the relevant field, the stronger source's observation is preferred. Resolution requires:

- explicit identification of the conflicting observations and their sources
- a source characterization for each, focused on the relevant field
- a stated reason for preferring one source based on event proximity, informant quality, or transmission status
- an acknowledgment that the non-preferred observation is not deleted but demoted

The non-preferred observation should be retained in the evidence structure with a notation that it was assessed as weaker for the specific field in question and why. It may still be useful if the preferred source is later found to be less reliable than it appeared.

### Resolution by contextual interpretation

Some conflicts can be resolved through the application of historical, social, or administrative context without requiring additional sources.

An apparent age inconsistency may be explained by a known recording convention in a particular jurisdiction. An apparent location inconsistency may be resolved by understanding that two named places were administratively the same unit under different names. A name discrepancy may be explained by a known naming transition common in the period and locality.

Contextual resolution requires that the contextual knowledge be stated explicitly and that it is specific enough to explain the particular conflict. General assertions that "records are unreliable" or "names varied a lot" are not sufficient. The context must address the specific discrepancy.

### Resolution by elimination

When multiple candidate observations or hypotheses are in competition and sufficient discriminating evidence exists, resolution may be achieved by showing that all alternatives except one are excluded by the evidence.

This path is methodologically sound but requires care. Elimination resolution depends on having identified all plausible alternatives. If an alternative has been overlooked, the resolution is incomplete. The researcher must therefore state what alternatives were considered and why each was excluded before concluding that the remaining option is supported.

Elimination resolution does not by itself raise the confidence of the surviving option to established. What remains after elimination must still be affirmatively supported. The claim model specifies this requirement.

### Deferral as resolution

Some conflicts cannot be resolved with currently available evidence. In these cases, the correct outcome is explicit deferral: acknowledging that the conflict exists, characterizing its class and severity, recording what discriminating evidence would be needed to resolve it, and adjusting the confidence of the affected claims accordingly.

Deferral is a legitimate and often correct outcome. A conflict that is explicitly deferred is better managed than a conflict that is silently absorbed into a conclusion. Deferred conflicts contribute to research planning by identifying the next useful steps.

## The Conflict Record

Every material conflict that cannot be immediately resolved must be captured in a conflict record. The conflict record is a first-class research artifact defined by the template at [`/templates/conflict-report.md`](../templates/conflict-report.md).

A conflict record must identify:

- the disputed claim or claims affected by the conflict
- the conflicting observations and their sources
- the conflict class
- an assessment of materiality and resolubility
- the current confidence posture of affected claims given the conflict
- the resolution path applied, or the reason for deferral
- the discriminating evidence that would resolve the conflict, if identifiable

A conflict record serves three functions. First, it documents the researcher's awareness of the conflict and their reasoning about it, which is essential for methodological accountability. Second, it provides future researchers or agents with enough context to continue from the current state without reconstructing the conflict from scratch. Third, it identifies the next useful research action for conflicts that are deferred pending additional evidence.

## Escalation Conditions

Escalation in this context means moving a conflict from local handling within the current research stage to a broader response: seeking additional source classes, widening the geographic or temporal scope, or treating the conflict as a fundamental reframing of the research problem.

The following conditions warrant escalation:

- the conflict is material and cannot be resolved or responsibly deferred with the current evidence
- resolution by source comparison produces contradictory results because the competing sources are of comparable quality for the relevant field
- the conflict appears to indicate a hidden identity split — that the evidence previously attributed to one individual actually describes two
- the conflict involves a claim that many downstream conclusions depend on, such that its resolution would materially reorganize the research picture
- previous resolution attempts have been attempted and failed, and new evidence of a different class is required

Escalation is not a failure. It is the correct methodological response when a conflict exceeds the capacity of local reasoning. An escalated conflict should be preserved in research memory with its full context, including the resolution attempts that did not succeed.

## Relationship to Confidence

Conflict and confidence are related but governed by separate specifications. The interaction between them follows from the principles in each.

An unresolved material conflict constitutes a residual conflict dimension in the confidence assessment. As defined in the confidence model, this dimension constrains confidence downward regardless of the other dimensions. A claim with an unresolved material conflict on a key field cannot be assessed as established, and in most cases cannot be assessed as probable, until the conflict is addressed.

A resolved conflict, once documented through the resolution path and recorded in the conflict record, no longer counts as a residual constraint against confidence. The resolution must be explicit and the record must be preserved, but a claim whose conflicts have been genuinely resolved may carry higher confidence than one with ongoing open conflicts.

Peripheral conflicts — those assessed as non-material for the current research question — do not automatically constrain confidence for claims that do not depend on the conflicting field. A conflict over a peripheral detail should be noted but not allowed to artificially depress confidence in an otherwise well-supported conclusion.

## Fundamental Rules

The framework applies three unconditional rules to conflict handling. These rules are not defaults that may be adjusted by workflow context. They apply in all cases.

**Do not collapse unresolved alternatives into a single conclusion.** When two competing observations or hypotheses remain viable, both must be preserved in the evidence structure and research memory. Selecting one without adequate justification is a methodology failure regardless of how plausible the choice appears.

**Prefer explicit conflict records over implicit confidence downgrades.** It is not sufficient to lower the confidence of a claim and say nothing more. If a conflict caused that reduction, the conflict must be documented with its class, its severity, and its effect on the claim. Readers and future agents cannot interpret an unexplained confidence level.

**Record what additional evidence would discriminate between alternatives.** Every conflict record, whether resolved or deferred, should identify the source classes, jurisdictions, or record types that could plausibly settle the question. This transforms conflict documentation from a record of failure into a research planning tool.

## Implications for AI Agents

AI agents face specific conflict-handling challenges that must be actively designed against.

### Silent resolution

An agent that encounters conflicting observations will often resolve the conflict by selecting the more probable-seeming option without flagging the contradiction or explaining the reasoning. This produces outputs that appear clean but have hidden failures. The conflict edge must be recorded; resolution must be explicit.

### Plausibility substituted for source comparison

An agent may prefer one observation over another because it fits a coherent narrative rather than because the source is stronger for the relevant field. Narrative plausibility is not a valid resolution criterion. Resolution must be grounded in source characterization and informant analysis.

### Identity split errors

When evidence has been incorrectly merged under one individual and a conflict appears, an agent may interpret the conflict as a minor inconsistency rather than as a signal that the evidence actually describes two people. Agents must be capable of splitting an identity hypothesis in response to conflict, not only choosing between competing observations within a single identity frame.

### Failing to preserve demoted observations

An agent that resolves a conflict by preferring one observation may delete or discard the non-preferred observation. The non-preferred observation must be retained in the evidence structure. It remains part of the research record and may become relevant under future evidence conditions.

## Practical Conflict Tests

Before treating a conflict as handled, the researcher or agent should be able to answer the following:

- Have the conflicting observations been identified explicitly?
- Has the conflict class been assigned?
- Has materiality been assessed relative to the current research question?
- Has a resolution path been applied or has deferral been chosen with a stated reason?
- Has a conflict record been created if the conflict is material?
- Are the non-preferred observations retained with a notation?
- Has the confidence of affected claims been adjusted to reflect the conflict status?
- Has the discriminating evidence been identified for conflicts that are deferred?

If these questions cannot be answered, the conflict has not been handled adequately.

## TODO Checklist

- [ ] Add a severity matrix that maps conflict class and materiality to recommended resolution path.
- [ ] Add worked examples of each conflict class drawn from Swedish record contexts.
- [ ] Add escalation protocol guidance for identity split cases.
- [ ] Align the conflict record template with the minimum record fields defined in this specification.

## Future Improvements

The most important future improvement for this specification is the addition of worked examples. The classification scheme and resolution paths are conceptually clear but become much more useful when illustrated through specific cases. Those cases should cover each conflict class, including at least one identity ambiguity case where the resolution requires splitting a merged identity, and one chronology inconsistency case where the conflict reveals an underlying source quality problem.

A second improvement is a formal severity matrix that maps the interaction between conflict class, materiality, and source reliability imbalance to a recommended resolution path. That matrix would make the specification more directly actionable for agents and workflow authors who need to handle conflicts systematically across diverse record situations.

## References

- [`/knowledge/research-principles.md`](../knowledge/research-principles.md)
- [`/knowledge/source-evaluation.md`](../knowledge/source-evaluation.md)
- [`/knowledge/evidence-model.md`](../knowledge/evidence-model.md)
- [`/specs/confidence-model.md`](confidence-model.md)
- [`/specs/claim-model.md`](claim-model.md)
- [`/workflows/research-workflow.md`](../workflows/research-workflow.md)
- [`/templates/conflict-report.md`](../templates/conflict-report.md)
- [`/prompts/compare-sources.md`](../prompts/compare-sources.md)
