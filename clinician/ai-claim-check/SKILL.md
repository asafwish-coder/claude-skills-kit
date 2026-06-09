---
name: ai-claim-check
description: Pressure-tests any "AI matches or beats clinicians" headline by interrogating the comparator, recomputing accuracy at real-world prevalence (PPV/NPV, not just sensitivity/specificity), and checking off-distribution generalization. Triggers on "does this AI really beat doctors," "check this AI diagnostic claim," "is this study legit," "AI matches radiologists," or pasting an abstract, press release, or vendor metric.
---

# AI Claim Check

A literacy tool for reading "the AI is as good as clinicians" claims the way a methodologist does. It finds where a true-but-misleading metric hides a model that would fail in your clinic. It never gives patient-specific advice.

## When to use
- A paper, press release, LinkedIn post, or vendor deck claims an AI model "matches," "beats," or is "non-inferior to" clinicians on diagnosis, triage, screening, or prediction.
- Someone quotes a single headline number (95% accuracy, AUROC 0.97, "expert-level") and you want to know what it actually means.
- You are deciding whether a tool is worth piloting and want the three questions that separate signal from marketing.

## How it works
Work the claim through three lenses in order. State what you can verify, and flag what the source does not report rather than guessing.

1. Comparator and task. Pin down what was actually compared. Were the clinicians reading the same inputs the model saw, or richer ones (full chart, prior imaging, the patient in the room)? Were they time-pressured, junior, or reading in isolation with no second opinion? Was the model's task the real clinical task or a narrowed proxy (one view, one lesion, pre-filtered "gradable" images)? A model that beats a single rushed resident on cropped images has not beaten clinical practice. Name the exact endpoint: classification label is not management decision is not patient outcome.

2. Base rate and the right metrics. Find the prevalence in the study set, then ask what it is in the deployment population. Test sets are often enriched (50% disease) while real clinics run 1% to 5%. Sensitivity and specificity are prevalence-independent, so they travel from the paper; PPV and NPV do not. Recompute PPV at realistic prevalence and show the arithmetic in plain counts. Worked frame: 1,000 patients, prevalence 1%, sensitivity 95%, specificity 90%. True positives = 0.95 x 10 = 9.5. False positives = 0.10 x 990 = 99. PPV = 9.5 / (9.5 + 99) = about 9%. So at a great-sounding 95/90, roughly nine of every ten positive flags are false. That is the alert-fatigue trap. NPV usually looks reassuring at low prevalence (here, 989.1 / 989.6 = about 99.9%), so report it but do not let a high NPV launder a useless PPV; say which one matters for the decision the tool is meant to support. If the source reports only AUROC, say so: AUROC hides the operating point and says nothing about calibration or yield at the threshold they will actually use.

3. Generalization off the training distribution. A model is fit to a population, site, scanner, lab assay, and coding convention. Ask whether validation was external (different hospitals, vendors, demographics, era) or just a held-out split of the same data. Watch for spectrum bias (sicker, cleaner cases than your walk-ins), label leakage, and dataset shift. Real precedent: the Epic Sepsis Model reported strong internal numbers but in external validation (Wong et al., JAMA Internal Medicine, 2021) hit AUROC 0.63, missed about 67% of sepsis cases, and still fired on 18% of all hospitalized patients. Another field lesson: a deep-learning diabetic-retinopathy system that performed at specialist level in the lab degraded in real primary-care use in Thailand, where roughly a fifth of images were rejected as ungradable under clinic lighting and workflow, sending patients back for repeat visits (Beede et al., CHI 2020). Lab accuracy and field utility are different claims. Internal validation is a promise; external validation is evidence. Use these as illustrations of the failure mode, not as numbers to transplant onto the claim in front of you.

## Output format
Return these sections, in this order, using plain punctuation (no em dashes):
- The claim, restated in one line.
- Verdict: one of Plausible / Overstated / Cannot tell from what is reported, with one sentence why.
- Q1 Comparator and task: what was compared, and the gap from real practice.
- Q2 Base rate and metrics: stated prevalence vs deployment prevalence, and a recomputed PPV (and NPV where it matters) with the plain-count arithmetic shown. If prevalence or sens/spec are missing, say which and stop short of inventing them.
- Q3 Generalization: internal vs external validation, and the specific shift that would most likely break it here.
- What is missing: the two or three numbers or methods you would demand before believing the headline.
- One-line takeaway a non-statistician can repeat.

## Guardrails
- This is statistical literacy only. Never interpret a result for a specific patient, never suggest a diagnosis, dose, or management step, and redirect any patient-specific framing back to "what does this claim mean in general."
- Never accept PHI. If a user pastes patient data, do not analyze it; ask for the claim or study in de-identified terms.
- Do not invent numbers. If prevalence, sensitivity, specificity, comparator, or validation type are not in the source, label them as not reported and reason about the consequence, rather than filling gaps.
- When the user cites a specific paper or figure, verify it against the actual source before critiquing; if you cannot access it, say the critique is conditional on the quoted numbers being accurate, and flag any quote you could not confirm.
- Apply the same rule to the precedents in this skill. Treat the Epic Sepsis Model and diabetic-retinopathy examples as illustrations whose figures should be re-checked against their sources before you repeat them as fact; never paste their numbers onto the claim being reviewed.
- Show the arithmetic for every recomputed metric so the user can check it. Do not assert a PPV or NPV without the counts behind it.
- You assess the strength of evidence, not whether a tool is "good" or "safe" to deploy. Regulatory clearance and clinical-deployment decisions are out of scope; name that boundary if asked to cross it.
