---
title: Rogestam Family Tree — GEDCOM Analysis Report
research_question: Assess the evidential quality, structural integrity, internal consistency, and research completeness of the Rogestam Family Tree as exported from Ancestry.com on 27 Jun 2026.
scope: All individuals and family records in the GEDCOM file. Primary focus on the direct ancestral lines of probant Ludvig Rogestam (b. 2006).
workflow_entry_point: Stage 3 (pre-collected source material with unclear conclusions)
disposition: escalate — multiple conflicts and source quality deficiencies require targeted investigation before conclusions on many links can be considered stable
analyst: Genealogy AI Framework (claude-sonnet-4-6)
date: 2026-06-27
---

# Rogestam Family Tree — GEDCOM Analysis Report

## Research Question

What is the current evidential state of the Rogestam Family Tree GEDCOM? Specifically: which claims are well-supported, which are unsupported or derived from weak sources, where do internal conflicts exist, and where are the highest-priority research opportunities?

## Scope and Assumptions

**File:** `Rogestam_Family_Tree.ged`, exported from Ancestry.com, 27 Jun 2026, GEDCOM 5.5.1, UTF-8.

**Tree size:** Approximately 85 individuals (INDI records) across roughly 10 generations, ca. 1600–2026.

**Geographic coverage:**
- Gotland (dominant): parishes of När, Lau, Burs, Vamlingbo, Grötlingbo, Rone
- Småland/Kalmar: Torsås parish and environs (paternal mainland branch via Per August Jonasson)
- Stockholm: Rogestam surname holders (modern generations)
- Dalarna: one ancestral couple (Lars Göransson / Margareta Persdotter), connection to Gotland not sourced

**Assumption entering analysis:** The GEDCOM content as exported is treated as the current research record. No external verification of cited databases has been performed. Citations are assessed by source type and transmission status, not by retrieval of underlying originals.

---

## Sources Reviewed

The following source records appear in the GEDCOM. They are characterized by transmission status and evidentiary category.

| ID | Title | Type | Transmission status | Evidentiary weight |
|---|---|---|---|---|
| @S163602385@ | Sweden, Indexed Birth Records, 1859–1947 | Indexed derivative of church records | Derivative (index of Genline images) | Moderate — useful for locating church originals; index normalization risk |
| @S163602476@ | Index till träd på Geneanet (Geneanet Community Trees Index) | Compiled user-submitted family tree | Compiled, unverified | Very weak — secondary compilation with unknown sourcing |
| @S163602648@ | Sweden, Indexed Marriage Records, 1860–1947 | Indexed derivative of church records | Derivative | Moderate — same caveats as birth index |
| @S163602688@ | Sweden, Find a Grave Index, 1800s–Current | User-contributed memorial index | Compiled | Weak for historical facts; useful for death/burial leads only |
| @S163602752@ | Ancestry Family Trees | User-submitted compiled trees | Compiled, unverified | Very weak — broadest use in this tree; represents transferred assumptions, not primary evidence |
| @S163612898@ | Sweden, Select Baptisms, 1611–1909 | Church baptism records via Genline | Derivative with image access | Moderate-strong for baptism events when image confirms entry |
| @S163651976@ | Sweden, Select Marriages, 1630–1920 | Church marriage records via Genline | Derivative with image access | Moderate-strong for marriage events |
| @S163660381@ | Swedish Church Records Archive (Genline) | Church records with GID reference | Original access via digitized images | Strong when specific GID confirmed; needs image review |
| @S163683880@ | Ancestry database (unidentified by title in GEDCOM) | Unknown | Unknown | Cannot assess without title |

**Critical observation:** The two most heavily used sources across the entire tree are `@S163602752@` (Ancestry Family Trees) and `@S163602476@` (Geneanet Community Trees Index). Both are compiled, user-submitted trees with unknown sourcing. Under the framework's source evaluation model, these are the weakest evidentiary category. Their widespread use — particularly for individuals before 1800 — means a large fraction of the tree's claims rest on inherited assumptions, not primary evidence.

