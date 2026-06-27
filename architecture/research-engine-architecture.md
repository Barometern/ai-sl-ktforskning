---
title: Research Engine and Archive Discovery Engine Architecture
purpose: >
  Define the architecture for the two major new subsystems that will enable an AI
  agent to conduct autonomous, evidence-based genealogy research against real
  archival sources.
scope: >
  Component responsibilities, communication contracts, information flows, the
  provider abstraction model, agent decision-making policies, caching, provenance,
  audit logging, confidence propagation, failure handling, rate limiting,
  authentication, extensibility, and a staged implementation roadmap.
audience:
  - Maintainers
  - Framework implementers
  - Archive integration authors
  - AI systems engineers
  - Genealogy domain specialists
dependencies:
  - /architecture/system-overview.md
  - /architecture/module-boundaries.md
  - /architecture/extensibility-model.md
  - /specs/claim-model.md
  - /specs/confidence-model.md
  - /specs/conflict-resolution.md
  - /specs/agent-contracts.md
  - /knowledge/evidence-model.md
  - /knowledge/source-evaluation.md
  - /knowledge/research-principles.md
  - /workflows/research-workflow.md
related_documents:
  - /specs/decision-trees.md
  - /workflows/person-investigation.md
  - /workflows/research-memory.md
  - /templates/research-plan.md
  - /templates/research-report.md
  - /ROADMAP.md
status: proposal
maintainer: Genealogy AI Framework Maintainers
revision_history:
  - version: 0.1.0
    date: 2026-06-27
    summary: >
      Initial architecture proposal for the Research Engine and Archive Discovery
      Engine, developed in response to the autonomous research workflow design task.
---

# Research Engine and Archive Discovery Engine Architecture

## Purpose

This document designs the two major new subsystems required to enable an AI agent
to conduct autonomous, evidence-based genealogy research:

- the **Research Engine**, which orchestrates the full research loop from question
  framing through report production
- the **Archive Discovery Engine**, which locates, retrieves, and normalises archival
  records from multiple interchangeable providers

These two engines together implement the ten-step autonomous research workflow:

1. Read the existing genealogy
2. Identify unsupported or weakly supported claims
3. Determine which records should be consulted next
4. Discover where those records exist
5. Retrieve those records from supported archives
6. Read the documents (OCR / handwriting recognition where required)
7. Extract structured genealogical information
8. Evaluate evidence using the framework
9. Update hypotheses and claims
10. Produce a fully sourced research report

Both engines must integrate with the existing framework's canonical models — the
claim model, evidence model, confidence model, conflict resolution specification,
and source evaluation guidelines — without redefining or duplicating them.

## Scope

This document defines:

- the major components of each engine
- their responsibilities and what they must not own
- the contracts that connect them
- the information that flows across those contracts
- what is provider-independent and what is provider-specific
- how the agent selects sources, stops searching, and escalates conflicts
- caching, provenance, reproducibility, audit logging, confidence propagation,
  extensibility, failure handling, rate limiting, and authentication
- a challenge of one existing assumption in the repository
- a staged implementation roadmap beginning with the smallest possible
  proof-of-concept

This document does not define machine-readable schemas, API signatures in any
programming language, or internal implementation details of any component. Those
concerns belong to the implementation milestones.

---

## Relationship to the Existing Layered Architecture

The existing system overview defines five layers: Knowledge, Reasoning, Workflow,
Prompt Interface, and Runtime. The two new engines inhabit the Runtime layer. They
consume everything above them but must not be referenced by any layer above Runtime.

```
┌─────────────────────────────────────────────────────────────────┐
│ Knowledge         record types, geography, naming, source rules │
├─────────────────────────────────────────────────────────────────┤
│ Reasoning         claim model, confidence, conflict resolution  │
├─────────────────────────────────────────────────────────────────┤
│ Workflow          research workflow, person investigation, etc.  │
├─────────────────────────────────────────────────────────────────┤
│ Prompt Interface  analyze-document, compare-sources, etc.       │
├─────────────────────────────────────────────────────────────────┤
│ Runtime                                                         │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │ Research Engine                                           │  │
│  │  ├─ Research Planner                                      │  │
│  │  ├─ Hypothesis Manager                                    │  │
│  │  ├─ Evidence Synthesiser                                  │  │
│  │  ├─ Stopping Oracle                                       │  │
│  │  └─ Report Generator                                      │  │
│  ├───────────────────────────────────────────────────────────┤  │
│  │ Archive Discovery Engine                                  │  │
│  │  ├─ Record Type Registry                                  │  │
│  │  ├─ Search Planner                                        │  │
│  │  ├─ Provider Registry                                     │  │
│  │  ├─ Query Router                                          │  │
│  │  └─ Document Processing Pipeline                          │  │
│  ├───────────────────────────────────────────────────────────┤  │
│  │ Provider Adapters (one per archive)                       │  │
│  │  ├─ Riksarkivet Adapter                                   │  │
│  │  ├─ ArkivDigital Adapter                                  │  │
│  │  ├─ FamilySearch Adapter                                  │  │
│  │  ├─ User Upload Adapter                                   │  │
│  │  └─ GEDCOM Adapter                                        │  │
│  ├───────────────────────────────────────────────────────────┤  │
│  │ Cross-cutting Runtime Services                            │  │
│  │  ├─ Research Session Store                                │  │
│  │  ├─ Cache Layer                                           │  │
│  │  ├─ Audit Log                                             │  │
│  │  └─ Credential Store                                      │  │
│  └───────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
```

The integration rule of the existing architecture — lower layers must not depend on
higher layers — continues to apply. Provider Adapters do not know about claims or
confidence. The Document Processing Pipeline does not know about research plans.
The Archive Discovery Engine knows about record types and queries but not about
hypothesis management. Only the Research Engine has access to all layers.

