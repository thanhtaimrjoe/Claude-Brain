---
name: project_kinken_working_agreement
description: KINKEN team working agreement including mindset, iteration workflow, coding/test/review rules.
type: project
originSessionId: b37d84e1-f8b9-48d3-b090-b3afc2a6deca
---

# KINKEN Working Agreement

## Core Mindset

- Focus on business goals, not blind implementation
- Requirement/spec documents are inputs, not perfect truth
- Team members are expected to raise proposals, clarify missing information, and align through communication

## Development Workflow

- Work in **1-week iterations**
- Team members sign up backlog they can finish within the iteration
- If completion outlook changes, raise it early instead of waiting for the regular meeting

## Implementation Rules

- Detailed design can be supplemented by flexible Design Docs
- All important docs should be traceable from Notion
- Product code and unit test code must be implemented together
- Coverage target: **at least 80%** overall, core/risky logic tested much more heavily

## PR and Review Rules

| Rule | Details |
|------|---------|
| PR template | Required for all PRs |
| Review response | Target within 24 hours |
| Core logic changes | Require GW review |
| Merge criteria | CI green + at least 1 approval |
| Merge strategy | Squash merge only |

## Communication

| Channel | Purpose |
|---------|---------|
| Thursday | Customer regular meeting |
| Friday | Development regular meeting |
| KPT retrospectives | As needed |
| Slack | Active communication only |
| Notion/Drive | Long-lived information |
