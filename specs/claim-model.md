---
title: Claim Model
purpose: Define the structure, properties, and lifecycle of genealogical claims within the framework, including how claims are formed, supported, compared, and revised.
scope: Claim definition, claim types, support structure, identity claims, relationship claims, event claims, claim lifecycle, and the relationship between claims and confidence.
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
  - /specs/conflict-resolution.md
  - /specs/agent-contracts.md
  - /workflows/research-workflow.md
  - /workflows/record-linking.md
  - /templates/research-report.md
  - /templates/person-summary.md
status: canonical
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: Initial canonical claim model specification.
---

# Claim Model

## Purpose

This document defines the claim as the fundamental unit of genealogical conclusion within the Genealogy AI Framework. A claim is a discrete, assessable proposition about a person, event, relationship, or identity. Understanding how claims are formed, supported, challenged, and revised is essential for any framework-compliant reasoning system.

The claim model exists to prevent a common failure mode in both manual and AI-assisted genealogy: the conflation of observation, inference, and conclusion into a single undifferentiated output. When these layers are collapsed, research becomes difficult to audit, difficult to revise, and prone to cascading error. The claim model restores the distinctions between what was observed, what was inferred, and what was concluded, and makes each layer explicit.

## Scope

This document defines the conceptual structure of genealogical claims. It covers claim types, the distinction between claims and observations, the support structure that connects claims to evidence, claim lifecycle from formation through revision, and the rules governing how claims interact with confidence assessment, conflict handling, and research memory.

This document does not define machine-readable claim formats or schema-level data structures. Those concerns belong to the implementation phase. This document defines the conceptual layer that any such implementation must respect.

## Audience

- Reasoning designers specifying how agents form and evaluate conclusions
- AI systems designers implementing claim-aware research agents
- Workflow authors defining how claims are produced, compared, and preserved
- Reviewers auditing whether conclusions are properly grounded
- Genealogists evaluating whether framework outputs accurately represent what evidence supports

## Dependencies

This document depends on the methodological principles in [`/knowledge/research-principles.md`](../knowledge/research-principles.md), the source characterization framework in [`/knowledge/source-evaluation.md`](../knowledge/source-evaluation.md), the evidence structure in [`/knowledge/evidence-model.md`](../knowledge/evidence-model.md), and the confidence vocabulary in [`/specs/confidence-model.md`](confidence-model.md).

## Related Documents

- Conflict resolution: [`/specs/conflict-resolution.md`](conflict-resolution.md)
- Agent contracts: [`/specs/agent-contracts.md`](agent-contracts.md)
- Research workflow: [`/workflows/research-workflow.md`](../workflows/research-workflow.md)
- Record linking workflow: [`/workflows/record-linking.md`](../workflows/record-linking.md)
- Research report template: [`/templates/research-report.md`](../templates/research-report.md)
- Person summary template: [`/templates/person-summary.md`](../templates/person-summary.md)

## What a Claim Is

A claim is an asserted proposition that:

- concerns a specific subject such as a person, relationship, event, or identity
- carries an explicit confidence level from the confidence vocabulary
- is grounded in traceable evidence rather than unsourced inference
- is bounded in scope to what its supporting evidence can responsibly support
- is revisable when new evidence or reinterpretation warrants a change

A claim is not a summary, a narrative, or a general statement about historical patterns. It is a discrete unit of genealogical reasoning that can be examined, challenged, accepted, deferred, or revised on its own terms.

## The Distinction Between Observations and Claims

One of the most important distinctions in this framework is between an observation and a claim.

An `observation` is what a source says or contains. It is a recorded detail: a name appearing in a baptism entry, a stated age in a household record, a birthplace in a migration document. Observations are extracted; they are not yet interpreted as conclusions.

A `claim` is what is asserted based on one or more observations. The assertion involves inference. A claim may be that a person was born in a particular parish, that two records refer to the same individual, or that a stated relationship is accurate. This is not simply what any source says. It is a conclusion about what the evidence, taken together, supports.

This distinction matters because:

- observations are tied to specific sources and can be evaluated for reliability at the source level
- claims involve cross-source reasoning that introduces additional interpretive layers
- collapsing observations into claims without marking the transition hides the reasoning step and makes conclusions harder to audit or revise

Framework-compliant outputs must preserve this distinction at every stage.

## The Relationship Between Hypotheses and Claims