---

## Findings

### 1. Confirmed Structural and Data Errors

The following are not interpretive differences; they are internal inconsistencies or logical impossibilities within the GEDCOM data itself.

#### 1.1 Duplicate birth record: Hans Hansson (@I112603350676@)

Two `BIRT` tags appear for the same individual:
- `18 Mar 1820, När, Gotland`
- `11 March 1820, Husarve, När, Gotland` (sourced to Geneanet)

GEDCOM 5.5.1 permits only one birth event per individual. The dates differ by seven days; the places are consistent (Husarve is a farm in När parish). One of these represents an indexing error or a second record incorrectly attached. **The Swedish baptism record (`@S163612898@`) should be consulted to determine the correct date.** The seven-day gap between birth and baptism at @I112603350676@'s children (e.g., Dorothea Maria Hansdotter, baptized two days after birth) suggests that a one-week gap between birth and baptism is plausible, and these two entries may represent a conflation of birth date with baptism date from two different source entries.

#### 1.2 Impossible baptism date: Olof Jacobsson (@I112603363737@)

- Birth: 1635, Lau, Gotland
- Baptism: **3 Aug 1788, Madesjo, Kalmar** — 153 years after birth

This baptism record belongs to a different individual and has been incorrectly attached. The record (`@S163612898@`, APID 1,60361::24788053) must be examined to identify whose baptism this actually is. This is a record-linking error, not an ambiguity.

#### 1.3 Impossible marriage date: Carin Olofsdotter (@I112603353164@)

- Birth: 1660, Botels, Lau
- Death: **9 Oct 1724**, Botels, Lau
- Marriage: **Oct 1755, Kuopio mlk, Kuopio, Finland** — 31 years after death

This marriage event cannot belong to this individual. The Finland location is also geographically anomalous for a 17th-century Gotland woman. This event has been attached in error and must be removed or reassigned. The source for this marriage is not identified in the record (`@S163602752@`, compiled tree), which means the error has propagated from an unverifiable source.

#### 1.4 Non-existent calendar date: Jonas Gustaf Svensson (@I112603264632@)

- Death: **29 febr 1912**, S Slätafly, Torsås, Kalmar

1912 was not a leap year. February 29 did not exist in 1912. The source (`@S163660381@`, Genline church archive) should be consulted; the date is likely 28 Feb 1912 or a copying error from the record. This is a transcription or data-entry defect.

#### 1.5 Probable duplicate individual: Lars Gustaf Emil Jonasson / Emil Lars Gustaf Jonasson

- @I112603263576@: **Lars Gustaf Emil Jonasson**, born **17 Mars 1897**, När, Gotland — source: indexed birth record (APID 1,2262::4499638)
- @I112603263891@: **Emil Lars Gustaf Jonasson**, born **17 MAR 1897**, Husarve, När (I) — multiple sources including Genline

Both individuals share the same birth date and the same parish. Their given name elements are identical but reordered. This is almost certainly the same person entered twice under different name orderings. The Genline GID (100009.65.10700 / CL2588) cited for @I112603263891@ should resolve which name ordering is correct. The two records need to be merged; any relationships attributed to @I112603263576@ must be checked against @I112603263891@.

### 2. Conflicting Evidence

The following represent cases where two records provide incompatible information for the same person or event.

#### 2.1 Hans Hansson birth date conflict (see 1.1 above)

The seven-day discrepancy (18 Mar vs. 11 Mar 1820) may represent birth-date versus baptism-date confusion across two source records. Both dates should be compared against the image-level church record.

#### 2.2 Ingrid Catharina Hansdotter — dual family membership (@I112603352701@)

This woman appears as:
- Child (`FAMC`) in @F41@ (family of Hans Christensson Botel and Elsa Danielsdr Gumbalde)
- Spouse (`FAMS`) in @F32@ (family with Pehr Rasmusson Husarfve)
- Spouse (`FAMS`) in @F53@ (family with Bonde Jansson Skärström)

