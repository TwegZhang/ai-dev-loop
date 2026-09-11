#!/usr/bin/env bash
set -euo pipefail

# Install OMX-Lite Profile assets. The omx|codex argument selects the host's
# skill discovery path; codex does not select the Native Codex Profile.

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 /path/to/project <omx|codex>"
  exit 1
fi

TARGET="$(cd "$1" && pwd)"
HOST="$2"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

mkdir -p "$TARGET/policy" "$TARGET/templates" "$TARGET/iterations" "$TARGET/engineering"

cp "$ROOT/policy/OMX-LITE-POLICY.md" "$TARGET/policy/"
cp "$ROOT/templates/ITERATION-TEMPLATE.md" "$TARGET/templates/"
cp "$ROOT/templates/ITERATION-RESULT-TEMPLATE.md" "$TARGET/templates/"
cp "$ROOT/templates/DEFERRED-LEDGER-TEMPLATE.md" "$TARGET/templates/"

if [[ ! -f "$TARGET/engineering/deferred.md" ]]; then
  cp "$ROOT/templates/DEFERRED-LEDGER-TEMPLATE.md" "$TARGET/engineering/deferred.md"
fi

case "$HOST" in
  omx)
    SKILL_ROOT="$TARGET/.codex/skills"
    ;;
  codex)
    SKILL_ROOT="$TARGET/.agents/skills"
    ;;
  *)
    echo "Unknown host '$HOST'. Use 'omx' or 'codex'."
    exit 1
    ;;
esac

mkdir -p "$SKILL_ROOT"
rm -rf "$SKILL_ROOT/iteration"
cp -R "$ROOT/skills/iteration" "$SKILL_ROOT/"

echo "Installed AI Dev Loop OMX-Lite Profile assets into: $TARGET"
echo "Skill installed at: $SKILL_ROOT/iteration"
echo "Host '$HOST' selects skill discovery only, not the Native Codex Profile."
echo
echo "Next:"
echo "1. Reference policy/OMX-LITE-POLICY.md from your project AGENTS.md."
echo "2. Ensure ARCHITECTURE.md / relevant specs exist."
echo "3. Start the active host and invoke \$iteration."