---

## The Research Engine

### Purpose

The Research Engine is the orchestrator of the full autonomous research loop. It is
the only component that has a complete view of the research session. It is the
component that reads the genealogy, forms research goals, directs the Archive
Discovery Engine, receives processed evidence, evaluates it against the existing
framework models, updates claims, and decides when to stop.

The Research Engine is **not** an AI model. It is a structured orchestration layer
that invokes AI capabilities at defined, bounded steps.

### Component: Research Planner

The Research Planner takes the current research session state — the GEDCOM or claim
graph, the set of existing claims with their confidence levels, and the research
question — and produces an ordered research plan.

**Responsibilities:**

- Parse the incoming genealogy (from GEDCOM ingestion or the internal claim graph)
  into the framework's claim model
- Identify weakly supported claims: claims at `possible`, `unresolved`, or `probable`
  confidence that have not been confirmed by a primary source close to the event
- Identify absent claims: life events for which no claim has been formed at all,
  making them implicit gaps rather than explicit unsupported assertions
- Classify unsupported claims by type (identity, event, relationship, attribute)
  and by the confidence threshold currently required to consider them resolved
- Produce a prioritised list of research goals: each goal names the claim or gap to
  be addressed, the target confidence threshold, and the record classes most likely
  to address it
- Rank goals by dependency order; a birthplace claim must be pursued before a
  parentage claim that depends on knowing which parish to search

**Must not own:** knowledge of which specific archives hold which record series (that
belongs to the Archive Discovery Engine). Must not own source evaluation criteria
(that belongs to `knowledge/source-evaluation.md`).

**Output to:** Hypothesis Manager (with initial hypothesis set), Query Router via
Search Planner (with the first set of record-class requests).

### Component: Hypothesis Manager

The Hypothesis Manager maintains the live set of active hypotheses and formal claims
throughout the research session. It directly instantiates the claim lifecycle defined
in `specs/claim-model.md`.

**Responsibilities:**

- Hold all active claims and their confidence levels, support structures, and
  competing alternatives
- Accept new or revised claims from the Evidence Synthesiser
- Maintain competing identity hypotheses when two candidates for the same person
  cannot yet be differentiated
- Track which claims depend on which other claims, so that an update to an identity
  claim propagates downstream to all relationship and event claims that rest on it
- Detect when a newly formed claim conflicts with an existing active claim, and
  produce a conflict notification that triggers the conflict resolution specification
- Record the history of every claim revision, including the reason and the triggering
  evidence, so that the audit log can reconstruct the research trajectory