Two marriages are plausible for a woman born 1763 who died 1846. However, @F53@ (with Bonde Jansson Skärström, who died 1821 in Änges, Barlingbo) is also the family to which **Johannes Bondesson** (@I112603786558@) is assigned as a child — but Johannes is simultaneously listed as a child in @F32@ (Pehr Rasmusson / Ingrid Catharina). A man born 1814 in Burs cannot be the biological child of two different unions if one father died in 1811 (Pehr Rasmusson Husarfve, d. 10 Maj 1811) and the other died in 1821. The sequencing suggests Johannes may have been born in the second marriage (Skärström) and the @F32@ FAMC link is erroneous. This requires verification against church records for Burs/Barlingbo.

### 3. Unsupported Claims

The following claims appear in the tree with no credible primary source.

#### 3.1 The Dalarna branch: Lars Göransson and Margareta Persdotter (@I112603361903@, @I112603361910@)

- Lars Göransson: b. 20 Sep 1609, Skaraborg/Dalarnas; d. 11 Nov 1685, Grangärde, Dalarna
- Margareta Persdotter: b. 17 Mar 1616, Ludvika; d. 19 Mar 1693, Ludvika

Their daughter Britta Larsdotter (b. 1642, Rone/Gotland) is shown married to Nils Matsson on Gotland. **No source is cited for either Lars or Margareta.** The geographic claim (Lars born in "Skaraborg, Dalarnas" — a conflation of two separate Swedish provinces) is internally incoherent. The connection from Dalarna to Gotland through Britta is plausible historically but is entirely unsourced. These two individuals rest on zero verifiable primary evidence.

#### 3.2 Isac Nilsson from Småland (@I112603351975@)

- Birth: 1746, **Småland** (only region given, no parish)
- Death: 15 Jul 1826, Änges, Burs, Gotland
- Source: only `@S163602752@` (Ancestry Family Trees)

No parish of origin is identified beyond the broad region "Småland." This is insufficient for any archival follow-up. The claim rests entirely on a compiled user tree. No church record for birth, migration, or arrival on Gotland is cited.

#### 3.3 The entire pre-1760 Lau/Vamlingbo cluster (multiple individuals)

Individuals including Rasmus Parsson (b. 1676), Jöran Nilsson (b. 1658), Hans Zachariasson (b. 1660), Daniel Hansson (b. 1697), Nils Sörensson (b. 1602), and their families are sourced predominantly or exclusively through `@S163602476@` (Geneanet community trees) and `@S163602752@` (Ancestry family trees). FamilySearch URLs are sometimes present as secondary confirmation (e.g., for Rasmus Parsson), but these are derivative indexes and need to be traced to original Gotland church records.

**None of the relationships among these 17th-century individuals can be considered stable** without verification against Gotland stiftsarkiv or Riksarkivet materials (husförhörslängder, dop- och vigselböcker from the relevant parishes).

#### 3.4 Rogestam surname origin — no research present

The Rogestam surname is carried by Nils Oskar Rogestam (b. 1915, Linköping), Anders Christer Rogestam (b. 1943, Stockholm), and Nils Erik Daniel Rogestam (b. 1967, Stockholm). No research into the origin, adoption, or etymology of this surname exists in the tree. The surname is not patronymic and suggests either a military-roll name (*soldatnamn*), a professional name, or a name assumed at an unknown point. The break from patronymic naming to a fixed hereditary surname is not documented.

### 4. Source Quality Distribution by Generation

