# background-jobs.md

Background Job Rules:

System:

* Sidekiq
* Redis

Use Jobs For:

* quiz generation
* email sending
* media processing
* analytics
* heavy computations

Rules:

* jobs must be idempotent
* avoid long blocking tasks
* retry safely

Naming:

* GenerateQuizJob
* ProcessAudioJob

Important:
Background jobs improve responsiveness and scalability.
