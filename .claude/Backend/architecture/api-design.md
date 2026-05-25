# api-design.md

API Design Rules:

Architecture:

* RESTful APIs
* JSON responses only
* versioned APIs

Structure:

* /api/v1/

Rules:

* consistent response structure
* proper HTTP status codes
* descriptive error messages
* avoid deeply nested routes

Examples:
GET /flashcards
POST /flashcards
PATCH /flashcards/:id

Error Responses:

* validation errors
* authorization errors
* not found errors

Important:
APIs should stay predictable and easy to consume.