The framework uses both `hypothesis` and `claim` as technical terms. They are not interchangeable, but they describe adjacent stages in the same reasoning process.

A `hypothesis` is a provisional explanatory candidate that has been formed but has not yet been evaluated against sufficient evidence to constitute a formal assertion. Hypotheses are the working material of research: they direct search strategy, structure comparison, and frame the question being investigated. [`/knowledge/research-principles.md`](../knowledge/research-principles.md) describes the methodological discipline of hypothesis management — how to form hypotheses in comparable terms, keep them visible when unresolved, and revise them in response to evidence rather than convenience.

A `claim` is a formal assertion that has been subjected to that evaluation. It carries an explicit confidence level drawn from the vocabulary defined in [`/specs/confidence-model.md`](confidence-model.md) and a traceable support structure.

The transition from hypothesis to claim occurs when a researcher or agent applies the evidence framework: extracting observations, characterizing sources, comparing across the evidence set, and assigning a confidence level. Before that evaluation, the proposition is a hypothesis. After it, the proposition is a claim — even if its confidence level is `possible` or `unresolved`.

This means the two terms map as follows:

| Research process term | Formal model term |
| --- | --- |
| Active hypothesis under investigation | `possible` claim or `unresolved` claim |
| Hypothesis gaining corroboration | `probable` claim |
| Hypothesis accepted as adequately supported | `established` claim |
| Hypothesis set aside but not disproven | Superseded or retired claim |
| Hypothesis directly contradicted by evidence | `contradicted` claim |

The practical implication is that `hypothesis` is the correct term when describing research posture and process, and `claim` is the correct term when describing the formal output of evidence evaluation. A live hypothesis should become a formal claim as soon as it has been evaluated, even if that evaluation yields `possible` or `unresolved` confidence. An unevaluated proposition should not be called a claim.

## Claim Types

The framework recognizes four principal categories of genealogical claim. Each type has characteristic support requirements and characteristic risks.

### Identity claims

An identity claim asserts that a specific real-world person is the subject of a given body of evidence. For example: that two records from different sources describe the same individual, or that a person in one record is the same person who appears in another record some years later.

Identity claims are often the most consequential and methodologically demanding claims in genealogical research. They are the point at which multiple evidence streams are committed to a single subject. If an identity claim is wrong, all downstream conclusions depending on it inherit the error.

The support requirements for identity claims are therefore especially strict. The evidence must differentiate the subject from plausible alternatives, must be consistent across the relevant identifying dimensions, and must be evaluated with care for the naming, geographic, and demographic context of the period and place.

### Event claims

An event claim asserts that a specific event occurred, typically involving a defined subject, time, place, and context. Events in this framework include birth, baptism, marriage, death, burial, migration, residence change, employment change, and other life-course transitions that genealogical records commonly document.

Event claims vary in complexity. A simple event claim may assert only that an event occurred and its approximate date. A more precise claim may specify exact date, officiant, witnesses, parish, and status. The scope of an event claim should correspond to what the evidence can responsibly support.

Event claims are often the building blocks from which identity claims and relationship claims are constructed. An event claim does not require prior resolution of identity, but identity and event claims must ultimately be consistent with one another.

### Relationship claims

A relationship claim asserts a connection between two or more persons. Relationships in this framework include parentage, siblinghood, marriage, godparenthood, household membership, employment relation, and other documented or inferred connections.

Relationship claims frequently rest on indirect evidence. A relationship may be asserted because two persons appear together consistently in records, because a naming pattern suggests a family connection, or because an administrative record implies a legal or social bond. The indirect basis of many relationship claims makes them especially susceptible to overstatement.

The support requirements for relationship claims must be proportionate to the specificity of the relationship being asserted. A claim of household co-residence has different support requirements than a claim of parentage.

### Attribute claims

An attribute claim asserts a stable property of a person that is not tied to a single event. Attributes may include occupation, status, religion, literacy, linguistic context, social standing, and named characteristics that persist or recur across the evidential record.

Attribute claims are often derived from patterns across multiple records rather than from a single source. They therefore require consistent evidence across the support base and careful attention to whether apparent consistency reflects genuine persistence or merely the repetition of an error or convention through derivative sources.

## Claim Scope

Every claim has a scope, which defines what the claim actually asserts and where its boundaries lie. Scope management is essential because genealogical claims are easily inflated beyond what their evidence can support.

