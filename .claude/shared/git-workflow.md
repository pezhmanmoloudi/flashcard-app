# git-workflow.md

Git Workflow Rules:

Development Philosophy:

* small isolated tasks
* one responsibility per branch
* one logical change per commit
* human review before commit
* human approval before merge

Branch Rules:

* create a dedicated branch for every task
* use descriptive branch names
* avoid working directly on main branch

Branch Naming:

* feature/auth-foundation
* feature/rails-api-init
* feature/sidekiq-setup
* feature/api-versioning
* refactor/service-architecture
* fix/auth-bug

Task Decomposition:

* split large tasks into smaller tasks
* each task should stay focused
* avoid giant implementation phases

Implementation Rules:
Before writing code:

1. analyze the requested task
2. split task into smaller subtasks
3. propose branch names
4. explain implementation plan

Commit Rules:

* NEVER auto-commit without user approval
* ALWAYS ask before git commit
* ALWAYS suggest commit message
* keep commit messages descriptive

Commit Message Examples:

* Initialize Rails API structure
* Setup Sidekiq and Redis
* Add API versioning structure
* Configure RuboCop and RSpec

Review Workflow:
After implementation:

1. summarize changes
2. explain architecture decisions
3. suggest commit message
4. wait for user approval before commit

Merge Rules:

* never merge automatically
* user reviews every branch manually

Important:
Human approval is required before:

* commits
* merges
* destructive operations

## AI Development Instructions (Claude)

When working with Claude Code, also follow the specific instructions defined in:
- shared/CLAUDE-INSTRUCTIONS.md

This ensures consistent granularity, approval workflow, and proper git practices during AI-assisted development.