**Must not own:** the rules for evaluating whether evidence is sufficient (those are
in the confidence model and source evaluation). Must not own search strategy (that is
the Research Planner and Search Planner's responsibility).

**Output to:** Evidence Synthesiser (receives processed evidence), Stopping Oracle
(provides current claim state for evaluation), Report Generator (provides the final
claim set), Research Session Store (provides snapshots for persistence).

### Component: Evidence Synthesiser

The Evidence Synthesiser receives structured observations extracted from retrieved
and processed documents, integrates them into the evidence graph defined in
`knowledge/evidence-model.md`, evaluates the source using `knowledge/source-evaluation.md`,
and determines whether a new or revised claim can be formed.

**Responsibilities:**

- Accept a set of extracted observations together with the provenance record that
  identifies the source, the provider, the extraction method, and the extraction
  timestamp
- Characterise the source using the source evaluation dimensions: original vs.
  derivative status, proximity to the event, informant quality, completeness,
  legibility, and distortion risk
- Build or update support edges and conflict edges in the evidence graph
- Form or revise claims according to the claim formation sequence in the claim model
- Assign a confidence level to each new or revised claim using the confidence model
- Carry OCR or handwriting recognition confidence as a distinct dimension of source
  characterisation, not conflating it with informant quality or event proximity
- Report to the Hypothesis Manager with the resulting claim update set

**Must not own:** the rules about which archive to search next (that is the Search
Planner). Must not own the stopping decision (that is the Stopping Oracle).

**Output to:** Hypothesis Manager (with claim updates), Audit Log (with evidence
events).

### Component: Stopping Oracle

The Stopping Oracle evaluates the current state of the Hypothesis Manager and
determines whether the research session should continue, defer to a future session,
or escalate.

The Stopping Oracle is the most consequential decision point in the autonomous
research loop. A system that stops too early produces false confidence. A system that
never stops is operationally useless and potentially abusive of provider resources.

**Stopping conditions — the oracle returns STOP when:**

- All claims in the research plan have reached their target confidence threshold
  (established or probable, depending on what was requested)
- All record classes identified in the research plan for the person's jurisdiction
  and period have been searched and either retrieved or confirmed as non-existent
- The set of discriminating records that could resolve remaining open questions is
  known to be inaccessible (access restrictions, known gaps in the archive, destroyed
  records), and no alternative record class can substitute
- A maximum iteration bound set in the session configuration has been reached,
  regardless of claim completeness — this is a fail-safe, not a research judgement

**Deferral conditions — the oracle returns DEFER when:**

- The archive provider is temporarily unavailable and the research question cannot
  be answered with currently available sources alone
- The session has consumed its allowed resource budget but meaningful progress has
  been made
- A claim gap has been identified that requires a record class unavailable through
  any registered provider, but the gap is documented for future research

**Escalation conditions — the oracle returns ESCALATE when:**

- Two or more active claims are in direct contradiction and no available record has
  resolved the conflict
- Multiple plausible identity candidates remain for the same person and no
  discriminating evidence has been located
- The agent has looped through its search plan without producing new observations
  twice in succession — this is a brick-wall condition
- A claim dependency chain has collapsed because an upstream identity claim has been
  downgraded to `unresolved`, invalidating a cluster of downstream conclusions

**Must not own:** the specific record types to search (Archive Discovery Engine).
Must not own the claim confidence rules (confidence model). Must not call archive
providers directly.

**Output to:** Research Planner (to revise the research plan on DEFER or ESCALATE),
Report Generator (to finalise on STOP), Audit Log (with decision and reason).

### Component: Report Generator

The Report Generator converts the final research session state into the output
artifacts defined in the existing templates, specifically `templates/research-report.md`
and `templates/person-summary.md`.

**Responsibilities:**

- Produce a report that expresses all active claims with their confidence levels,
  source references, and reasoning summaries
- Express claims using hedged language consistent with confidence levels: established
  claims warrant declarative language; probable claims warrant hedged language;
  possible and unresolved claims must be presented as open questions
- Include the conflict record for any unresolved contradictions
- Include the research plan remainder if the session deferred or escalated
- Preserve source provenance in a form that allows a reader to locate the original
  document independently
- Produce a machine-readable output alongside the human-readable report

**Must not own:** claim evaluation logic (that is already done by the time this
component is invoked). Must not silently omit uncertainty to produce a cleaner
narrative.

---

## The Archive Discovery Engine

### Purpose

The Archive Discovery Engine is the layer that translates abstract research needs
— "find a baptism record for a person approximately born 1740–1760 in the Swedish
province of Dalarna" — into concrete queries against real archival providers. It
knows the landscape of records: what types exist, in which jurisdictions, in which
archives, and through which providers those archives are accessible.

The Archive Discovery Engine must never become a thin wrapper around a single
provider's API. Its value lies precisely in the abstraction it provides between the
Research Engine's record-class thinking and any provider's proprietary query model.

### Component: Record Type Registry

The Record Type Registry is the bridge between the Knowledge layer and the Runtime
layer. It holds the taxonomy of genealogically relevant record types, organised by:

- record class (vital registration, household, migration, probate, military, church
  discipline, etc.)
- jurisdiction (country, region, administrative unit, parish, estate)
- approximate temporal coverage
- typical information content and known limitations
- the source evaluation profile appropriate for records of this type

This information is derived from — and must remain consistent with — the knowledge
modules in `knowledge/record-types.md` and `knowledge/swedish-genealogy.md`, and
with any future country knowledge packs.

**The Record Type Registry must be treated as a knowledge asset, not hard-coded
into runtime logic.** When a new country module is added, its record type coverage
should extend this registry without touching the search or routing components.

**Responsibilities:**

- Answer the question: given a person's approximate period and jurisdiction, which
  record classes are most likely to contain relevant information?
- Rank record classes by their expected evidentiary value for the specific claim
  type being pursued (a birth event requires a different record class than a
  migration event)
- Flag record classes with known gaps or destruction events within the relevant
  jurisdiction and period (for example, record losses in a particular parish or
  region)
- Map record classes to the providers that hold them, using the Provider Registry
  as the authority on which providers hold which collections

**Must not own:** provider-specific query syntax or access mechanics. Must not own
the research plan logic.

### Component: Search Planner

The Search Planner translates a research goal from the Research Engine — a claim type
to pursue, a person's identifying attributes, a jurisdiction, and a period — into one
or more concrete search requests directed at specific providers.

**Responsibilities:**

- Consult the Record Type Registry to identify which record classes address the
  research goal
- For each relevant record class, consult the Provider Registry to identify which
  providers hold it
- Construct provider-specific search requests, adapting the abstract query (person
  name, approximate year, parish) to each provider's supported query model
- Manage search history within the session: do not issue a query that has already
  been executed with identical or semantically equivalent parameters in the current
  session
- Prioritise providers by data coverage, access cost, reliability, and the session's
  provider preference configuration
- Return a search plan to the Query Router, not search results

**Must not own:** the evaluation of what was found (Evidence Synthesiser's
responsibility). Must not define record type coverage (Record Type Registry's
responsibility).

### Component: Provider Registry

The Provider Registry is a catalogue of known archive providers with their
capabilities, constraints, and operational characteristics.

For each provider, the registry knows:

- which record collections it holds, expressed as record type + jurisdiction +
  period triples
- which authentication mode it requires (none, API key, OAuth2, user-delegated)
- its rate limit policy (requests per minute, per day, per session)
- whether it supports search, direct retrieval, or both
- whether its images require OCR (scanned originals) or whether machine-readable
  transcriptions are available
- its reliability history (maintained at runtime, not in the registry schema)

The Provider Registry is itself extensible. Adding a new provider means registering
it here. No other component changes.

**Must not own:** provider-specific query logic (the adapters own that). Must not
own the research plan.

### Component: Query Router

The Query Router receives a search plan from the Search Planner and dispatches
individual search requests to the appropriate provider adapters. It coordinates
parallel queries across providers when the search plan warrants it, enforces
rate limits per provider, and handles provider-level errors without surfacing them
to the Research Engine as fatal failures.

**Responsibilities:**

- Dispatch search requests to the correct adapter using the provider registry as the
  directory
- Enforce per-provider rate limits using the token bucket or leaky bucket pattern,
  queuing requests that exceed current limits rather than dropping them
- Execute queries in parallel when multiple providers are to be searched for the
  same record class, subject to concurrency limits set in session configuration
- Normalise the results from each provider into the framework's standard Retrieved
  Document envelope before returning them
- Distinguish between transient failures (network timeout, rate limit hit) and
  permanent failures (access denied, record class not available from this provider)
- Return a result set to the Document Processing Pipeline for those results that
  require OCR or structured extraction

**Must not own:** the content extraction logic (Document Processing Pipeline). Must
not own the decision about whether results are sufficient (Evidence Synthesiser and
Stopping Oracle).

### Component: Document Processing Pipeline

The Document Processing Pipeline converts a Retrieved Document — which may be a
scanned image, a handwritten manuscript image, a machine-readable text file, a
structured XML record, or a GEDCOM fragment — into a set of structured Observations
in the format required by the Evidence Synthesiser.

**Responsibilities:**

- Detect the format of the incoming document
- Apply the appropriate processing path:
  - printed or typed text images → standard OCR
  - historical handwriting images → handwriting recognition (HTR)
  - structured XML or JSON records from provider APIs → field extraction without OCR
  - GEDCOM files → GEDCOM parser and claim mapper
  - user-uploaded documents → format detection and routing to the correct path
- Assign an extraction confidence value to each extracted observation, reflecting
  the legibility of the source, the quality of the recognition, and any ambiguities
  in the extracted text
- Attach the pipeline version (OCR engine, HTR model, extraction rules version) to
  the provenance envelope of every output, so that results can be reprocessed if the
  pipeline improves
- Preserve the original document reference alongside the extracted observations
- Pass structured Observations and their full provenance envelopes to the Evidence
  Synthesiser

**Must not own:** claim formation (Evidence Synthesiser). Must not own source
evaluation (that uses the output of this pipeline but is a separate reasoning step).

---

## Provider Adapters

### The Provider Interface

Every archive provider — whether a national archive API, a subscription genealogy
service, a user upload endpoint, or a GEDCOM file — must be accessed through a
provider adapter that implements the same abstract interface. This is the enforcement
point for provider independence.

The interface has three responsibilities:

**Search:** accept an abstract search request (person attributes, record class,
jurisdiction, period) and return a list of candidate record references. The search
logic is provider-specific. The input and output format is not.

**Fetch:** accept a record reference and return a Retrieved Document with a
provenance envelope. The retrieval mechanism is provider-specific. The envelope
format is not.

**Describe capabilities:** return a structured declaration of which record classes
the provider holds, what authentication it requires, and what its operational
constraints are. This feeds the Provider Registry at startup or refresh time.

Adapters are the only components permitted to contain provider-specific logic.
No other component may import, reference, or embed provider-specific behaviour.

### What is Provider-Independent

The following must remain identical regardless of which provider is in use:

- the search request model (the abstract query that every provider receives)
- the retrieved document envelope (the normalised wrapper every provider must return)
- the observation model (the structured output every provider's documents ultimately
  produce)
- the provenance envelope schema (every observation must carry provider, collection,
  record identifier, page or image reference, retrieval timestamp, and pipeline version)
- the record type taxonomy in the Record Type Registry
- the session and caching model
- all claim, evidence, confidence, and conflict resolution logic

### What is Provider-Specific

The following belongs exclusively inside a provider adapter:

- the HTTP client configuration, URL templates, pagination logic, and API version
  management
- the authentication flow (OAuth2 token exchange, API key injection, session cookie
  management)
- the mapping from the abstract search request to the provider's query parameters
- the mapping from the provider's response format to the standard retrieved document
  envelope
- the rate limit configuration specific to this provider's terms of service
- the handling of provider-specific error codes
- any provider-specific quirks, known bugs, or workaround logic

### Current and Planned Provider Adapters

**Riksarkivet Adapter:** Swedish national archive. Provides access to parish records,
court records, military records, estate inventories, migration records, and more.
The open parts of the API are unauthenticated. Full image access may require
institutional or personal authentication.

**ArkivDigital Adapter:** Swedish subscription genealogy service. Requires
user-delegated OAuth2 authentication. Provides indexed and image access to Swedish
church records with good parish record coverage.

**FamilySearch Adapter:** International. OAuth2 authenticated. Rich index and image
collection. Provides a Persons API that can supply structured data alongside images,
which changes the Document Processing path: the structured API response bypasses OCR.

**User Upload Adapter:** Accepts files uploaded by the user (images, PDFs,
handwritten scans). Routes to the Document Processing Pipeline for OCR or HTR.
No search capability — only fetch (the reference is the uploaded file identifier).

**GEDCOM Adapter:** Accepts a GEDCOM file. Parses it using a GEDCOM-aware parser and
maps the resulting person, event, and family records to the framework's claim model.
GEDCOM-derived claims must be marked as claims sourced from a compiled genealogy, not
from primary records, with an appropriate source evaluation noting their compiled
status and reduced evidentiary weight for any claims they support.

**Future providers:** Any archive or genealogy service can be added by implementing
the provider adapter interface and registering the adapter with the Provider Registry.
No other component changes.

---

## Agent Decision-Making

This section describes the policies that govern the autonomous agent's choices during
the research loop.

### How the agent selects which source to search

Source selection is not a free-form choice. It follows a structured hierarchy:

1. The Research Planner identifies the weakest or most absent claims
2. The Record Type Registry maps each claim type to the most evidentiary-valuable
   record classes for the person's jurisdiction and period
3. The Record Type Registry ranks those record classes by event proximity and
   original-versus-derivative status
4. The Provider Registry maps record classes to available providers
5. The Search Planner filters out record classes already searched in this session
   without new results
6. Among remaining candidates, the agent prioritises record classes that are closest
   to the event, most likely to contain discriminating detail, and available through
   a reliable provider

**The agent must not substitute easy-to-search records for methodologically superior
records merely because the superior records require more effort to retrieve.** This
principle is derived from the source evaluation model in `knowledge/source-evaluation.md`
and must be enforced at the Search Planner level.

### How the agent selects which record series to consult

Within a record class, the agent selects the specific series using jurisdiction and
period parameters. For Swedish genealogy this means knowing which husförhörslängder
cover which parishes in which years, which emigration records are held centrally
versus locally, and so on. This judgment lives in the Record Type Registry (the
taxonomy) and in the country knowledge module (the domain detail).

The agent should prefer the most direct series within a class: original registers
over microfilm copies, microfilm over card-indexed transcriptions, card-indexed
transcriptions over published genealogies. This preference order reflects the
source evaluation model's hierarchy of original versus derivative sources.

### When to stop searching

The Stopping Oracle's conditions are described above. The key principle is: **the
agent stops when it has an honest characterisation of the research state, not when
it has produced a polished narrative.** Stopping at a `probable` claim with one
strong primary source and documented gaps is a legitimate research outcome. Stopping
by inventing closure that the evidence does not support is a research integrity
failure.

The agent must not continue searching indefinitely in the hope that one more record
will resolve a genuinely irresolvable conflict. The brick-wall condition (two
consecutive search plan iterations with no new observations) is a concrete signal
that continued searching without strategy revision is unlikely to be productive.

### When evidence is sufficient

Evidence sufficiency is governed by the confidence model and the research goal set by
the Research Planner. The agent treats evidence as sufficient for a given claim when:

- the claim has reached its target confidence level (typically `established` for
  identity claims and core life events, `probable` for supporting detail)
- the supporting evidence includes at least one source that is an original record
  close to the event, or multiple independent sources that are consistent
- no unresolved conflict edge exists against the claim in the evidence graph
- the record classes most likely to contain discriminating alternative evidence have
  been consulted and either corroborate the claim or have been confirmed as
  unavailable

### When conflicting evidence requires additional research

The conflict resolution specification governs the classification and resolution
policy. The agent's decision to seek additional records in response to conflict should
follow this policy:

- a direct factual contradiction between two sources of comparable quality demands
  a third source to adjudicate, if one exists in the record type taxonomy
- an identity conflict between two candidate persons demands a discriminating record
  (one with detail that only one candidate could plausibly match) rather than simply
  more records of the same type already consulted
- an absence conflict (expected record is missing) demands a search for an
  administrative substitute record in the same jurisdiction and period before the
  absence is treated as evidence
- a conflict that cannot be resolved with available records must be preserved as a
  formal conflict record, not synthesised away, and the research state must be
  classified as ESCALATE rather than STOP

---

## Cross-Cutting Runtime Services

### Research Session Store

A research session is the durable unit of work in the Research Engine. It must be
persisted so that it can be resumed after failure, human review, or resource
exhaustion.

A session record contains:

- the initial research question and the GEDCOM or claim graph provided at session
  start
- the research plan as produced by the Research Planner
- the current state of all active claims and hypotheses in the Hypothesis Manager
- the full evidence graph including support edges, conflict edges, and provenance
- the search history (all queries issued, timestamps, results received)
- all audit log entries for the session
- the current stopping state (running, deferred, escalated, completed)
- the session configuration (provider preferences, resource budget, target confidence
  thresholds, maximum iteration bound)

Sessions must be immutable in their history: appending new events is permitted;
overwriting prior state is not. This is what makes the session store an audit surface
rather than merely a cache.

### Cache Layer

The cache layer exists to prevent redundant archive queries, redundant document
retrievals, and redundant OCR processing. It operates at three distinct levels:

**Search result cache:** keyed by provider identifier + query hash. TTL should be
short (hours to days, configurable per provider) because archives add new records
over time and search indices are updated. Cache hits must be labelled as such in the
provenance envelope.

**Raw document cache:** keyed by the provider-specific document identifier plus a
content hash. Archival documents are immutable once created; this cache may have a
long TTL (weeks to months). A retrieved document from cache is indistinguishable in
provenance from a fresh retrieval — the timestamp records when the document was
originally fetched, not when it was served from cache.

**Extraction cache:** keyed by the content hash of the raw document plus the version
of the Document Processing Pipeline that produced the extraction. OCR and HTR outputs
change when pipeline versions change; the version must be part of the cache key. If
a newer pipeline version becomes available, the extraction cache for older versions
is deliberately stale and should be reprocessed.

The cache must record the provenance of every hit: when the original fetch occurred,
from which provider, and which pipeline version processed it. Cache hits must not be
presented as fresh retrievals in audit logs.

### Provenance

Every observation produced by the Document Processing Pipeline must carry a complete
provenance envelope. This envelope is the machine-readable implementation of the
source characterisation required by `knowledge/evidence-model.md`. It must contain:

- the provider identifier
- the collection or archive series identifier
- the document or record identifier within that collection
- the page, folio, or image reference within the document
- the retrieval timestamp (when this document was fetched from the provider)
- the cache status (live fetch or cache hit, and if cache hit, the original fetch
  timestamp)
- the Document Processing Pipeline identifier and version
- the extraction confidence value for this observation
- the source evaluation dimensions as characterised by the Evidence Synthesiser

Provenance is not a metadata annotation appended as an afterthought. It is a
first-class field on every observation, claim, and report output. Any output that
cannot be traced to its provenance envelope does not meet the framework's evidence
standards.

### Reproducibility

A research session must be reproducible in the sense that, given the same session
configuration, the same provider responses, and the same pipeline versions, it
should produce the same claims, the same confidence levels, and the same report.

Reproducibility does not require that live archive queries return the same results
over time — archives change. It requires that the session record contains enough
information for an independent reviewer to understand exactly what was retrieved,
processed, and concluded, and to rerun the analysis on the cached documents if needed.

This means:
- every query and its full response must be logged
- every document fetch must result in a cached copy
- every pipeline run must record the version of every model and rule set used
- every claim update must record the reason and the evidence event that triggered it

### Audit Log

The audit log records every significant event in the research session as an
append-only, timestamped sequence. It is the instrument of accountability, not just
debugging.

Events that must be logged:

- session start, with the initial configuration and research question
- every search query issued, with provider, query parameters, and result count
- every document fetch, with provider, document identifier, and cache status
- every pipeline run, with pipeline version and extraction confidence summary
- every claim formation or revision, with the triggering evidence event and the
  prior and new claim state
- every conflict detection, with the competing claims and the conflict edge
- every stopping oracle evaluation, with the current claim state summary and the
  decision reached
- every provider authentication event (but not credential values)
- every provider error, with classification (transient or permanent)
- session end, with final state and output artifact identifiers

The audit log must never contain credential values, personal data beyond what is
already in the research subject's claim graph, or information that would allow
reconstruction of a provider's authentication tokens.

### Confidence Propagation

The existing confidence model defines claim-level confidence. The new system
introduces additional sources of uncertainty that must propagate correctly:

**Extraction confidence** from the Document Processing Pipeline measures how reliably
the text was read from the document. Low extraction confidence should lower the
information quality characterisation of the source in the Evidence Synthesiser's
source evaluation, which in turn constrains the maximum claim confidence that can
rest on that source.

A scanned image with 60% OCR confidence cannot serve as a primary source for an
`established` claim without corroboration. The Evidence Synthesiser must enforce
this constraint.

**Identity assumption confidence** arises when the Search Planner constructs a query
using a person's attributes that are themselves only `probable`. If the query
attributes are uncertain, the search results are potentially contaminated by that
uncertainty. Retrieved records found under a `probable` identity should be noted as
contingent on that upstream claim.

**Provider reliability confidence** arises from the Provider Registry's operational
history. A provider with a known history of transcription errors in a particular
collection should lower the effective evidentiary weight of results from that
collection, even when the OCR confidence is high.

None of these additional uncertainty sources replace the core confidence model.
They feed into it through the source evaluation step.

### Failure Handling

The system must degrade gracefully rather than halt.

**Transient provider failures** (network timeout, rate limit exceeded, service
temporarily unavailable) must be retried with exponential backoff up to a configured
maximum. If retries are exhausted, the provider is marked temporarily unavailable
for this session and the query is re-routed to an alternative provider if one exists.

**Permanent provider failures** (access denied, collection not available, record
not found) are not retried. They are logged and the search plan is updated to mark
this provider and collection as unavailable for the current goal. The Stopping Oracle
accounts for permanent unavailability when assessing whether the record class can
ever be fulfilled.

**Pipeline failures** (OCR engine crash, model unavailable) cause the affected
document to be placed in a pending queue and the session to continue with other
available documents. The pending queue is persisted so that failed extractions can
be retried when the pipeline recovers.

**Session failures** (agent crash, infrastructure fault) are recoverable because the
session store is durable and append-only. On restart, the session replays from its
last consistent checkpoint. The audit log identifies the interruption point.

No failure should result in a silent incorrect claim. Any uncertainty introduced by
a failure must either propagate as lower extraction confidence or be represented as
an incomplete result in the evidence graph.

### Rate Limiting

The Query Router enforces per-provider rate limits based on the Provider Registry's
configuration of each provider's terms of service.

Rate limiting must be managed through a token bucket or leaky bucket per provider,
shared across all concurrent sessions if the system supports multi-session execution.
This is important because FamilySearch and ArkivDigital impose rate limits per
authenticated user or per API key, not per session.

When a rate limit is hit, the Query Router queues the request rather than failing it.
The Stopping Oracle's maximum iteration bound must account for queuing delays; a
session that is waiting for a rate limit window to open is not a broken session, and
its iteration bound should not consume iterations during the wait.

The agent must respect provider rate limits even when under research pressure. Archive
providers are shared public infrastructure. Abusive querying is a framework policy
violation, not merely an operational inconvenience.

### Authentication for Providers Requiring User Accounts

Authentication is the responsibility of each provider adapter, not of the framework
core. The Credential Store holds credentials in a form that adapters can access
but that is not accessible to any other component.

**API key authentication** (Riksarkivet open endpoints): the adapter injects the key
into the HTTP request header. The key is read from the Credential Store at adapter
initialisation.

**OAuth2 with client credentials** (service account access): the adapter manages the
token lifecycle, requesting new tokens before expiry. Tokens are stored in the
session credential cache, not in the Credential Store itself.

**OAuth2 with user delegation** (ArkivDigital, FamilySearch): the framework must
support an authentication flow in which a human user authorises access before the
session begins. The resulting OAuth2 token is stored in the session credential cache
and refreshed automatically until expiry. The framework must never ask the user to
re-authenticate in the middle of a running session; if the token expires and cannot
be refreshed, the provider is marked temporarily unavailable and the session continues
with other providers.

**No authentication** (publicly accessible Riksarkivet endpoints): the adapter makes
unauthenticated requests. This must be the default posture assumed for any provider
until authentication requirements are explicitly registered.

Authentication events are logged in the audit log (authentication initiated,
authentication succeeded, authentication failed, token refreshed) but credential
values are never logged.

---

## A Challenge to an Existing Assumption

The repository's current architecture is organised around the research process as
it applies to documents that have already been obtained. The knowledge modules,
reasoning specs, and workflow definitions all assume that sources are available and
that the task is to evaluate them.

**This assumption is incomplete, and it creates a structural gap that will affect
every implementation milestone.**

The framework currently has no model of the archival landscape: no concept of what
records exist, where they are held, whether they are accessible, what their coverage
is, or how to request them. The Archive Discovery Engine proposed here fills that
gap, but it fills it in the Runtime layer with no Knowledge or Reasoning layer
foundation beneath it.

The consequence is that the Record Type Registry, which is conceptually part of the
Knowledge layer, will initially be implemented as part of the Runtime layer because
there is nowhere else for it to live. This is a layering violation that should be
corrected before implementation begins.

**The recommended correction is to add a new Knowledge submodule: `knowledge/archive-landscape.md`.**

This module would define:
- the taxonomy of record classes relevant to genealogical research (building on
  `knowledge/record-types.md` which focuses on what records contain, not where they
  live)
- the concept of archival coverage: which record classes exist in which jurisdictions
  during which periods
- the concept of archival gaps: known record losses, access restrictions, and
  collection boundaries
- the principles for ranking record classes by evidentiary value for a given research
  goal, separated from the question of which specific provider holds them

This module would then be the Knowledge-layer specification against which the
Record Type Registry in the Archive Discovery Engine is implemented. Without it,
the Record Type Registry's content is not governed by any framework principle — it
is merely a database that someone fills in without a documented methodology.

The Archive Landscape module does not need to be complete before the first
implementation milestone begins. But its schema and governing principles should be
sketched before the Record Type Registry is built, so that the implementation is
an expression of the Knowledge layer rather than a deviation from it.

---

## What Should Remain Provider-Independent (Summary)

| Concern | Where it lives |
| --- | --- |
| Record class taxonomy | `knowledge/record-types.md` + new `knowledge/archive-landscape.md` |
| Archival coverage and gap knowledge | `knowledge/archive-landscape.md` |
| Record ranking by evidentiary value | `knowledge/archive-landscape.md` + `knowledge/source-evaluation.md` |
| Abstract search request model | Archive Discovery Engine — provider-independent interface |
| Observation and provenance envelope | Archive Discovery Engine → Evidence Synthesiser interface |
| Claim formation and lifecycle | `specs/claim-model.md` |
| Source evaluation | `knowledge/source-evaluation.md` |
| Confidence assignment | `specs/confidence-model.md` |
| Conflict classification and resolution | `specs/conflict-resolution.md` |
| Stopping criteria | Research Engine — Stopping Oracle |
| Session persistence model | Cross-cutting Runtime Services |
| Audit log schema | Cross-cutting Runtime Services |
| Report output format | `templates/research-report.md`, `templates/person-summary.md` |

## What Is Provider-Specific (Summary)

| Concern | Where it lives |
| --- | --- |
| HTTP client, URL patterns, pagination | Provider Adapter (per provider) |
| Authentication flow | Provider Adapter (per provider) |
| Query parameter mapping | Provider Adapter (per provider) |
| Response format mapping | Provider Adapter (per provider) |
| Rate limit configuration | Provider Registry + Provider Adapter |
| Provider-specific error codes | Provider Adapter (per provider) |
| Known provider quirks and workarounds | Provider Adapter (per provider) |
| OCR engine selection | Document Processing Pipeline (configurable, not per-provider) |
| HTR model selection | Document Processing Pipeline (configurable, not per-provider) |

---

## Implementation Roadmap

The roadmap below continues from the existing `ROADMAP.md` phases. It begins at the
smallest possible scope — a single document with a single claim — and expands
incrementally. Each milestone produces a working, testable capability. No milestone
requires all prior milestones to be feature-complete before it can begin.

### Before any milestone: prerequisite work

The following work is prerequisite to implementation. It maps to the existing roadmap
phase `0.2 Schemas`:

1. Define machine-readable schemas for the claim model and evidence model (noted as
   TODO in the existing repository)
2. Sketch `knowledge/archive-landscape.md` with the taxonomy of record classes and
   the principles for coverage and ranking (new addition, recommended above)
3. Extend `specs/agent-contracts.md` from its current stub state into actual
   language-neutral interface sketches for the five contract areas it lists

These three items should be completed before writing any runtime code. They are the
stable contracts that all milestones implement against.

### Milestone P0: Proof-of-Concept — single document, single claim (no archive access)

**Goal:** demonstrate the core evidence-to-claim pipeline end-to-end with no external
archive connectivity.

**Scope:**
- A user provides a GEDCOM file; the GEDCOM Adapter parses it and maps it to the
  claim graph
- The Research Planner identifies the weakest or absent claims
- The user provides a single scanned document (user upload); the Document Processing
  Pipeline applies OCR
- The Evidence Synthesiser extracts observations, characterises the source, and
  proposes a claim update
- The Hypothesis Manager accepts or flags the update
- The Report Generator produces a minimal research report

**What this milestone proves:**
- The data model (observation → provenance envelope → claim update) works
- The source evaluation integration works
- The confidence propagation from OCR confidence to claim confidence works
- The report template can be populated from the claim graph

**What it explicitly excludes:**
- Any archive connectivity
- Any autonomous search loop
- Any AI-driven research planning

**Why start here:** every subsequent milestone builds on the evidence pipeline.
Getting the pipeline right in P0 prevents compounding errors in P1 through P5.

### Milestone P1: Archive Discovery Engine core — one provider, one record class

**Goal:** connect one real archive provider and retrieve one record type through the
full pipeline.

**Scope:**
- Implement the provider adapter interface for the open (unauthenticated) endpoints
  of Riksarkivet
- Implement the Record Type Registry with Swedish parish records as the first
  record class
- Implement the Query Router with single-provider dispatch, rate limiting, and
  transient failure retry
- Implement the Cache Layer (search result cache and raw document cache)
- Connect the retrieved document to the Document Processing Pipeline from P0
- Human-driven: the user selects which person to search and the system executes
  the search; no autonomous search planning yet

**What this milestone proves:**
- The provider adapter interface is viable
- The Query Router's normalisation and error handling work
- The cache layer correctly records provenance

**What it explicitly excludes:**
- Autonomous agent decision-making
- Multiple providers
- The Research Engine orchestration loop

### Milestone P2: Research Engine basic loop — rule-based, single provider

**Goal:** close the loop from claim gap to retrieved evidence to updated claim,
driven by a rule-based Research Planner and Stopping Oracle.

**Scope:**
- Implement the Research Planner with rule-based gap identification (not AI-driven)
- Implement the Search Planner using the Record Type Registry from P1
- Implement the Hypothesis Manager (claim lifecycle management)
- Implement the Stopping Oracle with the rule-based stopping conditions
- Implement the Research Session Store (durable session persistence)
- Implement the Audit Log
- Execute the full autonomous loop for a single person, single jurisdiction,
  single record class

**What this milestone proves:**
- The research loop can run without human intervention for simple, well-covered cases
- The session can be resumed after interruption
- The audit log produces a reviewable research trail
- The stopping conditions prevent infinite loops

**What it explicitly excludes:**
- AI-driven research planning
- Multiple providers
- Conflict resolution beyond simple detection

### Milestone P3: AI-driven research planning and hypothesis management

**Goal:** replace the rule-based Research Planner with an AI agent that makes
principled source selection and stopping decisions.

**Scope:**
- Integrate an LLM-backed Research Planner that uses the existing prompts framework
  (`prompts/investigate-person.md` and related) to reason about which record classes
  to pursue next
- Implement the Hypothesis Manager's competing-claims handling (maintaining multiple
  active identity hypotheses simultaneously)
