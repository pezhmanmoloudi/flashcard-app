# ARCHITECTURE.md

# System Overview

This application is a production-grade flashcard learning platform.

Supported languages:

* German
* English
* Persian

Language pairs:

* German ↔ Persian
* German ↔ English
* English ↔ Persian

Core Features:

* spaced repetition
* flashcard study
* quizzes
* daily study sessions
* onboarding
* progress tracking
* audio/image support

---

# Technology Stack

## Frontend

* Vue 3
* TypeScript
* Pinia
* Vue Router
* Tailwind CSS
* Axios

## Backend

* Ruby on Rails API
* PostgreSQL
* Redis
* Sidekiq

---

# High-Level Architecture

Frontend:
SPA application using feature-based architecture.

Backend:
RESTful Rails API using service-oriented architecture.

Communication:
JSON APIs with JWT authentication.

---

# Frontend Architecture

Structure:

frontend/src/
├── app/
├── core/
├── features/
├── shared/
└── pages/

---

# Frontend Layers

## app/

Application bootstrap and global providers.

Contains:

* app initialization
* root providers
* app configuration

---

## core/

Global infrastructure.

Contains:

* API client
* authentication
* router
* app configuration

---

## features/

Business domain modules.

Examples:

* auth
* flashcards
* study
* quizzes
* onboarding
* settings

Each feature may contain:

* components
* composables
* services
* stores
* tests
* types

---

## shared/

Reusable shared resources.

Contains:

* UI components
* utility functions
* shared composables
* constants
* types

---

## pages/

Route-level pages only.

Pages should:

* stay lightweight
* avoid business logic
* orchestrate features

---

# Frontend Engineering Rules

* Composition API only
* TypeScript everywhere
* composables-first logic
* reusable components
* mobile-first UI
* accessible interfaces

---

# State Management Strategy

Pinia is only for:

* auth state
* theme state
* user settings

Feature logic belongs in composables.

Avoid giant stores.

---

# Backend Architecture

Structure:

backend/app/
├── controllers/api/v1
├── models
├── services
├── serializers
├── jobs
├── policies
└── queries

---

# Backend Engineering Rules

* thin controllers
* service objects
* RESTful APIs
* explicit business logic
* JSON-only responses

---

# Core Domain Models

## User

Authenticated platform user.

---

## Flashcard

Core learning entity.

Fields:

* source_language
* target_language
* front_text
* back_text
* example_sentence

Attachments:

* image
* audio

---

## CardProgress

Tracks spaced repetition state.

Fields:

* repetitions
* easiness_factor
* interval_days
* next_review_at

---

## StudySession

Tracks learning sessions.

---

## Quiz

Tracks quiz attempts and scores.

---

# Study Flow

1. User starts study session
2. Backend selects due flashcards
3. Frontend displays flashcards
4. User flips card
5. User marks known/unknown
6. SM-2 algorithm updates progress

---

# Quiz Flow

Quiz Types:

1. Fill-in-the-blank
2. Word meaning in sentence

Questions are generated dynamically from flashcards.

---

# Security Rules

* JWT authentication
* authorization checks
* input validation
* upload validation
* secure API responses

---

# Performance Rules

Frontend:

* lazy-loaded routes
* optimized rendering
* responsive UI

Backend:

* optimized queries
* eager loading
* pagination
* background jobs

---

# Design Philosophy

The platform should feel:

* calm
* minimal
* focused
* distraction-free

Inspired by:

* Anki
* Duolingo
* Quizlet
* Notion
