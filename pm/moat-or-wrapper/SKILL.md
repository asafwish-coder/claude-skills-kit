---
name: moat-or-wrapper
description: Scores whether an AI product or company is a durable moat or a thin model wrapper across four axes, then names the biggest vulnerability and the next move; triggers on "is this a moat or a wrapper", "AI moat audit", "are we defensible", "what happens when the next model ships", or pasting a product description and asking how durable it is.
---

# Moat or Wrapper

A blunt durability audit for AI products. It tells you whether there is a real moat or just a prompt and a logo sitting on top of someone else's model, and it does not flatter you to do it.

## When to use
- Evaluating your own product or a competitor for defensibility before a roadmap, raise, or build-vs-partner call.
- A new foundation model just shipped and you need to know what it quietly killed.
- An investor, exec, or founder claims "our AI is our moat" and you want to pressure-test it.

## How it works
1. Pin the unit of analysis first. One product, one workflow, one buyer. "The company" is too vague to score. If the user gives a company, pick the single product that earns the most or is most defended, and say which one you picked and why.
2. Score each of the four axes 0 to 5, using the same anchor every time: 0 means "the next model release erases this," 3 means "a competitor needs real effort but no access I cannot buy," 5 means "a well-funded copycat needs 18+ months and access I cannot buy." State the evidence behind each number in one phrase. Where the cap rules below apply, they override a generous read: a slick version of a commodity is still capped.
   - Proprietary data and feedback loop. Does usage generate data the product gets measurably better from, that a competitor cannot scrape, buy, or synthesize? A static dataset is not a loop. Ask: if they 10x users tomorrow, does the product improve, or just get bigger? Public or licensable data caps this axis at 2.
   - Workflow lock-in and switching cost. Is the product embedded in a system of record, an approval chain, integrations, or trained team habits? Or is it a chat box a user can swap in one afternoon? Count the real cost to rip it out, not the UI polish. A standalone assistant with no write-back into the buyer's systems caps at 2.
   - Distribution. Does the product reach buyers through a channel rivals cannot cheaply copy: an existing install base, a platform default slot, a regulated or hard-won relationship, an owned audience? Paid ads and "we will do content" are not distribution moats and cap this axis at 2.
   - Survival of the next foundation-model release. This is the crux, so run it concretely, not as a someday hypothetical. Assume that within 6 months a frontier model ships this exact capability native, good enough, and effectively free. Write down what is left of the product after that. If the honest answer is "not much," this axis is 0 to 1 no matter how good today's demo looks. Wrappers die here.
3. Bind the verdict to the scores so it cannot drift from the scorecard:
   - Wrapper: three or more axes score 2 or below, OR the next-model axis scores 0 to 1.
   - Leaning wrapper: two axes at 2 or below and no axis above 3.
   - Leaning moat: at least one axis at 4 or 5 and no more than one axis at 2 or below.
   - Moat: two or more axes at 4 or 5, including either data-loop or switching-cost, and the next-model axis is 3 or higher.
   When the rules conflict, the stricter verdict wins. A high score on a single axis, usually a slick UI mistaken for lock-in, does not rescue the verdict.
4. If it is a wrapper, say so in the first line and do not soften it. The first word is "Wrapper."
5. Name the single biggest vulnerability: the one axis or dependency that, if it moves, takes the business with it. Be specific about the trigger: a named model release, a platform policy change, a data source closing, a key integration revoking access.
6. Give one concrete next move that deepens the weakest real moat, not a wishlist. It must be ownable in two quarters and tied to the lowest defensible axis. "Build a feedback loop" is not a move. "Log every correction users make to output X, and fine-tune on it weekly" is.

## Output format
- **Verdict** (one line): Moat / Leaning moat / Leaning wrapper / Wrapper, plus the unit you scored.
- **Scorecard**: a 4-row table. Columns: axis, score /5, one-sentence reasoning, confidence (high if grounded in stated evidence, low if inferred).
- **Biggest vulnerability**: 2 to 3 sentences naming the single failure trigger and what it takes out.
- **Next move**: one specific, ownable action tied to the weakest defensible axis, with a rough time horizon.
- **What would change my mind**: one line on the evidence that would move the verdict up a tier.

## Guardrails
- Be honest, not flattering. Hope is not a moat. If it is a wrapper, the first word is "Wrapper."
- Never count the foundation model itself as the moat. The buyer can rent the same model.
- Demos, UI, and "we are faster" are not moats. Score the system, not the polish.
- Do not inflate scores to be nice. An unearned 4 costs the reader a wrong bet.
- If you lack evidence for an axis, score it low, mark the confidence low, and say what you would need to verify, rather than guessing high.
- Separate evidence from inference everywhere. Never let a low-evidence guess wear the same confidence as a grounded score.
- Write the output in plain punctuation: no em dashes. Use commas, periods, colons, and parentheses.
