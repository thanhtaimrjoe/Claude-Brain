#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${REPO_URL:-https://github.com/thanhtaimrjoe/Claude-Brain.git}"
INSTALL_DIR="${INSTALL_DIR:-$HOME/.claude/brain}"
CLAUDE_DIR="${CLAUDE_DIR:-$HOME/.claude}"
SKILLS_LINK="${SKILLS_LINK:-$CLAUDE_DIR/skills}"
PROJECTS_DIR="${PROJECTS_DIR:-$CLAUDE_DIR/projects}"

mkdir -p "$CLAUDE_DIR"

if [ ! -d "$INSTALL_DIR/.git" ]; then
  git clone "$REPO_URL" "$INSTALL_DIR"
else
  git -C "$INSTALL_DIR" pull --ff-only
fi

mkdir -p "$PROJECTS_DIR"

if [ -L "$SKILLS_LINK" ]; then
  current_target="$(readlink "$SKILLS_LINK")"
  if [ "$current_target" != "$INSTALL_DIR/skills" ]; then
    rm "$SKILLS_LINK"
    ln -s "$INSTALL_DIR/skills" "$SKILLS_LINK"
  fi
elif [ -e "$SKILLS_LINK" ]; then
  backup_path="$SKILLS_LINK.backup.$(date +%Y%m%d%H%M%S)"
  mv "$SKILLS_LINK" "$backup_path"
  ln -s "$INSTALL_DIR/skills" "$SKILLS_LINK"
  echo "Backed up existing skills path to: $backup_path"
else
  ln -s "$INSTALL_DIR/skills" "$SKILLS_LINK"
fi

if [ -x "$INSTALL_DIR/scripts/sync-memory.sh" ]; then
  BRAIN_MEMORY_DIR="$INSTALL_DIR/memory" PROJECTS_DIR="$PROJECTS_DIR" "$INSTALL_DIR/scripts/sync-memory.sh"
fi

echo "Claude Brain installed at: $INSTALL_DIR"
echo "Global skills link: $SKILLS_LINK -> $INSTALL_DIR/skills"
echo "Done. Restart Claude Code if it is already running."
