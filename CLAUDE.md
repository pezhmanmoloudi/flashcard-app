# CLAUDE.md

# Project Overview

This project is a production-grade flashcard learning platform.

Supported language pairs:

* German ↔ Persian
* German ↔ English
* English ↔ Persian

The application focuses on:

* spaced repetition
* daily study sessions
* quizzes
* progress tracking
* onboarding
* audio/image support

Frontend:

* Vue 3
* TypeScript
* Pinia
* Tailwind CSS

Backend:

* Ruby on Rails API
* PostgreSQL
* Redis
* Sidekiq

---

# Engineering Philosophy

* simplicity over complexity
* readability over cleverness
* composition over inheritance
* scalable architecture
* reusable modules
* production-ready code

---

# Frontend Architecture

Frontend follows:

* feature-based architecture
* Composition API
* composables-first logic
* reusable UI system

Important frontend rules:

* business logic belongs in composables
* Pinia only for shared global state
* components should stay small and focused
* mobile-first UI
* accessibility-first design

---

# Backend Architecture

Backend follows:

* service object architecture
* thin controllers
* RESTful APIs
* explicit business logic
* scalable database design

Important backend rules:

* controllers orchestrate only
* business logic belongs in services
* avoid fat models
* avoid N+1 queries
* background jobs for heavy tasks

---

# Project Structure

project/
│
├── backend/
├── frontend/
│
├── CLAUDE.md
├── ROADMAP.md
├── ARCHITECTURE.md
│
└── .claude/

---

# Skill Structure

.claude/
│
├── shared/
├── frontend/
└── backend/

Read relevant skills before implementing features.

---

# Frontend Skills

frontend/
├── architecture/
├── ui-ux/
├── security/
├── performance/
├── testing/
└── workflow/

---

# Backend Skills

backend/
├── architecture/
├── security/
├── performance/
├── testing/
└── workflow/

---

# Development Workflow

Before implementing features:

1. Read ARCHITECTURE.md
2. Read relevant skill files
3. Review ROADMAP.md
4. Follow feature-based architecture
5. Write tests
6. Refactor before completion

---

# UI/UX Philosophy

The application should feel:

* calm
* minimal
* distraction-free
* learning-focused

Inspired by:

* Anki
* Quizlet
* Duolingo
* Notion

---

# Performance Goals

Frontend:

* fast interactions
* optimized rendering
* lazy-loaded routes

Backend:

* optimized queries
* scalable APIs
* background processing

---

# Security Goals

* JWT authentication
* secure uploads
* authorization checks
* safe API responses
* input validation everywhere

---

# Important

This is a long-term scalable production application.

Prioritize:

* maintainability
* readability
* scalability
* predictable architecture
* clean code
