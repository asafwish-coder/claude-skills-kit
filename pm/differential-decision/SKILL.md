---
name: differential-decision
description: Runs a clinical-style differential diagnosis on a product problem, a metric move, or a decision. Generates competing hypotheses, ranks them by base rate, flags the can't-miss cause, and names the single cheapest test that discriminates between them. Trigger with phrases like "why did this metric drop", "what's causing this", "differential on this", "help me decide", "what's really going on here", or "I think it's X" (especially when you have one pet theory).
---

# Differential Decision

Differential diagnosis for product decisions. Instead of jumping to the first plausible cause, it holds 3 to 5 competing hypotheses open at once, then spends its energy on the one cheap test that tells them apart. Built to fight premature convergence, confirmation bias, and the pull to agree with whoever is in the room, the way a good clinician fights anchoring.

## When to use
- A metric moved (up or down) and the cause is not obvious, or someone already "knows" why.
- A product problem has one loud explanation and you suspect that loudness is doing the thinking for you.
- A decision has competing rationales and you want to know what evidence would actually settle it.
- You have a pet theory and want it stress-tested before you commit roadmap or spend to it.

## How it works
1. Restate the presenting problem in one sentence: what changed, by how much, since when, for whom. If a number is missing (magnitude, segment, time window, denominator), ask for it before reasoning. No diagnosis on vibes.
2. Generate the differential: 3 to 5 genuinely competing hypotheses, not one real theory plus strawmen. Force coverage across categories so you do not cluster: instrumentation or measurement artifact, user behavior shift, product or UX change, upstream dependency or external event (pricing, season, competitor, platform), and population or mix shift. If a category is empty, say why.
3. For each hypothesis state: the mechanism (the specific causal chain, not a label), the base rate or prior (how often this is the real cause in cases like this, plus your confidence), and the evidence that would rule it IN and the evidence that would rule it OUT. Discipline the priors: common things are common, so do not inflate the prior of an interesting hypothesis just because it is interesting. Popper's gate applies: a hypothesis you cannot disconfirm is not a hypothesis, it is a belief, so flag any item that has no ruling-out evidence.
4. Name the most likely cause (highest posterior after base rate plus current evidence) AND, separately, the most dangerous to miss: the can't-miss cause that is lower probability but high cost if true and left undiagnosed (a data pipeline lying to you, a churn leading indicator, silent breakage for a key segment). These are often not the same hypothesis. Never let "most likely" quietly absorb "most dangerous."
5. Pick the single discriminating test: the one data pull, query, or experiment whose result splits the remaining hypotheses most (rules several in or out at once), not the one that confirms your favorite. State its cost or effort (rough query time, sample needed, who has to do it) so "cheapest" is a claim, not a vibe. Prefer a test that could prove you wrong, and state exactly what result would point to which hypothesis.
6. State the anchor check: name the explanation that was believed walking in, and, separately, whose belief it is (yours, the user's, or a stakeholder's). Then name the specific evidence that would force dropping it. If nothing could, say so out loud.

## Output format
Return these sections, in order, plain text:
- **Problem (one line):** what moved, magnitude, segment, window.
- **Differential:** a numbered list. Each entry: Hypothesis | Mechanism | Prior (and confidence) | Rules in if... | Rules out if...
- **Most likely:** one hypothesis, with the why.
- **Most dangerous to miss:** one hypothesis, with the cost if true and ignored.
- **Discriminating test:** the single cheapest thing to pull or run next, its cost or effort, and the decision tree for its result (if X then..., if Y then...).
- **Anchor check:** the belief walked in with, whose belief it is, and what would overturn it.
- **What I need:** any missing number or access that would sharpen the call.

## Guardrails
- Always carry at least 3 hypotheses to the end. Never collapse to one before the discriminating test is named.
- Always separate "most likely" from "most dangerous to miss." If they are the same, prove it, do not assume it.
- Every hypothesis must have a way to be ruled out. Drop or rewrite any that cannot.
- The discriminating test must be able to disconfirm the favorite. If the proposed next step can only confirm one theory, it is the wrong step.
- Do not soften the call to match the user's stated theory. If the user walked in with "I think it's X," X must still earn its prior and survive the same ruling-out test as every other hypothesis. Stating that the user's favorite is currently unsupported is the job, not a failure of tact.
- Distinguish a measurement artifact from a real-world change before proposing any product fix. Tracking lies more often than users change overnight.
- Do not invent numbers. Mark every prior as an estimate and ask for the real denominator when it matters.
- Write the output in plain punctuation. No em dashes. Use commas, periods, colons, and parentheses.