- Implement conflict detection and the escalation path from the Stopping Oracle
- Connect to the conflict resolution specification for conflict classification
- Add the decision trees from `specs/decision-trees.md` as structured decision points
  within the AI-driven planning loop

**What this milestone proves:**
- The AI agent can make defensible source selection decisions following the
  framework's methodology
- Competing hypotheses are preserved rather than prematurely collapsed
- Conflicts escalate correctly rather than being silently absorbed

**What it explicitly excludes:**
- Multiple providers
- User account authentication (OAuth2 providers)

### Milestone P4: Multi-provider support and authentication

**Goal:** support at least two additional archive providers, including one requiring
user-delegated OAuth2.

**Scope:**
- Implement adapter for ArkivDigital (OAuth2 user-delegated) or FamilySearch
- Implement the Provider Registry with capability declaration
- Extend the Query Router for multi-provider parallel dispatch
- Implement the Credential Store and the OAuth2 token management within the adapter
- Implement provider priority selection in the Search Planner
- Add authentication event logging to the Audit Log

**What this milestone proves:**
- The provider adapter interface generalises to providers with very different APIs
  and authentication models
- The system can route the same abstract query to multiple providers and merge results
- User credentials are managed safely

### Milestone P5: Full autonomous agent — complete ten-step workflow

