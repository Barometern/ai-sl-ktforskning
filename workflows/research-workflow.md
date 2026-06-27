---
title: Core Research Workflow
purpose: Define the canonical end-to-end workflow for AI-assisted genealogical research within the framework.
scope: Full research lifecycle from question framing through evidence gathering, interpretation, comparison, synthesis, escalation, and output preparation.
audience:
  - Workflow designers
  - AI systems designers
  - Implementers
  - Reviewers
  - Genealogists
dependencies:
  - /Project Instructions.md
  - /knowledge/research-principles.md
  - /knowledge/source-evaluation.md
  - /specs/agent-contracts.md
related_documents:
  - /workflows/document-analysis.md
  - /workflows/person-investigation.md
  - /workflows/record-linking.md
  - /workflows/research-memory.md
  - /templates/research-report.md
  - /templates/research-plan.md
status: canonical
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.2.0
    date: 2026-06-27
    summary: Expanded into the canonical end-to-end research workflow for framework-compliant agents.
  - version: 0.1.0
    date: 2026-06-27
    summary: Initial repository bootstrap version.
---

# Core Research Workflow

## Purpose

This document defines the canonical workflow for genealogy research performed within the Genealogy AI Framework. It describes the default end-to-end sequence by which a research question is framed, evidence is gathered and characterized, observations are converted into claims, alternatives are compared, and outputs are produced in a reviewable form.

The workflow exists to turn sound methodology into repeatable operational behavior. It is not a replacement for research judgment. Rather, it provides the ordered structure within which that judgment should be exercised.

## Scope

This workflow governs the baseline research loop used by framework-compliant agents and by humans working against the framework. It applies to research tasks that involve uncertainty, source analysis, claim formation, and output preparation.

It is an umbrella workflow. More specialized workflows such as document analysis, person investigation, record linking, timeline construction, and research memory inherit from it or attach to specific stages within it. This document does not attempt to reproduce those narrower workflows in full. Its responsibility is to define the shared backbone.

## Audience

- Workflow designers translating methodology into operational stages
- AI systems designers implementing compliant research agents
- Implementers building orchestration logic
- Reviewers auditing whether the research process was followed
- Genealogists using the framework as a structured research system

## Dependencies

This workflow depends on the behavioral rules in [`/Project Instructions.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/Project%20Instructions.md), the methodological foundation in [`/knowledge/research-principles.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/research-principles.md), the source characterization rules in [`/knowledge/source-evaluation.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/source-evaluation.md), and the implementation contract framing in [`/specs/agent-contracts.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/agent-contracts.md).

## Related Documents

- Document analysis workflow: [`/workflows/document-analysis.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/document-analysis.md)
- Person investigation workflow: [`/workflows/person-investigation.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/person-investigation.md)
- Record linking workflow: [`/workflows/record-linking.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/record-linking.md)
- Research memory workflow: [`/workflows/research-memory.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/research-memory.md)
- Research report template: [`/templates/research-report.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/templates/research-report.md)
- Research plan template: [`/templates/research-plan.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/templates/research-plan.md)

## Workflow Philosophy

The workflow is designed around a simple principle: genealogical research should proceed in a direction that preserves traceability while increasing explanatory power. This means the workflow does not jump directly from question to answer. It deliberately moves through stages that isolate framing, source access, observation, comparison, claim formation, conflict handling, and output generation.

A workflow is successful not when it produces polished prose quickly, but when it produces a defensible research state. That state may be a strong conclusion, a partial conclusion, a conflict map, or a plan for further research. The workflow must therefore support completion without false closure.

## Workflow Overview

At the highest level, the workflow proceeds through seven stages:

1. frame the research problem
2. establish the initial evidence strategy
3. acquire and analyze candidate sources
4. structure observations and source characterizations
5. build and compare claims and hypotheses
6. decide, defer, or escalate
7. produce outputs and update research memory

These stages are ordered for a reason. Later stages may loop back to earlier ones, but they should not silently bypass them.

## Stage 1: Frame the Research Problem

### Objective

The objective of Stage 1 is to transform a broad research request into an operationally meaningful problem statement. This includes clarifying the target subject, the uncertainty to be resolved, the known constraints, and the kind of output expected at the current stage.

### Required inputs

- the stated research question or task trigger
- any existing claims, family narratives, or prior conclusions
- any known scope limits such as jurisdiction, period, person, family, or source availability

### Required actions

- identify the exact question being asked
- separate supported facts from inherited assumptions
- define the current research threshold
- determine whether the task is exploratory, comparative, confirmatory, corrective, or planning-oriented

### Exit condition

Stage 1 is complete when the workflow can name the research problem precisely enough that success, failure, or partial progress can later be recognized.

### Common failure mode

The most common failure at this stage is treating a vague request such as "find this ancestor" as though it were already a structured research question. If the question is ill-formed, everything downstream becomes unstable.

## Stage 2: Establish the Initial Evidence Strategy

