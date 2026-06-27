---
title: Research Principles
purpose: Define the foundational research principles that govern rigorous genealogical inquiry across all framework workflows and country modules.
scope: Research posture, evidentiary discipline, hypothesis management, scope control, and methodological guardrails for genealogy research performed by humans or AI agents.
audience:
  - Genealogists
  - AI systems designers
  - Workflow authors
  - Prompt authors
  - Reviewers
dependencies:
  - /STYLE_GUIDE.md
  - /Project Instructions.md
  - /knowledge/source-evaluation.md
related_documents:
  - /workflows/research-workflow.md
  - /specs/confidence-model.md
  - /specs/conflict-resolution.md
  - /templates/research-plan.md
status: canonical
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.2.0
    date: 2026-06-27
    summary: Expanded into a canonical methodological reference for genealogical research practice.
  - version: 0.1.0
    date: 2026-06-27
    summary: Initial repository bootstrap version.
---

# Research Principles

## Purpose

This document defines the core research principles that should govern all genealogical work performed within the Genealogy AI Framework. It is the methodological base layer beneath source evaluation, reasoning specifications, prompt contracts, and research workflows.

Its function is not to describe every research task in procedural detail. Its function is to establish the intellectual posture that must remain stable across those tasks. A workflow may change sequence. A prompt may change format. A country module may change domain context. The research principles should remain recognizably intact.

## Scope

This document covers how genealogical research should be approached, framed, constrained, and revised. It addresses questions such as what constitutes a responsible conclusion, how uncertainty should be handled, how identity should be treated over time, and how evidence should shape direction.

This document does not define the full criteria for source evaluation, the mechanics of confidence scoring, or the ordered stages of a workflow. Those are owned by other modules. Here, the concern is methodological discipline.

## Audience

- Genealogists contributing domain guidance
- AI systems designers implementing framework behavior
- Workflow authors translating research method into process
- Prompt authors defining analytical tasks
- Reviewers evaluating whether outputs are methodologically sound

## Dependencies

This document depends on the repository-wide language and conceptual discipline in [`/STYLE_GUIDE.md`](../STYLE_GUIDE.md), the agent behavior rules in [`/Project Instructions.md`](../Project%20Instructions.md), and the source characterization groundwork in [`/knowledge/source-evaluation.md`](source-evaluation.md).

## Related Documents

- Research workflow: [`/workflows/research-workflow.md`](../workflows/research-workflow.md)
- Confidence model: [`/specs/confidence-model.md`](../specs/confidence-model.md)
- Conflict resolution: [`/specs/conflict-resolution.md`](../specs/conflict-resolution.md)
- Research plan template: [`/templates/research-plan.md`](../templates/research-plan.md)

## Methodological Orientation

Genealogical research is cumulative, inferential, and adversarial in a narrow methodological sense. It is cumulative because conclusions emerge from the progressive accumulation of records, observations, and contextual interpretation. It is inferential because the strongest conclusion is often not directly stated in any one source. It is adversarial because every appealing conclusion must survive comparison with competing explanations, weak data, missing records, transcription problems, and historical complexity.

Good genealogy is therefore not the art of producing a tidy story. It is the practice of constructing the most defensible explanation that the available evidence can support while clearly preserving what remains uncertain, contradictory, or incomplete.

## First Principles

The following principles govern all serious genealogical work in this framework.

### Research begins with a question, not a conclusion

Research should begin with a defined question or problem state rather than an assumed answer. A vague desire to "find the right person" is not methodologically sufficient unless it is grounded in a narrower question such as whether two records refer to the same individual, whether a relationship claim is adequately supported, or which source classes are most likely to resolve an identity conflict.

This principle exists because genealogy is highly vulnerable to confirmation bias. Once an appealing narrative has formed, later evidence is often interpreted in its favor rather than tested against it. A framework-compliant research posture begins by specifying the problem and allowing evidence to constrain the answer.