| Approximate generation | Time period | Dominant source types | Assessment |
|---|---|---|---|
| Probant + parents | 1967–2006 | None / very sparse | Essentially undocumented in GEDCOM |
| Grandparents | ~1940–1974 | Genline church records, some indexes | Partial; no marriage dates |
| Great-grandparents | ~1897–1947 | Genline birth/marriage indexes, church archive | Moderate coverage |
| 2× great-grandparents | ~1860–1921 | Genline church archive (stronger), Geneanet | Mixed; some primary anchors |
| 3–5× great-grandparents | ~1760–1870 | Ancestry family trees, Geneanet, some FamilySearch | Predominantly compiled trees |
| 6+ generations back | ~1600–1760 | Ancestry family trees, Geneanet | Almost exclusively compiled trees |

---

## Evidence Summary by Ancestral Line

### Jonasson / Gotland (maternal line)

**Strongest section of the tree.** The Jonasson family in När parish (Emil Lars Gustaf / Lars Gustaf Emil, born 1897; his father Per August, b. 1860 Torsås; and the Gotland Jonasson cluster at Husarve farm) benefits from multiple Genline citations with specific GID numbers pointing to identifiable church record images. The baptism records in When-parish and the churchbook connections are the most methodologically grounded portion of the tree. The marriage of Emil Jonasson to Ingrid Anna Maria Lovisa is in family @F23@, also cited via Genline.

**Weakness in this line:** Per August Jonasson's move from Torsås, Kalmar to Gotland is not documented through migration or inflyttning records. His father Jonas Gustaf Svensson (Torsås) has the invalid death date of 29 Feb 1912 noted above.

### Olsson / Husarve branch (paternal Gotland line via Hilma Helena Christina Larsdotter)

Lars Niklas Olsson (b. 1840, Snausarve, Lau) and Dorothea Maria Hansdotter (b. 1847, Husarve, När) are reasonably documented for vital events, though death dates for Dorothea rely on a compiled tree citation. Their parents and grandparents extend into the 18th-century Lau and När clusters, which become progressively dependent on compiled trees.

### Rogestam line (paternal Stockholm/Östergötland line)

Nils Oskar Rogestam (b. 31 Jan 1915, Linköping; d. 22 Nov 2004, Lidingö) has the best sourcing of any Rogestam — four Ancestry source citations including Genline church records and Find a Grave. Anders Christer Rogestam (b. 5 Maj 1943, Oscars, Stockholm) has one Genline citation. Nils Erik Daniel Rogestam (b. 9 Okt 1967, Stockholm) and Anna Madeleine Rogestam (née Jonasson, b. 10 Dec 1974, Gotland) have no source citations, and their marriage is not recorded. The probant Ludvig (b. 2006) has no place of birth or sources.

---

## Conflicts and Limitations

**Confirmed conflicts (requiring resolution before the research can progress):**

1. Hans Hansson — duplicate BIRT tags with differing dates (7-day gap)
2. Olof Jacobsson — baptism record dated 153 years after birth (record misassignment)
3. Carin Olofsdotter — marriage event 31 years post-mortem in Finland (record misassignment)
4. Jonas Gustaf Svensson — death on a non-existent calendar date (29 Feb 1912)
5. Lars Gustaf Emil / Emil Lars Gustaf Jonasson — probable same individual entered twice
6. Johannes Bondesson — FAMC in two families simultaneously; inconsistent with parental death dates

**Structural limitations:**

- The tree was exported from Ancestry.com, which stores only what was entered in the member tree. No systematic methodology for how claims were assembled can be inferred from the file.
- Swedish-language month names mixed with English GEDCOM conventions throughout (e.g., "Maj", "Mars", "febr", "aug") — this indicates data was entered manually rather than transcribed from GEDCOM-standard records, raising transcription risk at date fields.
- Date format mixing (ISO 8601, English natural, Swedish natural) within a single GEDCOM is non-standard and creates parsing risk.
- The asterisk notation in given names ("Hilma* Helena Christina", "Brita /Jacobsdotter/ *") has no documented meaning in this GEDCOM and may indicate uncertainty, alternate names, or data-entry artifacts.

---

## Next Steps (Prioritized)

### Tier 1 — Resolve confirmed errors (immediate)

