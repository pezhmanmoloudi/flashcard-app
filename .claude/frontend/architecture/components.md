# components.md

Vue Component Rules:

* Components must stay focused
* Prefer reusable UI components
* Avoid giant components
* Split components aggressively

Rules:

* Components over 200 lines should be split
* Separate UI from business logic
* Avoid duplicated UI logic
* Prefer props/emits over tight coupling

Component Types:

1. UI Components
   Reusable presentational components.

Examples:

* BaseButton
* BaseInput
* FlashcardCard

2. Feature Components
   Feature-specific smart components.

Examples:

* QuizQuestion
* StudySessionCard

3. Page Components
   Route-level orchestration only.

Page Rules:

* Avoid business logic
* Keep pages lightweight
* Delegate logic to composables

Important:
Avoid God Components.
