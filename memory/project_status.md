---
name: project-status
description: Current backend initialization state and what has/has not been set up yet
metadata:
  type: project
---

Rails API initialized inside `backend/` using Rails 8.0.2.1, Ruby 3.2.2, PostgreSQL.
Sidekiq + Redis added as the background job system.

**Why:** Clean API foundation before adding auth and domain models.

**How to apply:** Do not re-initialize. Next step is JWT authentication, then core domain models.

Deliberately NOT set up yet:
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
- Directories: `app/services`, `app/serializers`, `app/policies`, `app/queries`
- Sidekiq 7 with Redis via `REDIS_URL` ENV (default: `redis://localhost:6379/0`)
- Queues: `critical`, `default`, `low` — concurrency: 5
- `ApplicationJob` retries on deadlock, discards on deserialization error
- Sidekiq Web UI mounted at `/sidekiq` in development only (needs auth middleware before production)