**Goal:** implement the complete workflow described in the task description.

**Scope:**
- OCR and HTR pipeline improvements (handwriting recognition for pre-1800 Swedish
  records)
- FamilySearch structured API integration (bypasses OCR for indexed records)
- Report Generator producing the full research report with provenance, hedged language,
  conflict records, and next-step plans
- Complete confidence propagation from extraction confidence through source evaluation
  to claim confidence
- Human review hooks at defined checkpoints (human can inspect and override at any
  Stopping Oracle evaluation point)
- Evaluation dataset for P0 pipeline (maps to roadmap phase `0.4 Evaluation`)
- Extension guide for adding new providers and country knowledge packs
  (maps to roadmap phase `0.5 Extensions`)

**What this milestone proves:**
- The complete ten-step autonomous research workflow works end-to-end
- The framework is extensible without modification to its core
- Human review is possible without disrupting the research session

---

## TODO Checklist

- [ ] Draft `knowledge/archive-landscape.md` with record class taxonomy and coverage
      principles (prerequisite, before any implementation milestone)
- [ ] Expand `specs/agent-contracts.md` from stub to language-neutral interface
      sketches covering the Research Engine and Archive Discovery Engine contracts
- [ ] Define the abstract search request model and retrieved document envelope schemas
- [ ] Define the provenance envelope schema as a JSON schema draft
- [ ] Define the research session record schema
- [ ] Define the audit log event schema
- [ ] Add provider capability declaration format to the extensibility model
- [ ] Add guidance for implementing a new provider adapter (extension guide)
- [ ] Add evaluation fixtures for the Document Processing Pipeline from P0 (maps to
      roadmap `0.4 Evaluation`)

