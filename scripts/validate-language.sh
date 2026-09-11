#!/usr/bin/env bash
set -euo pipefail

repo_root="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"

if [[ ! -d "$repo_root" ]]; then
  printf 'Repository root does not exist: %s\n' "$repo_root" >&2
  exit 2
fi

if ! command -v rg >/dev/null 2>&1; then
  printf 'Required command is unavailable: rg\n' >&2
  exit 2
fi

english_only_paths=()

collect_files() {
  local enumeration
  local file_path

  if ! enumeration="$(find "$@")"; then
    printf 'Unable to enumerate files under: %s\n' "$1" >&2
    exit 2
  fi

  if [[ -z "$enumeration" ]]; then
    return
  fi

  while IFS= read -r file_path; do
    english_only_paths+=("$file_path")
  done <<< "$enumeration"
}

collect_files "$repo_root" -maxdepth 1 -type f ! -name '*.zh-CN.md'

for directory in policy templates skills examples integrations scripts; do
  if [[ -d "$repo_root/$directory" ]]; then
    collect_files "$repo_root/$directory" -type f
  fi
done

if [[ -d "$repo_root/profiles" ]]; then
  collect_files "$repo_root/profiles" -type f ! -name '*.zh-CN.md'
fi

if [[ -d "$repo_root/docs" ]]; then
  collect_files "$repo_root/docs" -maxdepth 1 -type f -name '*.md' ! -name '*.zh-CN.md'
fi

failure_count=0

if ((${#english_only_paths[@]} > 0)); then
  if rg --line-number --with-filename --pcre2 '\p{Han}' "${english_only_paths[@]}"; then
    printf 'Chinese characters found in English-only files.\n' >&2
    failure_count=$((failure_count + 1))
  else
    search_status=$?
    if ((search_status != 1)); then
      printf 'Unable to scan English-only files (rg exit %s).\n' "$search_status" >&2
      failure_count=$((failure_count + 1))
    fi
  fi
fi

check_bilingual_pair() {
  local english_path="$1"
  local chinese_path="$2"

  if [[ ! -f "$english_path" ]]; then
    printf 'Missing English document: %s\n' "$english_path" >&2
    failure_count=$((failure_count + 1))
    return
  fi

  if [[ ! -f "$chinese_path" ]]; then
    printf 'Missing Simplified Chinese document: %s\n' "$chinese_path" >&2
    failure_count=$((failure_count + 1))
    return
  fi

  if ! rg --quiet --fixed-strings "]($(basename "$chinese_path"))" "$english_path"; then
    printf 'English document does not link to its Chinese companion: %s\n' "$english_path" >&2
    failure_count=$((failure_count + 1))
  fi

  if ! rg --quiet --fixed-strings "]($(basename "$english_path"))" "$chinese_path"; then
    printf 'Chinese document does not link to its English companion: %s\n' "$chinese_path" >&2
    failure_count=$((failure_count + 1))
  fi

  if ! rg --quiet --pcre2 '\p{Han}' "$chinese_path"; then
    printf 'Chinese companion contains no Chinese characters: %s\n' "$chinese_path" >&2
    failure_count=$((failure_count + 1))
  fi
}

check_bilingual_pair "$repo_root/README.md" "$repo_root/README.zh-CN.md"
check_bilingual_pair "$repo_root/docs/01-Research-Report.md" "$repo_root/docs/01-Research-Report.zh-CN.md"
check_bilingual_pair "$repo_root/docs/02-Team-Playbook.md" "$repo_root/docs/02-Team-Playbook.zh-CN.md"
check_bilingual_pair "$repo_root/docs/03-Project-Development-Guide.md" "$repo_root/docs/03-Project-Development-Guide.zh-CN.md"
check_bilingual_pair "$repo_root/docs/04-15min-SOP.md" "$repo_root/docs/04-15min-SOP.zh-CN.md"
check_bilingual_pair "$repo_root/docs/05-Project-Setup.md" "$repo_root/docs/05-Project-Setup.zh-CN.md"
check_bilingual_pair "$repo_root/docs/06-Choosing-an-Execution-Profile.md" "$repo_root/docs/06-Choosing-an-Execution-Profile.zh-CN.md"
check_bilingual_pair "$repo_root/profiles/native-codex/README.md" "$repo_root/profiles/native-codex/README.zh-CN.md"
check_bilingual_pair "$repo_root/profiles/omx-lite/README.md" "$repo_root/profiles/omx-lite/README.zh-CN.md"

if ((failure_count > 0)); then
  exit 1
fi

printf 'Language policy validation passed.\n'
