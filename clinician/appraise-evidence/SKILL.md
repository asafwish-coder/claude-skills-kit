---
name: appraise-evidence
description: Runs a structured critical appraisal of a study, abstract, or clinical claim (design, bias, effect size vs clinical significance, base rates, GRADE-style confidence) and forces verification of every citation. Triggers on "appraise this study", "critically appraise", "is this evidence solid", "what's the risk of bias", "GRADE this", "does this paper actually show X", or pasting a paper, abstract, or a claim like "drug Y reduces relapse by 40%".
---

# Appraise Evidence

Cold, structured critical appraisal of a study or clinical claim. It pressure-tests the evidence so the clinician can decide, and it never decides for them. It treats every reference as suspect until the clinician verifies it on PubMed.

## When to use
- A clinician pastes a paper, an abstract, or a link and asks "is this any good?"
- A claim needs vetting before it influences practice (a rep's slide, a guideline line, a headline, a colleague's assertion).
- Someone wants to know whether a reported effect is real, large enough to matter, and generalizable to their patient.

## How it works
Work through every step. State your uncertainty out loud. Do not skip a domain because data is missing: name the gap instead. Do not invent or estimate any number the source does not report; if a figure is absent, say it is not reported and move on.

1. Restate the claim in PICO form: Population, Intervention/exposure, Comparator, Outcome, Timeframe. If the comparator is missing, placebo-only, or a weak active control, say so first, since it caps everything downstream. If the claim is stated as a relative figure (for example "reduces relapse by 40 percent"), flag immediately that a relative number cannot be judged without the baseline risk, and carry that requirement into step 5.
2. Identify the study design and where it sits on the evidence hierarchy (systematic review/meta-analysis, RCT, cohort, case-control, cross-sectional, case series, in vitro, animal, modeling, opinion). Name the design's built-in limits (for example, observational means confounding, not causation).
3. Population and generalizability. Who was enrolled, and who was excluded? Compare to the patient or population in front of the clinician. Flag off-distribution use explicitly: different age band, comorbidities, illness severity, sex, ethnicity, care setting, or dosing than the trial. Off-label or off-population extrapolation must be called out, not assumed.
4. Risk of bias, domain by domain. For randomized trials, use the current Cochrane Risk of Bias 2 (RoB 2) frame: (a) bias arising from the randomization process, (b) bias due to deviations from intended interventions, (c) bias due to missing outcome data, (d) bias in measurement of the outcome, (e) bias in selection of the reported result. Also note conflicts: funding source, author conflicts, and early stopping. For observational work, use a ROBINS-I style frame and foreground confounding and selection bias. Rate each domain low / some concerns / high, with the reason.
5. Effect size versus clinical significance. Report the actual numbers as the source gives them: baseline (control) risk, absolute risk reduction (ARR), and number needed to treat (NNT), not just relative risk, odds ratio, or hazard ratio. State the confidence interval and whether it crosses the line of no effect. If the source reports only a relative measure, say the absolute effect cannot be computed without the baseline risk, and do not estimate it. Ask directly: is a statistically significant effect large enough to change a patient's life? Watch for surrogate endpoints standing in for outcomes that matter, and for composite endpoints driven by their softest component.
6. Base rate and pre-test probability. Frame the result against how common the condition or outcome actually is. For any diagnostic or predictive claim, walk the pre-test probability through sensitivity/specificity or likelihood ratios to a post-test probability, and show the arithmetic (for example, a positive likelihood ratio applied to stated pre-test odds). A big relative effect on a rare event can be clinically trivial; spell that out with the numbers.
7. GRADE-style confidence. Start from the design (RCT starts high, observational starts low), then rate down for: risk of bias, inconsistency, indirectness, imprecision, and publication bias. Rate up (for observational evidence) for: a large effect, a dose-response gradient, or plausible residual confounding that would only have weakened the observed effect. Land on High / Moderate / Low / Very Low and justify each movement.
8. Citation and fact verification (MANDATORY). List every citation, statistic, guideline, and named trial mentioned in the source or in your own summary. Do not assert any reference exists from memory; models hallucinate plausible-looking citations, DOIs, and author lists. Mark each item "verify on PubMed" with the exact title or PMID/DOI the clinician should search. If you fetched a link, say so and quote the relevant line; if you could not, say the text is unverified.
9. Overclaim check. Compare what the data support to what the authors (or the person citing them) say. Flag causal language on correlational data, spin in the abstract, subgroup findings sold as primary, per-protocol results substituted for intention-to-treat, and "trends toward significance."

## Output format
Use plain text with these headers. No em dashes anywhere.

- Claim in one line: the assertion as stated.
- PICO: Population / Intervention / Comparator / Outcome / Timeframe.
- Design and hierarchy: type, and its built-in limits.
- Population and generalizability: who, and off-distribution flags for the target patient.
- Risk of bias: a short table, one row per domain (RoB 2 for trials, ROBINS-I for observational), rated low / some concerns / high with reason.
- Effect: baseline risk, ARR, NNT, the relative measure, CI, and the clinical-significance read. Note any figure the source does not report.
- Base rate: pre-test to post-test framing with the arithmetic shown, where relevant.
- GRADE confidence: High / Moderate / Low / Very Low, with what moved it and why.
- Overclaims: bullet list, or "none found."
- VERIFY BEFORE USE: numbered list of every citation and factual claim to confirm on PubMed, each with a search term or PMID/DOI.
- Bottom line: what the evidence can and cannot support. Never a recommendation; frame as input to the clinician's judgement.

## Guardrails
- Never give a clinical recommendation, dose, or management decision, and never tell the clinician what to do for a specific patient. Support their judgement; do not replace it. If asked "so should I prescribe this?", redirect to the appraisal and the open questions.
- Never invent, estimate, or trust a citation, statistic, PMID, DOI, or effect number. If the source does not report a value (baseline risk, ARR, NNT, CI), say so plainly rather than supplying one. Every reference goes in the VERIFY BEFORE USE list. If you did not fetch and read the source, label its contents unverified.
- Never strip protected health information into the analysis. If pasted text contains patient identifiers, do not repeat them; appraise the evidence, not the patient.
- State uncertainty plainly and name every missing domain rather than papering over it. If the source is too thin to appraise, say so and stop.
- Distinguish what the data show from what you infer. Do not upgrade correlation to causation.
- Write all output with plain punctuation: commas, periods, colons, parentheses. No em dashes.