### Objective

The objective of Stage 2 is to define which source classes, jurisdictions, and search paths are most relevant to the framed question. This stage creates an initial strategy rather than a final commitment.

### Required actions

- identify likely source classes relevant to the question
- determine probable jurisdictions or archival contexts
- decide whether the problem is best approached through direct, comparative, or indirect evidence
- rank likely next sources by expected evidentiary value rather than convenience alone

### Decision criteria

The workflow should prefer sources that are:

- close to the event
- likely to contain discriminating details
- appropriate to the current decision threshold
- realistic to analyze within the present task scope

### Exit condition

Stage 2 is complete when the workflow has a reasoned initial source strategy that can guide acquisition and analysis.

### Common failure mode

A common error is confusing source availability with source priority. Easy-to-access records often dominate the workflow even when they are methodologically weaker than harder-to-obtain alternatives.

## Stage 3: Acquire and Analyze Candidate Sources

### Objective

The objective of Stage 3 is to gather relevant sources and transform them into structured, reviewable observations without prematurely collapsing them into conclusions.

### Required actions

- collect the candidate sources available for the task
- identify source type and context
- separate transcription from interpretation
- extract explicit observations
- record illegibility, incompleteness, or uncertainty at the source level

### Attached workflow

When a task involves close source inspection, the workflow should delegate the detailed handling to [`/workflows/document-analysis.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/document-analysis.md).

### Exit condition

Stage 3 is complete when candidate sources have been converted into structured observations with enough provenance and context to support later comparison.

### Common failure mode

The most damaging error at this stage is premature synthesis: turning extracted details into a conclusion before the observations from all relevant sources have been stabilized.

## Stage 4: Structure Observations and Source Characterizations

### Objective

The objective of Stage 4 is to prepare the evidence for meaningful reasoning by organizing observations together with source-level evaluation.

### Required actions

- associate each observation with its source provenance
- characterize the source using the source evaluation model
- identify which observations appear strong, weak, ambiguous, incomplete, or secondhand
- keep case facts separate from contextual interpretation

### Why this stage is distinct

The workflow must not move directly from raw extraction to claim acceptance. Structured evidence requires both observation capture and source characterization. Without both, later claim evaluation becomes too opaque.

### Exit condition

Stage 4 is complete when the workflow can explain not only what was observed, but what kind of evidentiary weight each observation may plausibly carry.

### Common failure mode

A common failure is storing extracted observations as flat facts with no indication of how they entered the record or what limits apply to their use.

## Stage 5: Build and Compare Claims and Hypotheses

### Objective

The objective of Stage 5 is to translate structured observations into claims, compare those claims across the evidence set, and preserve viable alternative hypotheses where required.

### Required actions

- formulate candidate claims explicitly
- compare supporting and conflicting observations
- evaluate whether records reinforce, weaken, or split identity hypotheses
- keep alternative explanations visible when unresolved
- distinguish strong support from mere compatibility

### Attached workflows

Depending on the task, this stage may delegate to:

- [`/workflows/person-investigation.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/person-investigation.md)
- [`/workflows/record-linking.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/record-linking.md)

### Exit condition

Stage 5 is complete when the workflow has a structured understanding of what is currently supportable, what remains contested, and which hypotheses still require active preservation.

### Common failure mode

The most common error here is collapsing ambiguity too early because one explanation appears cleaner than the alternatives.

## Stage 6: Decide, Defer, or Escalate

### Objective

The objective of Stage 6 is to determine the correct research state after comparison. Not every investigation should end with a definitive conclusion. Some should end with a bounded partial conclusion, a conflict record, or a next-step plan.

### Possible outcomes

- `decide`: evidence currently supports a bounded conclusion
- `defer`: evidence supports only a partial or tentative conclusion
- `escalate`: the problem should move into conflict handling, broader comparison, or future research planning

### Required actions

- determine whether the current decision threshold has been met
- identify unresolved contradictions
- decide whether additional local analysis is likely to change the result
- shift to planning when the next useful step is external to the current evidence set

### Escalation triggers

Escalation is appropriate when:

- major contradictions remain unresolved
- evidence is too sparse for honest closure
- source quality is too uneven to support a stable conclusion
- the next discriminating evidence must come from a new source class or jurisdiction

### Exit condition

Stage 6 is complete when the workflow has identified the correct disposition of the current problem state and the reasoning for that disposition is explicit.

### Common failure mode

The central failure at this stage is false completion: presenting a polished summary as though the research question were settled when the evidence actually demands deferral or escalation.

## Stage 7: Produce Outputs and Update Research Memory

### Objective

The objective of Stage 7 is to convert the current research state into durable, reviewable outputs and to preserve the outcome for future continuation.

### Required outputs

Depending on the task state, outputs may include:

- a research report
- a person summary
- a conflict record
- a timeline
- a research plan

### Required actions

- express conclusions and limits explicitly
- preserve source and claim context needed for future review
- document unresolved questions
- record next steps where appropriate
- update research memory so later work can resume without hidden assumptions

### Attached artifacts

Relevant output artifacts include:

- [`/templates/research-report.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/templates/research-report.md)
- [`/templates/research-plan.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/templates/research-plan.md)
- [`/workflows/research-memory.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/research-memory.md)

