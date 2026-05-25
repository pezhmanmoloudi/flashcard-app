# feature-architecture.md

Frontend Architecture:

Use feature-based frontend architecture.

Structure:

src/
├── app/
├── core/
├── features/
├── shared/
└── pages/

Definitions:

app/

* application bootstrap
* providers
* app configuration

core/

* API client
* auth
* router
* global infrastructure

features/

* domain-specific functionality

shared/

* reusable UI components
* utility functions
* shared composables

pages/

* route-level pages only

Feature Rules:

* Each feature owns its logic
* Keep features isolated
* Avoid cross-feature coupling
* Reuse shared modules only

Feature Example:

features/
└── flashcards/
├── components/
├── composables/
├── services/
├── stores/
├── tests/
└── types/

Important:
Avoid giant global architectures.
Prefer modular feature ownership.
