#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
validator="$repo_root/scripts/validate-language.sh"
fixture_root="$(mktemp -d "${TMPDIR:-/tmp}/ai-dev-loop-language-test.XXXXXX")"

cleanup() {
  rm -rf "$fixture_root"
}

expect_failure() {
  if "$@" >/dev/null 2>&1; then
    printf 'Expected command to fail: %s\n' "$*" >&2
    exit 1
  fi
}

require_text() {
  local file_path="$1"
  local expected_text="$2"

  if ! rg --quiet --fixed-strings "$expected_text" "$file_path"; then
    printf 'Required language rule is missing from %s: %s\n' "$file_path" "$expected_text" >&2
    exit 1
  fi
}

write_bilingual_pair() {
  local directory="$1"
  local stem="$2"

  mkdir -p "$directory"
  printf '[Simplified Chinese](%s.zh-CN.md)\n' "$stem" > "$directory/$stem.md"
  printf '%b' "[English]($stem.md)\n\n\351\241\271\347\233\256\350\257\264\346\230\216\n" > "$directory/$stem.zh-CN.md"
}

trap cleanup EXIT

if [[ ! -x "$validator" ]]; then
  printf 'Language validator is missing or not executable: %s\n' "$validator" >&2
  exit 1
fi

mkdir -p \
  "$fixture_root/docs" \
  "$fixture_root/policy" \
  "$fixture_root/profiles/native-codex" \
  "$fixture_root/profiles/omx-lite"

printf '[Simplified Chinese](README.zh-CN.md)\n' > "$fixture_root/README.md"
expect_failure "$validator" "$fixture_root"

printf '%b' '[English](README.md)\n\n\351\241\271\347\233\256\350\257\264\346\230\216\n' > "$fixture_root/README.zh-CN.md"
write_bilingual_pair "$fixture_root/docs" '01-Research-Report'
write_bilingual_pair "$fixture_root/docs" '02-Team-Playbook'
write_bilingual_pair "$fixture_root/docs" '03-Project-Development-Guide'
write_bilingual_pair "$fixture_root/docs" '04-15min-SOP'
write_bilingual_pair "$fixture_root/docs" '05-Project-Setup'
write_bilingual_pair "$fixture_root/docs" '06-Choosing-an-Execution-Profile'
write_bilingual_pair "$fixture_root/profiles/native-codex" 'README'
write_bilingual_pair "$fixture_root/profiles/omx-lite" 'README'

printf '%b' '\344\270\215\345\272\224\345\207\272\347\216\260\345\234\250 Policy \344\270\255\n' > "$fixture_root/policy/invalid.md"
expect_failure "$validator" "$fixture_root"

rm "$fixture_root/policy/invalid.md"

rm "$fixture_root/docs/05-Project-Setup.md" "$fixture_root/docs/05-Project-Setup.zh-CN.md"
expect_failure "$validator" "$fixture_root"
write_bilingual_pair "$fixture_root/docs" '05-Project-Setup'

rm "$fixture_root/docs/06-Choosing-an-Execution-Profile.md" "$fixture_root/docs/06-Choosing-an-Execution-Profile.zh-CN.md"
expect_failure "$validator" "$fixture_root"
write_bilingual_pair "$fixture_root/docs" '06-Choosing-an-Execution-Profile'

rm "$fixture_root/profiles/native-codex/README.zh-CN.md"
expect_failure "$validator" "$fixture_root"
write_bilingual_pair "$fixture_root/profiles/native-codex" 'README'

rm "$fixture_root/profiles/omx-lite/README.md"
expect_failure "$validator" "$fixture_root"
write_bilingual_pair "$fixture_root/profiles/omx-lite" 'README'

printf '%b' '\344\270\255\346\226\207\n' > "$fixture_root/profiles/native-codex/EXECUTION-PLAN-TEMPLATE.md"
expect_failure "$validator" "$fixture_root"
rm "$fixture_root/profiles/native-codex/EXECUTION-PLAN-TEMPLATE.md"

mkdir -p "$fixture_root/profiles/native-codex/examples"
printf '%b' '\344\270\255\346\226\207\n' > "$fixture_root/profiles/native-codex/examples/invalid.md"
expect_failure "$validator" "$fixture_root"
rm "$fixture_root/profiles/native-codex/examples/invalid.md"

printf '[Simplified Chinese](missing/README.zh-CN.md)\n' > "$fixture_root/README.md"
printf '%b' '[English](missing/README.md)\n\n\351\241\271\347\233\256\350\257\264\346\230\216\n' > "$fixture_root/README.zh-CN.md"
expect_failure "$validator" "$fixture_root"
write_bilingual_pair "$fixture_root" 'README'

find() {
  command find "$@"
  return 1
}
export -f find
expect_failure "$validator" "$fixture_root"
unset -f find

"$validator" "$fixture_root" >/dev/null
"$validator" "$repo_root" >/dev/null

artifact_rule='Generated iteration artifacts must be written in English.'
require_text "$repo_root/policy/OMX-LITE-POLICY.md" "$artifact_rule"
require_text "$repo_root/skills/iteration/SKILL.md" "$artifact_rule"
require_text "$repo_root/templates/ITERATION-TEMPLATE.md" "$artifact_rule"
require_text "$repo_root/templates/ITERATION-RESULT-TEMPLATE.md" "$artifact_rule"
require_text "$repo_root/templates/DEFERRED-LEDGER-TEMPLATE.md" "$artifact_rule"

native_artifact_rule='Generated artifact: English only.'
require_text "$repo_root/profiles/native-codex/EXECUTION-PLAN-TEMPLATE.md" "$native_artifact_rule"
require_text "$repo_root/profiles/native-codex/GOAL-TEMPLATE.md" "$native_artifact_rule"

install_target="$fixture_root/install-target"
mkdir -p "$install_target"
"$repo_root/scripts/install-into-project.sh" "$install_target" omx >/dev/null
require_text "$install_target/policy/OMX-LITE-POLICY.md" "$artifact_rule"
require_text "$install_target/.codex/skills/iteration/SKILL.md" "$artifact_rule"
require_text "$install_target/templates/ITERATION-TEMPLATE.md" "$artifact_rule"
require_text "$install_target/templates/ITERATION-RESULT-TEMPLATE.md" "$artifact_rule"
require_text "$install_target/templates/DEFERRED-LEDGER-TEMPLATE.md" "$artifact_rule"

printf 'Language policy tests passed.\n'
