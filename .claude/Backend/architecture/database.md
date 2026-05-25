# database.md

Database Architecture Rules:

Database:

* PostgreSQL

Rules:

* add indexes intentionally
* use foreign keys
* validate constraints at DB level
* avoid duplicated data

Migrations:

* keep migrations reversible
* avoid dangerous migrations
* separate schema and data migrations

Performance:

* avoid N+1 queries
* use eager loading
* paginate large queries

Naming:

* clear table names
* explicit column names

Important:
Database design affects long-term scalability.
