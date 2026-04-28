# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository scope
- This repository root (`~/.claude`) is a **Claude Code workspace/config home**, not a single application repository.
- Most executable project code in this tree is under:
  - `dev/docker-fastapi-postgres/` (sample FastAPI + Postgres app)
  - `brain/` (install + memory sync scripts, shared skills/memory)

## Common commands

### Root workspace operations (`~/.claude`)
- Check top-level layout: `ls -la`
- Inspect Claude runtime settings: `cat settings.json` or `cat settings.local.json`
- List per-project memory stores: `ls -la projects/`

### Claude Brain operations (`~/.claude/brain`)
- Install/update brain repo + link global skills: `bash brain/install.sh`
- Sync shared brain memory into all Claude project memories: `bash brain/scripts/sync-memory.sh`
- Sync with custom paths: `BRAIN_MEMORY_DIR=/path/to/memory PROJECTS_DIR=/path/to/projects bash brain/scripts/sync-memory.sh`

### Dev sample app (`~/.claude/dev/docker-fastapi-postgres`)
- Start API + Postgres with Docker Compose: `docker compose -f dev/docker-fastapi-postgres/compose.yaml up --build`
- Stop services: `docker compose -f dev/docker-fastapi-postgres/compose.yaml down`
- Stop services and remove volume: `docker compose -f dev/docker-fastapi-postgres/compose.yaml down -v`
- API endpoints for smoke checks: `GET http://localhost:8000/` and `GET http://localhost:8000/health/db`

### Everything-Claude-Code Plugin (`plugins/marketplaces/everything-claude-code`)
- Run all tests (including linting and coverage): `npm test`
- Run test coverage (80% target): `npm run coverage`
- Linting: `npm run lint`
- Build OpenCode: `npm run build:opencode`
- Dashboard: `npm run dashboard`

## High-level architecture

### 1) Workspace/control plane (`~/.claude`)
- `settings.json`, `settings.local.json`: Claude harness config, env/model routing, and permissions.
- `projects/`: per-project Claude session data and project-local memory snapshots.
- `plugins/`: installed plugin marketplaces and plugin assets.
- `sessions/`, `tasks/`, `plans/`, `file-history/`, `shell-snapshots/`: runtime/session artifacts.

### 2) Shared knowledge + automation (`~/.claude/brain`)
- `install.sh`: bootstraps/updates brain repo and ensures `~/.claude/skills` symlink points to `brain/skills`.
- `scripts/sync-memory.sh`: copies shared memory categories (`user/feedback/project/reference`) into each project under `~/.claude/projects/*/memory`.
- `skills/`: reusable skill definitions that can be invoked from Claude Code.
- `memory/`: source-of-truth shared memory, distributed to project memories by sync script.

### 3) Sample application area (`~/.claude/dev/docker-fastapi-postgres`)
- Two-service local stack via Docker Compose (`db`, `api`).
- App behavior: Creates `todos` table at startup and exposes CRUD Todo APIs.

## Working boundaries for future edits
- Treat `~/.claude` root as an operational environment: prefer minimal, targeted edits.
- Avoid bulk cleanup of runtime artifact directories unless explicitly requested for data-retention cleanup.
- If asked to “clean up,” first classify candidates into:
  - safe to remove (generated temp artifacts confirmed unused),
  - keep (active config/state),
  - needs user confirmation (anything with potential history/state loss).