A claim is over-scoped when it asserts more than the evidence justifies. For example, a record showing a person in a particular village at one point in time does not support a claim that the person was born in that village, nor that they remained there throughout their life. The claim must be restricted to what the evidence specifically addresses.

A claim is under-scoped when it fails to capture what the evidence actually supports. Under-scoping is less dangerous than over-scoping but can leave important conclusions unformed and unavailable for downstream reasoning.

Scope discipline is especially important for identity claims. Claiming that two records describe the same person is a bounded assertion. Claiming that a named person is the ancestor of a specific living family is a far more expansive claim that requires a separate chain of evidence at each generational link.

## Claim Support Structure

Each claim must be supported by an explicit evidence base. The support structure of a claim consists of:

- the observations that directly bear on the claim
- the sources from which those observations were extracted
- the source evaluations that characterize each source's evidentiary weight
- the reasoning steps that connect the observations to the claim
- any acknowledged conflicts, limits, or residual uncertainties

A claim without a traceable support structure cannot be assessed, cannot be revised intelligently, and cannot be trusted as a foundation for further reasoning. Framework-compliant claims must preserve their support structure in all contexts where they are recorded or reported.

## How Claims Are Formed

Claims emerge from the reasoning stages of the research workflow, specifically from the comparison and synthesis stages where structured observations are evaluated together.

The formation of a claim should follow a defined sequence:

1. identify the question or proposition to be evaluated
2. collect the relevant observations from the analyzed source set
3. assess the source quality and information type for each observation
4. compare observations for consistency, conflict, and differentiation
5. determine whether the combined evidence supports a claim and at what scope
6. assign a confidence level based on the confidence model
7. record the support structure explicitly

This sequence prevents the most common formation error: reaching a conclusion before the observations have been properly compared and the sources properly evaluated.

## Competing Claims

Genealogical research frequently produces situations where two or more claims about the same subject are simultaneously viable. This is normal rather than exceptional, especially in identity-rich environments with common names or limited discriminating detail.

Competing claims must be preserved explicitly rather than collapsed into a single conclusion. The rules for managing competing claims are:

- do not resolve competition by selecting one claim without adequate evidentiary justification
- do not hide the competition by presenting a single conclusion with no acknowledgment of alternatives
- preserve each competing claim with its own support structure and confidence assessment
- identify what discriminating evidence would resolve the competition, if such evidence exists
- escalate to conflict resolution handling if the competition is material and sustained

A claim that defeats its competitors through better evidence becomes a primary claim, but the defeated alternatives should remain on record with the reason for their demotion. Research history has value even when hypotheses are set aside.

## Claim Lifecycle

A claim does not have a fixed status. It passes through recognizable states as research progresses.

### Formation

A claim is formed when sufficient observations have been compared to produce an assessable proposition. At formation, the claim receives an initial confidence level and a support structure.

### Activation

An active claim is one that is currently treated as a working conclusion. Active claims may be used as inputs to downstream reasoning, but their confidence level must be preserved and carried forward. Downstream reasoning that depends on an active probable claim inherits that claim's limitations.

### Revision

A claim is revised when new evidence, reinterpretation of existing sources, or conflict resolution changes the evidentiary basis. Revision may raise or lower confidence, narrow or expand scope, or change the claim type.

Revision must always be explicit. The prior state of the claim must be preserved alongside the revision, with the reason for change recorded. Silent revision is a research integrity failure.

### Supersession

A claim is superseded when a better-supported claim on the same subject replaces it. Supersession is stronger than downward revision. It means that the prior claim is no longer active but remains on record as part of the research history.

### Retirement

A claim may be retired when it is formally abandoned without being superseded. Retirement is appropriate when a claim's support base is found to be entirely invalid, when a framing error is discovered, or when the claim's subject is revealed to have been incorrectly defined.

Retired claims are not deleted. They remain in research memory as records of what was considered and why it was set aside.

## Claim Granularity

Claims should be formed at a granularity that makes them individually assessable. A compound claim that bundles multiple distinct propositions into one assertion is difficult to evaluate, difficult to revise, and prone to partial error being hidden by partial accuracy.

The preferred approach is to form multiple focused claims that can each be independently supported, rather than one broad claim that mixes strong and weak evidence into a single statement.