### Evidence outranks narrative convenience

An elegant explanation is not inherently a strong explanation. The fact that one narrative ties many details together does not make it correct if those details are weakly supported or selectively assembled.

The researcher must therefore prefer evidentiary discipline over narrative smoothness. If the strongest available account remains awkward, partial, or visibly unresolved, that is preferable to a more persuasive but less justified synthesis.

### Identity is a working hypothesis until support is sufficient

In genealogy, identity is often inferred rather than directly proven. Names recur. Dates drift. Places shift. Occupations change. Family configurations vary across records. For this reason, a person should not be treated as a fully settled identity merely because several details appear to align.

The correct methodological posture is to treat identity as a hypothesis that may:

- strengthen with cumulative support
- weaken when contradictions emerge
- split into multiple candidate persons
- remain unresolved pending additional evidence

This principle is especially important for AI systems, which are often rewarded for producing singular confident answers even where the evidence only supports provisional identification.

### Absence of evidence must be interpreted cautiously

A missing record may matter, but its meaning depends on context. It may indicate that the expected event did not occur, that the wrong jurisdiction is being searched, that the record set is incomplete, that the transcription is defective, or that the person was documented under a different name or category.

The researcher must therefore avoid treating non-appearance as simple disproof unless the evidentiary context justifies that interpretation. Negative findings can be highly valuable, but only when their limits are understood.

### Research is comparative, not merely accumulative

Genealogical work is not improved simply by collecting more documents. It improves when collected evidence is compared, weighed, grouped, and tested against alternative explanations.

Accumulation without comparison creates clutter. Comparison without source discipline creates speculation. The principled researcher does both: collect evidence responsibly, then compare it systematically.

## Framing the Research Problem

Before evidence can be interpreted well, the research problem must be framed correctly.

### Define the question precisely

A strong research question has a clear subject, a bounded uncertainty, and an implied decision point. For example:

- Are these two baptism and household records likely to describe the same person?
- Is the claimed parent-child relationship supported by direct or indirect evidence?
- Which parish or jurisdiction should be searched next to test the migration hypothesis?

Weak questions often hide multiple problems inside one request. A research task should be decomposed until its success or failure is intelligible.

### Separate knowns from assumptions

At the beginning of a research problem, the researcher should distinguish:

- what is explicitly supported by evidence already in hand
- what is inherited from prior research but not yet verified
- what is merely assumed because it seems likely

This separation prevents the silent upgrading of assumptions into working facts.

### State the decision threshold

Not every research question requires the same level of support. Some tasks ask whether a lead is promising enough to continue. Others ask whether an identity claim should be accepted in a formal report. The threshold matters.

The researcher should therefore understand whether the task is exploratory, comparative, confirmatory, or corrective. Without that clarity, both overstatement and excessive hesitation become more likely.

## Evidence Posture

Research quality depends not only on what evidence is found, but on how it is treated.

### Prefer the closest evidence that can reasonably be obtained

All else equal, records closer to the event in time, authorship, and informational proximity are generally more informative than later derivative summaries. That does not mean later records are unimportant. It means their use must be interpreted in context.

This principle supports a disciplined search order. Where possible, the researcher should prefer evidence that reduces transmission layers between the event and the recorded statement.

### Preserve raw observations before synthesis

The researcher should preserve what the source actually contributes before merging it into a broader conclusion. This includes names, dates, locations, relationships, occupations, statuses, movements, and notable qualifiers.

The reason is methodological as much as practical. Once synthesis begins, it becomes easy to lose track of which elements came directly from records and which emerged from interpretation. Preserving observations first keeps reasoning auditable.

### Treat contradictions as information

Contradictions are not merely obstacles to be removed. They are data about the evidence landscape. A contradictory age, birthplace, surname form, or relationship description may reveal:

- multiple individuals with overlapping profiles
- a shift in naming or reporting practice
- a derivative source problem
- a transcription error
- a real historical irregularity