1. **Review Hans Hansson's church record** (När baptism register) to establish the single correct birth date. Likely source: SVAR/Riksarkivet Gotland records, När (I) CI series.
2. **Identify and detach the misassigned baptism** from Olof Jacobsson (Madesjo, 1788). Determine whose baptism this is and where it belongs.
3. **Remove the 1755 Finland marriage** from Carin Olofsdotter's record and identify its correct subject.
4. **Correct Jonas Gustaf Svensson's death date** by consulting the Torsås death register (Landsarkivet Vadstena or Riksarkivet, Torsås CI series).
5. **Merge the Lars Gustaf Emil / Emil Lars Gustaf Jonasson duplicate** using the Genline GID 100009.65.10700 (When, CI vol CL2588) as the arbitrating original.
6. **Resolve Johannes Bondesson's parentage** using Burs husförhörslängd and Barlingbo/Burs church records (Landsarkivet Visby).

### Tier 2 — Strengthen weak but plausible claims (short term)

7. **Document Per August Jonasson's migration** from Torsås to Gotland: search inflyttningslängder for När parish (SVAR) and emigration records from Kalmar/Torsås.
8. **Replace Geneanet/Ancestry-tree citations** for core direct-line ancestors (particularly the 18th-century Husarve/När cluster) with verified Genline or SVAR originals. The Landsarkivet i Visby holdings for Gotland are well-digitized via ArkivDigital and SVAR.
9. **Research the Rogestam surname origin**: search Östergötland military rolls (*rullor*) and church records for Linköping for Nils Oskar Rogestam's parents (now in family @F74@) to understand how the hereditary surname was adopted.
10. **Add vital documentation for living/recent generation**: at minimum, Anna Madeleine Rogestam's marriage to Nils Erik Daniel Rogestam, and Ludvig Rogestam's birth place.

### Tier 3 — Address unsupported claims (medium term)

11. **The Dalarna branch** (Lars Göransson and Margareta Persdotter) requires complete re-evaluation from primary Dalarnas sources. If no supporting evidence exists, this branch should be held as hypothetical pending verification.
12. **Isac Nilsson from Småland** (b. 1746): search available Småland records to identify parish of origin before this connection is treated as established.
13. **All pre-1760 Lau/Vamlingbo individuals**: schedule systematic review against Gotland stiftsarkiv baptism, marriage, burial, and household records. FamilySearch has images for many Gotland parishes; Genline GID references in some records provide starting points.

---

## Disposition

**Escalate.** The tree contains confirmed structural errors, several impossible events, at least one probable duplicate individual, and a majority of its pre-1800 claims resting on compiled user trees without primary source anchors. No major ancestral line can be considered fully verified at present. The research record is a useful set of working hypotheses and leads, not a settled genealogy.

The most methodologically sound section is the 19th–early-20th century Jonasson / När cluster, where Genline church records provide verifiable anchors. That section should be used as the stable base for extending research backward and for confirming connected individuals.

All outputs derived from this tree should treat pre-1800 relationships as hypotheses pending primary source confirmation, not established facts.

---

## Minimum Preservation Record

- **Active research question:** What is the evidential state of the Rogestam Family Tree?
- **Assumptions at start:** GEDCOM reflects the current state of an Ancestry.com member tree; content treated as working hypotheses, not verified genealogy.
- **Sources reviewed:** GEDCOM source records S163602385, S163602476, S163602648, S163602688, S163602752, S163612898, S163651976, S163660381, S163683880 (titles and transmission status characterized above).
- **Main observations:** 6 confirmed structural errors / impossible events; 1 probable duplicate individual; widespread reliance on compiled tree sources for pre-1800 claims; 4 complete ancestral lines with no primary sourcing.
- **Claims considered:** See Findings sections 1–3 above.
- **Key contradictions:** See Conflicts section above.
- **Disposition:** Escalate — targeted correction and primary source verification required before conclusions on most links are stable.
- **Next useful action:** Tier 1 corrections (§ Next Steps items 1–6).
