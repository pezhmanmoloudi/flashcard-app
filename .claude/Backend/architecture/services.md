# services.md

Service Object Rules:

Purpose:
Encapsulate business logic.

Rules:

* controllers orchestrate only
* services contain workflows
* services should stay focused
* avoid giant services

Naming:

* CreateFlashcardService
* GenerateQuizService
* UpdateCardProgressService

Responsibilities:

* business workflows
* transactions
* orchestration
* external integrations

Avoid:

* view logic
* rendering
* direct controller concerns

Transactions:

* use transactions for critical workflows
* keep transactions small

Important:
Business logic belongs in services.
