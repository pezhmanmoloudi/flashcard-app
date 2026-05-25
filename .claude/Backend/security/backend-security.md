# backend-security.md

Backend Security Rules:

Validation:

* validate all inputs
* sanitize uploaded files
* whitelist allowed parameters

API Security:

* rate limiting
* request validation
* authorization checks

Uploads:

* validate file size
* validate file type
* avoid unsafe uploads

Database:

* avoid raw SQL injection risks
* use parameterized queries

Errors:

* never expose internal stack traces
* return safe error responses

Important:
Backend security is mandatory.
