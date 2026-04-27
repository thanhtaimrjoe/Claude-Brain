#!/usr/bin/env bash
set -euo pipefail

BRAIN_MEMORY_DIR="${BRAIN_MEMORY_DIR:-$HOME/.claude/brain/memory}"
PROJECTS_DIR="${PROJECTS_DIR:-$HOME/.claude/projects}"
CATEGORIES=(user feedback project reference)

if [ ! -d "$BRAIN_MEMORY_DIR" ]; then
  echo "Source memory directory not found: $BRAIN_MEMORY_DIR" >&2
  exit 1
fi

if [ ! -d "$PROJECTS_DIR" ]; then
  echo "Projects directory not found: $PROJECTS_DIR" >&2
  exit 1
fi

projects_updated=0
files_copied=0

for project_dir in "$PROJECTS_DIR"/*; do
  [ -d "$project_dir" ] || continue

  target_memory_dir="$project_dir/memory"
  mkdir -p "$target_memory_dir"

  for category in "${CATEGORIES[@]}"; do
    src="$BRAIN_MEMORY_DIR/$category"
    dst="$target_memory_dir/$category"

    [ -d "$src" ] || continue

    mkdir -p "$dst"

    if find "$src" -mindepth 1 -maxdepth 1 | read -r _; then
      cp -R "$src"/. "$dst"/
      copied_in_category=$(find "$src" -type f | wc -l | tr -d ' ')
      files_copied=$((files_copied + copied_in_category))
    fi
  done

  projects_updated=$((projects_updated + 1))
done

echo "Synced memory source: $BRAIN_MEMORY_DIR"
echo "Projects scanned: $projects_updated"
echo "Files copied: $files_copied"
