# CLAUDE-INSTRUCTIONS.md

## Core Rules (Always Follow)

You must strictly follow the rules defined in these files:
- shared/git-workflow.md
- shared/workflow.md
- shared/ROADMAP.md

### Development Philosophy
- Maximum granularity: Break every phase into very small, isolated tasks (ideally 6-8 tasks per phase)
- One responsibility per branch
- One logical change per commit
- Small and focused tasks only

### Important Constraints
- NEVER create a branch without my explicit approval
- NEVER commit without my explicit approval
- NEVER push to remote (I will review the code locally/server and push myself)
- ALWAYS wait for my confirmation before any git operation
- ALWAYS suggest a clear and descriptive commit message
- After implementation: summarize changes, explain architecture decisions, then wait for approval

### Working Process (Must Follow Every Time)
1. Analyze the task thoroughly
2. Propose a clear descriptive branch name (feature/, refactor/, fix/)
3. Provide a detailed implementation plan
4. Wait for my explicit approval before creating branch and starting work
5. After completing the work: summarize changes + explain decisions + suggest commit message
6. Wait for my approval before committing
7. Do NOT push

### Current Project Status
- Phase 1 is already completed
- We are working from Phase 2 onwards
- Using highly granular breakdown approach

### Reminder
- Human approval is mandatory before commits and merges
- Production quality code is required at all times
- Maintain consistent architecture across backend and frontend

---

**Confirmation Required at start of every conversation:**
"I have read CLAUDE-INSTRUCTIONS.md, git-workflow.md, workflow.md, and ROADMAP.md and will strictly follow all rules."