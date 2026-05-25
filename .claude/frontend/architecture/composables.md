# composables.md

Composables Architecture Rules:

Purpose:
Reusable business logic.

Rules:

* Business logic belongs in composables
* Keep composables feature-focused
* Prefer composables over giant stores
* Avoid duplicated async logic

Naming Rules:

* useAuth
* useQuiz
* useStudySession
* useFlashcards

Responsibilities:

* API calls
* async state
* reusable workflows
* feature logic

Avoid:

* giant composables
* UI rendering logic
* direct DOM manipulation

Async Rules:

* expose loading states
* expose error states
* use try/catch properly

Important:
Composables should be predictable and reusable.
