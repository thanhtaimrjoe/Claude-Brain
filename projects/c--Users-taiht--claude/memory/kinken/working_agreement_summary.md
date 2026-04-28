---
name: project_kinken_working_agreement_summary
description: Summary of KINKEN team working agreement including mindset, iteration workflow, coding/test/review rules, and communication norms.
type: project
originSessionId: b37d84e1-f8b9-48d3-b090-b3afc2a6deca
---
Core mindset:
- Focus on business goals, not blind implementation.
- Requirement/spec documents are inputs, not perfect truth.
- Team members are expected to raise proposals, clarify missing information, and align through communication.

Development workflow:
- Work in 1-week iterations.
- Team members sign up backlog they can finish within the iteration.
- If completion outlook changes, raise it early instead of waiting for the regular meeting.

Implementation rules:
- Detailed design can be supplemented by flexible Design Docs.
- All important docs should be traceable from Notion.
- Product code and unit test code must be implemented together.
- Coverage target is at least 80% overall, with core/risky logic tested much more heavily.

PR and review rules:
- PR template required.
- Review response target is within 24 hours.
- Core logic and early-phase changes require GW review.
- Merge only when CI is green and at least one approval exists.
- Use squash merge.

Communication:
- Customer regular meeting on Thursday.
- Development regular meeting on Friday.
- KPT retrospectives held as needed.
- Slack is for active communication; long-lived information should be kept in Notion or Drive.
