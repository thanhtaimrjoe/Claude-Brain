# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository scope
- This repository root (`~/.claude`) is a **Claude Code workspace/config home**, not a single application repository.
- Most executable project code in this tree is under:
  - `dev/docker-fastapi-postgres/` (sample FastAPI + Postgres app)
  - `brain/` (install + memory sync scripts, shared skills/memory)

## Common commands

### Root workspace operations (`~/.claude`)
- Check top-level layout:
  - `ls -la`
- Inspect Claude runtime settings:
  - `cat settings.json`
  - `cat settings.local.json`
- List per-project memory stores:
  - `ls -la projects/`

### Claude Brain operations (`~/.claude/brain`)
- Install/update brain repo + link global skills:
  - `bash brain/install.sh`
- Sync shared brain memory into all Claude project memories:
  - `bash brain/scripts/sync-memory.sh`
- Sync with custom paths:
  - `BRAIN_MEMORY_DIR=/path/to/memory PROJECTS_DIR=/path/to/projects bash brain/scripts/sync-memory.sh`

### Dev sample app (`~/.claude/dev/docker-fastapi-postgres`)
- Start API + Postgres with Docker Compose:
  - `docker compose -f dev/docker-fastapi-postgres/compose.yaml up --build`
- Stop services:
  - `docker compose -f dev/docker-fastapi-postgres/compose.yaml down`
- Stop services and remove volume:
  - `docker compose -f dev/docker-fastapi-postgres/compose.yaml down -v`
- API endpoints for smoke checks after startup:
  - `GET http://localhost:8000/`
  - `GET http://localhost:8000/health/db`

## Testing/linting/build status
- No root-level test/lint/build manifest was found for `~/.claude` itself (no `package.json`, `pyproject.toml`, `Makefile`, etc. at repo root).
- Use service-specific commands inside each subproject (for example, `dev/docker-fastapi-postgres` via Docker Compose above).

## High-level architecture

### 1) Workspace/control plane (`~/.claude`)
- `settings.json`, `settings.local.json`: Claude harness config, env/model routing, and permissions.
- `projects/`: per-project Claude session data and project-local memory snapshots.
- `plugins/`: installed plugin marketplaces and plugin assets.
- `sessions/`, `tasks/`, `plans/`, `file-history/`, `shell-snapshots/`: runtime/session artifacts.

### 2) Shared knowledge + automation (`~/.claude/brain`)
- `install.sh`: bootstraps/updates brain repo and ensures `~/.claude/skills` symlink points to `brain/skills`.
- `scripts/sync-memory.sh`: copies shared memory categories (`user/feedback/project/reference`) into each project under `~/.claude/projects/*/memory`.
- `skills/`: reusable skill definitions (e.g., `sync-memory`, `review-code`) that can be invoked from Claude Code.
- `memory/`: source-of-truth shared memory, distributed to project memories by sync script.

### 3) Sample application area (`~/.claude/dev/docker-fastapi-postgres`)
- Two-service local stack via Docker Compose:
  - `db`: Postgres 16 with persisted volume.
  - `api`: FastAPI service using `psycopg`, connected by `DATABASE_URL`.
- App behavior:
  - Creates `todos` table at startup.
  - Exposes CRUD Todo APIs and DB health endpoint.
- This sample is the clearest runnable app in the current tree and should be treated as isolated from Claude runtime directories.

## Working boundaries for future edits
- Treat `~/.claude` root as an operational environment: prefer minimal, targeted edits.
- Avoid bulk cleanup of runtime artifact directories (`sessions`, `tasks`, `file-history`, `projects`) unless explicitly requested for data-retention cleanup.
- If asked to “clean up,” first classify candidates into:
  - safe to remove (generated temp artifacts confirmed unused),
  - keep (active config/state),
  - needs user confirmation (anything with potential history/state loss).