### Exit condition

Stage 7 is complete when another qualified researcher or agent could review the outcome, understand how it was reached, and continue the work without reconstructing hidden context.

### Common failure mode

The most common failure is output polishing that strips away uncertainty, provenance, or the rationale for future steps.

## Workflow State Transitions

The workflow is not strictly linear in practice. It should support disciplined looping.

### Typical loops

- Stage 3 to Stage 2 when newly seen records suggest a better source strategy
- Stage 5 to Stage 3 when a comparison reveals the need for additional extraction or closer reading
- Stage 6 to Stage 2 when escalation requires a new source class or jurisdiction
- Stage 7 to Stage 1 when a completed partial conclusion reframes the next research question

### Rule for loops

Loops must remain explicit. The workflow should never appear linear in documentation while behaving recursively in hidden ways.

## Workflow Entry Conditions

The workflow may begin at different points depending on the task context, but the following entry conditions should be understood:

- If the task starts with an unstructured question, begin at Stage 1.
- If the task starts with already-collected records but unclear conclusions, begin at Stage 3 or Stage 4.
- If the task starts with a contradiction between established claims, begin at Stage 5 or Stage 6.
- If the task starts with a stalled problem and no immediate new evidence, begin at Stage 2 or Stage 6 depending on whether strategy or disposition is the main issue.

Even when entering midstream, the workflow should restore enough earlier context to keep later reasoning valid.

## Workflow Completion Criteria

The workflow should be considered complete for a given task state only when:

- the current research question has been framed clearly
- relevant sources have been analyzed or intentionally deferred
- the evidentiary posture of those sources is visible
- claims and alternatives have been compared explicitly
- the final state has been classified as decision, deferral, or escalation
- output artifacts preserve enough context for future review or continuation

Completion does not require total resolution. It requires responsible characterization of the current research state.

## Minimum Preservation Requirements

At the end of any meaningful workflow run, the following should remain recoverable:

- the active research question
- the assumptions present at the start
- the sources reviewed
- the main observations extracted
- the claims considered
- the key contradictions or limitations
- the disposition reached
- the next useful action, if any

If these cannot be reconstructed, the workflow has not preserved research continuity.

## Anti-Patterns

The following patterns are workflow violations:

- moving from raw record exposure directly to narrative conclusion
- searching widely without clarifying the question
- comparing conclusions without comparing their underlying observations
- hiding ambiguity because the output format prefers decisiveness
- declaring completion because no immediate source is available, without reframing the problem
- preserving conclusions while failing to preserve why they were reached

These failures are operational, not merely stylistic.

## Implications for AI Agents

AI systems often compress research into answer generation. This workflow is designed to prevent that compression.

A framework-compliant agent should therefore:

- remain stage-aware
- avoid premature synthesis
- preserve explicit transitions between extraction, evaluation, comparison, and conclusion
- shift to planning rather than speculation when evidence is insufficient
- produce outputs that retain the structure of the research process

An agent that cannot represent where it is in the workflow will struggle to maintain methodological integrity over time.

## TODO Checklist

- [ ] Add a formal workflow state model suitable for machine-readable orchestration.
- [ ] Add explicit handoff rules between the core workflow and specialized sub-workflows.
- [ ] Add worked examples of complete research runs ending in decision, deferral, and escalation respectively.
- [ ] Add guidance for collaborative review checkpoints in human-in-the-loop execution.

## Future Improvements

The next major improvement for this workflow should be a more formal state model with explicit transition contracts. That will make it easier to implement the workflow consistently across agent runtimes without reducing it to a brittle linear script.

This document would also benefit from example runs that show how the same workflow behaves under different evidence conditions. A strong direct-evidence case, a conflicting-identity case, and a research-planning case would each demonstrate a different form of legitimate completion and help prevent overfitting the workflow to only one kind of genealogical problem.

## References

- [`/Project Instructions.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/Project%20Instructions.md)
- [`/knowledge/research-principles.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/research-principles.md)
- [`/knowledge/source-evaluation.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/knowledge/source-evaluation.md)
- [`/specs/agent-contracts.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/specs/agent-contracts.md)
- [`/workflows/document-analysis.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/document-analysis.md)
- [`/workflows/person-investigation.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/person-investigation.md)
- [`/workflows/record-linking.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/record-linking.md)
- [`/workflows/research-memory.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/workflows/research-memory.md)
- [`/templates/research-report.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/templates/research-report.md)
- [`/templates/research-plan.md`](/Users/ludvigrogestam/Documents/Codex/ai-sl-ktforskning/templates/research-plan.md)
