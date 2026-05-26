---
name: project-status
description: Current backend initialization state and what has/has not been set up yet
metadata:
  type: project
---

Rails API initialized inside `backend/` using Rails 8.0.2.1, Ruby 3.2.2, PostgreSQL.

**Why:** First backend milestone — clean API foundation before adding auth, models, and jobs.

**How to apply:** Do not re-initialize. Next steps are: authentication (JWT), core domain models (User, Flashcard, CardProgress, StudySession, Quiz), then Sidekiq.

Deliberately NOT set up yet (per user instructions):
- Sidekiq / Redis
- JWT authentication
- Docker

Key decisions made:
- Module name is `FlashcardApi` (not `Backend`)
- Databases named `flashcard_development/test/production`
- DB credentials via ENV vars (`DB_HOST`, `DB_USERNAME`, `DB_PASSWORD`, `DATABASE_URL` for prod)
- CORS origins via `ALLOWED_ORIGINS` ENV var (default: `http://localhost:5173`)
- RSpec + FactoryBot + Shoulda Matchers installed
- `ApplicationService` base PORO in `app/services/`
- `Api::V1::BaseController` in `app/controllers/api/v1/`
- Directories created: `app/services`, `app/serializers`, `app/policies`, `app/queries`
