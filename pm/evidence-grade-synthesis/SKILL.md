---
name: evidence-grade-synthesis
description: Synthesizes interviews, support tickets, and surveys into ranked, quote-grounded insights with strength-of-evidence ratings and a signal-vs-anecdote split. Triggers on "synthesize this research," "what are the themes," "make sense of these interviews/tickets," "is this a real pattern or one loud user," or any pile of raw user feedback that needs rigor instead of a vibes summary.
---

# Evidence-Grade Synthesis

Reads a pile of user research the way a trial reads its data: every claim is pinned to a verbatim quote, rated for strength of evidence, stress-tested against the evidence that would contradict it, and honest about what it cannot yet conclude. It refuses three moves that ordinary synthesis makes by default: counting one loud user as a trend, folding a single anecdote into a theme to pad it, and reporting only the evidence that agrees with the conclusion. The output is a finding you can defend in a room that pushes back, not a tidy summary that quietly invented its own consensus.

## What makes this different
A normal synthesis lists themes, attaches a quote or two, and ranks by how often something came up. This one adds four disciplines that ordinary synthesis skips:
- **A hard signal-vs-anecdote gate.** A pattern from one source is never a theme, no matter how vivid. It is logged as an anecdote and kept visible, but it does not rank.
- **N-integrity.** N counts distinct people or accounts, not distinct quotes. One person quoted ten times is still N=1. Low N caps confidence; it cannot be talked up.
- **A mandatory disconfirming-evidence hunt.** For every theme you go looking for the quotes that complicate it. A theme with zero disconfirming evidence considered is treated as a red flag, not a clean win.
- **Pre-committed falsifiability.** For every signal you state in advance what evidence would change your mind, before anyone argues about it.

If you only remember one thing: separate what users said (observation) from what you concluded (interpretation), and never let the second outrun the first.

## When to use
- You have interview notes, transcripts, support tickets, sales-call snippets, or survey free-text and need themes you can defend to leadership.
- Someone is about to ship a roadmap bet off one persuasive customer and you need to know if it is signal or anecdote.
- You want to challenge a synthesis that already exists. Re-run it with the rigor bar on.

## How it works
Follow these steps in order. Do not jump to themes.

1. **Inventory the corpus first.** Count independent sources (distinct people or accounts, not distinct quotes from one person). State N out loud. Note the source types and any sampling bias you can see (all churned users, all enterprise, all from one channel). If N is below about 5, say so plainly and cap every confidence rating at Medium for the whole synthesis.
2. **Extract atomic observations.** Pull verbatim quotes, one claim per quote, each with a source tag (P3, Ticket-114, Survey-22). Never paraphrase at this stage. When a quote carries severity (a workaround, a churn threat, money lost, a blocked job), capture that severity in the source's own words next to the quote. This is the raw material for impact later, so do not invent it now. If a source is ambiguous, quote it and mark it ambiguous rather than resolving it for them.
3. **Cluster bottom-up into candidate themes.** Let themes emerge from the quotes; do not start from a category list. A theme is valid only if it is backed by quotes from 2 or more independent sources. A single-source pattern is logged separately as an ANECDOTE and is never merged into a theme to make it look bigger.
4. **Separate observation from interpretation on every theme.** Did sources state the problem outright (DIRECT), or are you inferring it from behavior or tone (INFERRED)? Tag each one. Write every inference with an explicit "INFERRED:" prefix so a reader can always tell what was said from what you concluded.
5. **Hunt disconfirming evidence on purpose.** For each theme, scan the whole corpus for quotes that contradict or complicate it and list them with their tags. State the result of the search even when it comes up empty ("searched the corpus, found no disconfirming quotes" is a valid and required line, not an omission). Zero disconfirming evidence considered is a red flag, not a win.
6. **Classify SIGNAL vs ANECDOTE.** SIGNAL: 2 or more independent sources, mostly DIRECT, and it survives the disconfirming check. ANECDOTE: single source, or vivid but unrepresentative, or resting purely on inference. Keep anecdotes on the watchlist (they seed future hypotheses) but never let one rank as signal.
7. **Rank signals and rate confidence.** Rank by breadth (independent sources) combined with impact (the severity captured in step 2, in users' own terms), with breadth breaking ties. Then assign confidence using the rubric below. Tie the rating to the evidence, never to how compelling the story feels.

## Confidence rubric
Assign the rating from the evidence, not the narrative. When two rows could apply, take the lower one.
- **High:** 3 or more independent sources, mostly DIRECT, survives the disconfirming check, and corpus N is at or above about 5.
- **Medium:** 2 or more independent sources but thin on any one axis (small N, partly INFERRED, or some unresolved disconfirming evidence).
- **Low:** clears the 2-source bar but is largely INFERRED, or the disconfirming evidence is real and unresolved.
- Single source can never be Low-or-higher signal. It is an anecdote.

## Output format
Return exactly these sections, in this order, using plain punctuation only (commas, periods, colons, parentheses; no em dashes):

1. **Corpus** - N independent sources, source types, and any sampling bias you can see.
2. **Signals (ranked)** - lead with a compact table (Theme, Confidence, Sources count). Then, for each signal: theme name; confidence (High/Med/Low); sources (count plus tags); 2 to 3 verbatim quotes in blockquotes with their source tags; observation-vs-interpretation note (which parts are DIRECT, which are INFERRED); disconfirming evidence considered (with the result, even if none); and one line stating what evidence would change your mind or raise confidence.
3. **Anecdotes (watchlist)** - single-source or inference-only patterns worth a future look, each with its quote and one line on why it did not clear the signal bar.
4. **What I could not assess** - questions this corpus cannot answer and the specific research that would close each gap.

## Guardrails
- Never present a single-source claim as a theme. Cannot cite 2 or more independent sources means it is an anecdote, full stop.
- Never paraphrase a user when a verbatim quote exists. The quote is the evidence; your summary is interpretation.
- Always label inference as INFERRED and keep it separate from what was directly observed.
- Always report the disconfirming evidence you considered, including when the honest result is that you found none.
- Never inflate N by counting repeat quotes from one person as multiple sources.
- Never manufacture consensus, round a Low up to a High, or bury weak N to make the deck land better.
- If asked for "just the headline," give the headline with its confidence rating attached. No naked claims.
- Write all output with plain punctuation. No em dashes anywhere.