For example, rather than claiming that a person was born in a particular village, had a particular father, and followed a particular occupational path, the researcher should form three separate claims: one for birthplace, one for parentage, and one for occupation. Each can then carry its own confidence level and support structure.

## Claims in Conflict

When two active claims conflict on a material point, the conflict must be addressed rather than ignored. The mechanism for that address is defined in [`/specs/conflict-resolution.md`](conflict-resolution.md).

The claim model requires only that conflict is recognized when it arises and that it is not silently absorbed into a synthesis that hides the contradiction. Two claims that cannot both be correct are not a problem to be narratively resolved; they are a research problem to be methodologically handled.

## Claims in Outputs

Claims that appear in research outputs must be expressed with their confidence levels. The form of expression may vary by output type, but the following rules apply in all cases:

- the confidence level must be unambiguous
- the principal sources supporting the claim must be identifiable
- any limits, conflicts, or residual uncertainties must be visible
- the scope of the claim must not exceed what the evidence supports

Prose outputs must not smooth over confidence distinctions through language choices that imply certainty where only probability exists. Words like "was," "had," and "did" should be reserved for established claims. Probable claims should use hedged language. Possible claims should be identified as hypotheses. Unresolved claims should be presented as open questions.

## Implications for AI Agents

AI systems face specific challenges in claim formation that must be actively managed.

### Premature synthesis

An AI agent working through a complex evidence set may be drawn toward early synthesis: producing a single coherent narrative before all observations have been properly compared. The claim model counteracts this by requiring that claims be formed explicitly from observations rather than generated as narrative output and back-filled with evidence.

### Unbounded scope

AI agents tend to expand claim scope beyond what the evidence directly supports because broader claims produce more satisfying narratives. Scope discipline must be enforced at the claim formation stage, not corrected retrospectively in the output.

### Implicit identity assumptions

When processing multiple records about the same apparent person, an AI agent may silently assume that all records describe the same individual rather than forming an explicit identity claim with its own support structure. This silent assumption is one of the most consequential errors in AI-assisted genealogy. The claim model requires that identity be asserted explicitly and supported explicitly.

### Failure to preserve competing claims

AI agents often produce singular conclusions because that is the pattern their outputs are optimized for. The claim model requires that genuine alternatives remain visible until one is adequately supported. Agents must be designed to maintain multiple active claims under competition rather than defaulting to the most plausible single answer.

## Practical Claim Tests

Before a claim is treated as a framework-compliant output, the following questions should be answerable:

- What exactly is being asserted by this claim?
- What is its scope, and does the evidence actually justify that scope?
- What observations support it, and from what sources?
- What is the source quality characterization for each supporting source?
- Does the supporting evidence differentiate the subject from plausible alternatives?
- Are there competing claims, and are they preserved?
- What confidence level applies, and why?
- Are the limits and residual uncertainties visible?
- Can the claim and its support structure be preserved and reviewed?

If these questions cannot be answered, the claim is not yet complete.

## TODO Checklist

- [ ] Add worked examples of claim formation for each claim type drawn from Swedish record contexts.
- [ ] Add guidance on minimum support requirements by claim type and confidence level.
- [ ] Add explicit rules for claim inheritance when one claim depends on another.
- [ ] Add claim revision examples showing how new evidence should alter an existing claim record.

## Future Improvements

The most important future improvement for this document is the addition of worked examples. Claim formation is methodologically precise, but the precision becomes practically useful only when applied to real or realistic evidence scenarios. Those examples should demonstrate the full lifecycle of a claim from formation through revision, and they should include cases where competing claims are maintained, resolved, and retired.

A second important improvement is to formalize the relationship between claims and research memory. Research memory must be able to store active claims, competing claims, retired claims, and the transitions between states in a way that supports future research continuation without hidden assumptions. That formalization will require coordination between this specification and the research memory workflow.

## References

- [`/knowledge/research-principles.md`](../knowledge/research-principles.md)
- [`/knowledge/source-evaluation.md`](../knowledge/source-evaluation.md)
- [`/knowledge/evidence-model.md`](../knowledge/evidence-model.md)
- [`/specs/confidence-model.md`](confidence-model.md)
- [`/specs/conflict-resolution.md`](conflict-resolution.md)
- [`/workflows/research-workflow.md`](../workflows/research-workflow.md)
- [`/templates/research-report.md`](../templates/research-report.md)
- [`/templates/person-summary.md`](../templates/person-summary.md)
