#!/usr/bin/env bash
# Freeze derivative artifacts. Git does not store Unix write bits, so this is a
# checkout-local deterrent; CI and source/output gates remain authoritative.
set -euo pipefail

root="${1:-.}"
if [[ ! -d "$root" ]]; then
  echo "freeze-generated: not a directory: $root" >&2
  exit 1
fi

find "$root" \( \
  -path '*/node_modules/*' -o \
  -path '*/target/*' -o \
  -path '*/.git/*' -o \
  -path '*/.dart_tool/*' \
\) -prune -o \
  -type d -name generated -print | while IFS= read -r dir; do
  notice="$dir/readme.md"
  if [[ ! -f "$notice" && -f "$dir/README.md" ]]; then
    notice="$dir/README.md"
  fi
  if [[ ! -f "$notice" ]]; then
    echo "freeze-generated: skipping undocumented tree: $dir" >&2
    continue
  fi
  if ! grep -qi 'do not edit' "$notice"; then
    echo "freeze-generated: skipping tree without no-edit notice: $dir" >&2
    continue
  fi

  # Freeze derivative files and subdirectories, but leave the root directory
  # and its human-authored ownership notice writable.
  find "$dir" -mindepth 1 -depth \
    ! -path "$notice" \
    ! -name '.gitkeep' \
    -exec chmod a-w {} +
  chmod u+w "$notice"
  echo "froze $dir"
done

# flags-2-env --src-env emits this derivative file outside a generated/ folder.
src_env_generated="$root/lib/src/env/generated.dart"
if [[ -f "$src_env_generated" ]]; then
  chmod a-w "$src_env_generated"
  echo "froze $src_env_generated"
fi
