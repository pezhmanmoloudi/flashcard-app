# routing.md

Vue Router Rules:

Architecture:

* organize routes by feature
* lazy-load route pages
* use route guards for auth

Structure:
router/
├── index.ts
├── guards/
└── routes/

Rules:

* Route pages belong in pages/
* Avoid business logic in router
* Use typed route names when possible

Authentication:

* protect authenticated routes
* redirect unauthorized users
* preserve intended destination

Performance:

* lazy-load large routes
* split bundles by route

Important:
Routing should stay predictable and simple.
