# Claude Skills Kit, for PMs and clinicians

Ten custom [Claude Code](https://code.claude.com) skills I built and use, free to take.
Five port clinical reasoning into product work. Five bring research rigor into safe clinical AI use.
They are built to disagree with you, which is the whole point.

Made by Asaf Nitai Wishnia. Clinician turned AI product leader.

## Install

```bash
git clone https://github.com/asafwish-coder/claude-skills-kit.git
cd claude-skills-kit
./install.sh
```

That copies each skill into `~/.claude/skills/`. Restart Claude Code, then type the slash command
(for example `/red-team-bet`), or just describe your situation and Claude triggers the right one.
To install by hand, copy any skill folder into `~/.claude/skills/`. To share with a team, drop the
folders into a project's `.claude/skills/` and commit them.

## PM kit, the clinician's brain applied to product

| Command | What it does |
|---|---|
| `/differential-decision` | Runs a clinical differential on a product problem. Competing hypotheses, base rates, the can't-miss cause, and the one cheap test that tells them apart. |
| `/red-team-bet` | Steelmans why your bet fails, then pre-registers a kill criterion, a number and a date, while you are still honest. |
| `/ai-feature-premortem` | Patient-safety thinking for AI features. Success metric plus harm metric, the worst case for your most vulnerable user, and the human fallback. |
| `/evidence-grade-synthesis` | Turns interviews and tickets into themes with quote-level evidence and a strength rating, no manufactured consensus. |
| `/moat-or-wrapper` | Scores an AI product on data loop, lock-in, distribution, and survival of the next model release, then names the one move that deepens the moat. |

## Clinician kit, researcher grade and safety first

Read this first. Never put PHI or anything patient identifiable into an AI tool. Keep a human in the
loop on every clinical decision. Verify every citation. These skills support your judgment, they do not
replace it. They are responsible-use tools, not an official medical product. Have compliance review them
before any patient-adjacent use.

| Command | What it does |
|---|---|
| `/ai-claim-check` | Pressure-tests any "AI beats doctors" headline. The comparator, the real-world prevalence math (PPV and NPV, not just sensitivity and specificity), and whether it generalizes. |
| `/appraise-evidence` | Structured critical appraisal of a study or claim, with a mandatory list of citations for you to verify, because models hallucinate references. |
| `/deidentify-guard` | A refuse-by-default safety gate. It will not analyze clinical text until identifiers are stripped, and hands back a de-identified version. |
| `/patient-translate` | Rewrites clinical content as plain-language patient education at a target reading level, with a hard footer that a licensed clinician must review and sign. |
| `/differential-tutor` | A Socratic study aid that builds a differential with you for learning. It never makes or replaces a real clinical decision. |

## Notes

These are real Claude Code skills (`SKILL.md` files with frontmatter), accurate as of June 2026.
Have a skill you want in the next batch? Open an issue, I am collecting ideas.