## Future Improvements

- Add a formal state machine specification for the Research Engine's session lifecycle
- Add benchmark definitions for archive query latency and OCR accuracy targets
- Add guidance for federated multi-user deployments where Credential Stores are
  per-user and research sessions may share cache layers
- Define the human-in-the-loop review protocol as a formal workflow module under
  `workflows/`
- Add country knowledge packs for Norway, Denmark, Finland, and Germany as the
  first extensions beyond Sweden

## References

- [`/architecture/system-overview.md`](system-overview.md)
- [`/architecture/module-boundaries.md`](module-boundaries.md)
- [`/architecture/extensibility-model.md`](extensibility-model.md)
- [`/specs/claim-model.md`](../specs/claim-model.md)
- [`/specs/confidence-model.md`](../specs/confidence-model.md)
- [`/specs/conflict-resolution.md`](../specs/conflict-resolution.md)
- [`/specs/agent-contracts.md`](../specs/agent-contracts.md)
- [`/specs/decision-trees.md`](../specs/decision-trees.md)
- [`/knowledge/evidence-model.md`](../knowledge/evidence-model.md)
- [`/knowledge/source-evaluation.md`](../knowledge/source-evaluation.md)
- [`/knowledge/research-principles.md`](../knowledge/research-principles.md)
- [`/knowledge/record-types.md`](../knowledge/record-types.md)
- [`/workflows/research-workflow.md`](../workflows/research-workflow.md)
- [`/workflows/person-investigation.md`](../workflows/person-investigation.md)
- [`/workflows/research-memory.md`](../workflows/research-memory.md)
- [`/templates/research-report.md`](../templates/research-report.md)
- [`/templates/research-plan.md`](../templates/research-plan.md)
- [`/ROADMAP.md`](../ROADMAP.md)
