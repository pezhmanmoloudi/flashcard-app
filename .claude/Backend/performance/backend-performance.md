# backend-performance.md

Backend Performance Rules:

Queries:

* avoid N+1 queries
* use includes/preload/eager_load
* paginate large collections

Caching:

* cache expensive computations
* avoid unnecessary DB hits

Jobs:

* move heavy logic to Sidekiq
* avoid blocking requests

Monitoring:

* track slow queries
* monitor API response times

Important:
Performance directly affects learning experience.