The researcher should therefore not hide contradictions prematurely. They often contain the very structure needed to solve the problem.

## Hypothesis Management

Genealogical reasoning is at its best when hypotheses are handled explicitly rather than implicitly.

A hypothesis in this document is a provisional explanatory candidate — an explanation under active consideration that has not yet been evaluated against sufficient evidence to constitute a formal assertion. Once a hypothesis has been evaluated through the evidence framework, it becomes a claim with an explicit confidence level. The formal relationship between these two terms is defined in [`/specs/claim-model.md`](../specs/claim-model.md).

### Form hypotheses in comparable terms

When alternative explanations exist, they should be phrased so that they can be meaningfully compared. Vague alternatives such as "maybe something else happened" are less useful than structured alternatives such as:

- the record refers to the same person under a different naming form
- the record refers to a different person with a similar identity profile
- the event occurred in a neighboring parish and was later reported secondhand

Comparable hypotheses support disciplined evaluation. Vague alternatives merely delay it.

### Keep live hypotheses visible

An unresolved hypothesis should not disappear simply because another explanation currently looks stronger. If both remain viable, both should remain visible until one is adequately disconfirmed or the decision threshold allows a bounded conclusion with stated uncertainty.

### Revise hypotheses in response to evidence, not fatigue

Researchers often simplify too early because the complexity of alternatives becomes inconvenient. This is methodologically unsound. A hypothesis should be revised when the evidence justifies revision, not because maintaining alternatives is uncomfortable.

## Scope Control

One of the most common research failures is uncontrolled scope expansion.

### Solve the present problem before generalizing

A conclusion about one person, relationship, or migration pattern should not silently expand into a broader statement about a family line, locality, or surname group unless separate support exists for that broader claim.

### Keep contextual knowledge in its proper place

Historical, social, linguistic, and archival context is essential in genealogy. But contextual knowledge is interpretive support, not case-specific proof. It may explain why a pattern is plausible; it does not establish that the pattern occurred in the individual case without evidentiary support.

### Distinguish local success from global truth

A research step may succeed in narrowing possibilities without fully resolving the whole problem. That still counts as progress. Genealogical research should value bounded advances rather than forcing every stage into an all-or-nothing conclusion.

## Negative Findings and Research Memory

Good research preserves not only what worked, but also what did not.

### Negative findings have methodological value

A failed search, an excluded jurisdiction, an unproductive source class, or a discarded identity match may materially change future strategy. These outcomes should be preserved when they affect search direction, confidence, or hypothesis ranking.

### Dead ends should be classified, not merely noted

When a search path fails, the reason matters. A dead end may result from:

- incomplete records
- overly narrow scope
- misidentified jurisdiction
- mistaken prior assumption
- insufficient identifying detail

The future value of a negative result depends on whether its cause is intelligible.

### Research memory must preserve reversibility

A sound research record should make it possible to revisit earlier steps, understand why a decision was made, and reassess it under new evidence. Research that cannot be retraced is fragile, even when it appears persuasive.

## Bias Control

Genealogical research is especially vulnerable to a small set of recurring biases.

### Confirmation bias

Once a favored identity or lineage has been proposed, later evidence is often interpreted as support rather than tested as evidence. The researcher must actively ask what would disconfirm the current working conclusion.

### Name bias

Matching names can be compelling, especially in repetitive local naming environments. But names alone rarely settle identity. A name is a signal, not a conclusion.

### Lineage bias

Researchers may overweight evidence that preserves a desired family connection and underweight evidence that complicates it. This is especially dangerous in compiled trees, inherited family narratives, and downstream AI outputs trained to prefer coherent stories.

### Availability bias

Digitized, indexed, legible, or easy-to-access records often exert disproportionate influence simply because they are available. Harder-to-reach sources may still be methodologically more important.

Bias control is not a separate workflow step. It is a continuous discipline.

## Escalation Principles

Sometimes the correct methodological move is not to continue interpreting, but to change the type of work being done.

