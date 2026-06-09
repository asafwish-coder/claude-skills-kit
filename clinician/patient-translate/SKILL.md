---
name: patient-translate
description: Rewrites clinical content (visit summaries, discharge instructions, med changes, lab results, diagnosis explanations) into warm, plain-language patient education at a target reading level, with a teach-back question and clear next steps. Triggers on phrases like "explain this to the patient," "patient-friendly version," "write discharge instructions," "translate this note for the family," "make this 6th grade reading level," or "after-visit summary."
---

# Patient Translate

Turn clinical content into patient-facing education that is accurate, warm, and easy to read. The clinician owns every clinical claim. This produces a draft for a licensed clinician to review and sign. It is never final patient instructions and never medical advice.

## When to use
- A clinician pastes a note, discharge plan, med change, or lab result and wants a version the patient or caregiver can actually understand.
- The audience has limited health literacy, reads at a lower grade level, or speaks English as a second language.
- You need an after-visit summary with a teach-back question and concrete next steps.

## How it works
1. PHI gate first. Scan the source for direct identifiers before doing anything else: full name, MRN, account or insurance numbers, address, phone, email, exact dates of birth or service, face photos, device or biometric IDs, vehicle or license numbers, full-face URLs or social handles, and any other unique identifying characteristic. Also flag indirect re-identification risk: a named employer or school, named relatives, an unusual occupation, or a rare condition combined with a small location that could single out one person. If any are present, STOP. Do not rewrite. Return only which identifier types you found and ask the clinician to remove or replace them with neutral tokens (for example "you" or "your child"). Resume only after a clean source.
2. Source lock. Extract the clinical facts the source actually states: conditions, meds and doses, instructions, follow-up, warning signs. List them internally as your fact set. You may rewrite and simplify these. You may NOT add diagnoses, doses, mechanisms, prognoses, drug names, or numbers that are not in the source. If a needed fact is missing (for example a follow-up date or a dose), insert a bracketed gap like [clinician to confirm dose] instead of guessing.
3. Set the level. Default to about a 6th grade reading level unless told otherwise. Use short sentences (aim 8 to 12 words). Prefer common words over jargon. When a clinical term matters, give it once in plain words with the medical term in parentheses, for example "high blood pressure (hypertension)." After drafting, verify the level concretely: check that sentences are short, that words are mostly one or two syllables, and that any unavoidable clinical term is defined on first use. If you cannot meet the target without losing a clinical fact, keep the fact and note the tension in [Gaps for clinician].
4. Language. This skill simplifies health literacy in the source language. Do NOT translate into another language unless explicitly asked AND you can do so without risk of clinical mistranslation; if true translation is requested, flag it as a [Gap for clinician] for a qualified medical interpreter rather than guessing.
5. Tone pass. Warm, calm, respectful, second person. Non-alarming: state what to do and why it helps, not worst-case fear. Do not minimize either. Be culturally neutral: no assumptions about diet, family structure, religion, or gender beyond what the source states.
6. Crisis and emergency content. If the source contains warning signs, emergency-contact details, "call 911" or "go to the ER" instructions, or any self-harm, suicide, or safety-crisis guidance, carry it through faithfully and prominently. Never soften, shorten, generalize, or omit it, and never invent a crisis resource or hotline that is not in the source. Make these instructions easy to find and act on.
7. Teach-back. Write one open question the patient answers in their own words to confirm understanding (not yes/no), tied to the single most important action.
8. Next steps and safety net. Give 2 to 5 concrete, ordered actions. Include a plain "when to call or seek care now" line ONLY if the source supports specific warning signs; otherwise use a neutral "call your clinic if you have questions or feel worse."
9. Self-check before output: every sentence traces to the fact set, no invented facts, no PHI reintroduced, reading level on target, crisis and emergency instructions preserved verbatim in meaning, punctuation plain (no em dashes).

## Output format
Return in this exact order:
- **Reading level (target):** the level you wrote to.
- **Your health summary:** 2 to 4 short plain-language paragraphs or bullets.
- **What to do:** numbered next steps.
- **When to get help:** warning signs from the source, or the neutral fallback line.
- **One quick check (teach-back):** the single open question.
- **[Gaps for clinician]:** any bracketed items needing confirmation (omit if none).
- **Footer (verbatim, always):** "DRAFT for review. This is a draft prepared for a licensed clinician to review, edit, and sign before sharing. It is not medical advice and may contain errors. The treating clinician is responsible for all clinical content."

## Guardrails
- Run the PHI gate before every rewrite. If identifiers or strong re-identification risks are present, refuse to rewrite until they are removed. Never echo the identifiers back in the output.
- Never invent, infer, or extrapolate clinical facts beyond the source. No new diagnoses, doses, drug names, numbers, or prognoses. Use bracketed gaps instead of guessing.
- Never make or replace a clinical decision and never frame the text as advice from you. The clinician owns and signs every claim.
- Never soften, omit, or weaken warning signs, emergency instructions, or crisis and self-harm guidance from the source, and never invent a crisis resource that is not in the source.
- Do not translate into another language on your own. Flag true translation as a [Gap for clinician] for a qualified medical interpreter.
- Always append the footer verbatim. Never present output as final or patient-ready.
- Write in plain punctuation only. No em dashes anywhere in the output. Use commas, periods, colons, and parentheses.
- If the source is itself unsafe, contradictory, or clinically implausible, flag it in [Gaps for clinician] rather than smoothing it over.
