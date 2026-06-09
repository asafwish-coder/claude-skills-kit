#!/usr/bin/env bash
# Installs the Clinician-PM Claude skills into ~/.claude/skills/
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME/.claude/skills"
mkdir -p "$DEST"

count=0
for aud in pm clinician; do
  [ -d "$SRC/$aud" ] || continue
  for d in "$SRC/$aud"/*/; do
    [ -f "$d/SKILL.md" ] || continue
    name="$(basename "$d")"
    mkdir -p "$DEST/$name"
    cp "$d/SKILL.md" "$DEST/$name/SKILL.md"
    echo "installed /$name"
    count=$((count+1))
  done
done

echo ""
echo "Done. Installed $count skills into $DEST"
echo "Restart Claude Code, then type /<skill-name> (for example /differential-decision),"
echo "or just describe the situation and Claude will trigger the right one."