### Escalate from conclusion to planning when evidence is thin

If the evidence is insufficient to support a reliable conclusion, the researcher should switch from conclusion-writing to research-planning. The goal becomes identifying which source classes, jurisdictions, comparisons, or contextual checks are most likely to discriminate between alternatives.

### Escalate from synthesis to comparison when conflict emerges

If evidence begins to conflict materially, the researcher should pause broad synthesis and compare the conflicting source elements directly. Contradictions are most often mishandled when they are absorbed into narrative too early.

### Escalate from individual records to patterns when direct evidence is absent

When direct evidence is missing, broader contextual and relational patterns may become useful. But this escalation must remain explicit. Indirect evidence should not masquerade as direct confirmation.

## Completion Principles

Research does not end when the prose looks finished. It ends, for the current stage, when the state of the problem has been responsibly characterized.

### A conclusion is complete when its limits are visible

A genealogical conclusion is methodologically responsible when a reviewer can tell:

- what is being claimed
- what supports it
- what weakens it
- what remains uncertain
- what future evidence could revise it

### Partial conclusions are legitimate

It is acceptable to conclude that:

- one hypothesis is currently stronger than another
- a relationship is plausible but not yet established
- a source class is exhausted for the current question
- a problem should be reframed before further searching

Methodological maturity includes knowing when a partial conclusion is the strongest honest result available.

## Implications for AI Agents

Although these principles apply equally to human researchers, they are especially important for AI systems because AI failure modes often run directly against good genealogy.

An AI agent tends to:

- collapse ambiguity into single answers
- treat plausible general patterns as case-specific proof
- generate polished synthesis before evidence has been properly compared
- omit the difference between source content and interpretation
- overstate confidence when the task format rewards decisiveness

Framework-compliant agents must therefore be designed to resist these tendencies rather than amplify them.

## Practical Research Tests

Before accepting a conclusion or moving to the next workflow stage, the researcher should be able to answer yes to most of the following questions:

- Is the research question precise enough to evaluate?
- Have the main assumptions been separated from the supported facts?
- Are the strongest relevant sources identified or intentionally deferred?
- Are observations preserved distinctly from conclusions?
- Have major contradictions been surfaced rather than absorbed?
- Are alternative hypotheses still visible where required?
- Is the current conclusion proportional to the evidence?
- Is the next step clear if the problem remains unresolved?

These are not bureaucratic checks. They are indicators of whether the research process remains methodologically sound.

## TODO Checklist

- [ ] Add a dedicated section on indirect evidence and correlation once the evidence model is expanded further.
- [ ] Add a companion annex for cluster research, associates, witnesses, sponsors, and household-based inference.
- [ ] Add worked examples showing how the same principle behaves differently in exploratory versus confirmatory research tasks.
- [ ] Add cross-jurisdiction guidance for adapting these principles outside Swedish-first workflows.

## Future Improvements

The next revision should deepen two areas in particular. The first is indirect evidence, because many serious genealogical problems are solved not through one definitive record but through correlated fragments that only become meaningful when compared carefully. The second is research escalation, especially the transition from direct identity work to broader network, locality, or household analysis.

This document will also benefit from future pairing with benchmark examples drawn from real record situations. The principles are intended to be stable on their own, but example-driven annexes would make it easier to test whether workflows and agents are applying them faithfully rather than merely repeating their language.

## References

- [`/Project Instructions.md`](../Project%20Instructions.md)
- [`/STYLE_GUIDE.md`](../STYLE_GUIDE.md)
- [`/knowledge/source-evaluation.md`](source-evaluation.md)
- [`/workflows/research-workflow.md`](../workflows/research-workflow.md)
- [`/specs/confidence-model.md`](../specs/confidence-model.md)
- [`/specs/conflict-resolution.md`](../specs/conflict-resolution.md)
- [`/templates/research-plan.md`](../templates/research-plan.md)
