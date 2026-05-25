# flashcard-domain.md

# Flashcard Domain Rules

Project Type:
Language learning flashcard platform.

Supported Languages:

* German
* English
* Persian

Supported Language Pairs:

* German ↔ Persian
* German ↔ English
* English ↔ Persian

Core Learning Philosophy:

* active recall
* spaced repetition
* daily consistency
* low cognitive friction
* focused learning experience

---

# Core Domain Concepts

## Flashcard

The primary learning entity.

A flashcard contains:

* front content
* back content
* optional example sentence
* optional image
* optional audio

Flashcards may support:

* text
* pronunciation
* translations
* contextual examples

Important:
Flashcards should stay simple and focused.

---

## Card Progress

Tracks learning state for each user/card pair.

Tracks:

* repetitions
* easiness factor
* review interval
* next review date
* success/failure history

Purpose:
Drive spaced repetition scheduling.

---

## Study Session

Represents a learning session.

Contains:

* reviewed cards
* correct answers
* failed answers
* session duration
* study statistics

Rules:

* sessions should feel lightweight
* minimize unnecessary friction
* optimize for consistency

---

## Quiz System

Purpose:
Reinforce learning through active testing.

Quiz Types:

1. Fill-in-the-blank
2. Meaning selection
3. Sentence context questions

Rules:

* quizzes should remain short
* questions should feel focused
* avoid overwhelming users

---

# Spaced Repetition

Learning Algorithm:
SM-2 inspired scheduling system.

Core Variables:

* easiness factor
* repetition count
* interval days

Rules:

* difficult cards appear more frequently
* mastered cards appear less frequently
* scheduling should adapt dynamically

Purpose:
Optimize long-term memory retention.

---

# Learning Experience Philosophy

The platform should feel:

* calm
* minimal
* motivating
* distraction-free

Avoid:

* excessive gamification
* noisy interfaces
* overwhelming dashboards
* unnecessary animations

Prioritize:

* fast study flow
* low mental load
* readability
* smooth interactions

---

# Flashcard UX Rules

Study Flow:

1. Show front side
2. User attempts recall
3. User flips card
4. User self-evaluates
5. Progress updates automatically

Important:
The study experience must remain extremely fast.

---

# Quiz UX Rules

Quiz sessions should:

* stay short
* provide immediate feedback
* encourage repetition
* reduce frustration

Avoid:

* long difficult exams
* excessive interruption
* confusing UI

---

# Media Support

Supported Media:

* images
* pronunciation audio

Rules:

* media should support learning
* avoid distracting visuals
* optimize media sizes
* lazy-load large assets

---

# Accessibility Philosophy

Learning should remain accessible.

Requirements:

* readable typography
* keyboard accessibility
* accessible contrast
* responsive layouts
* mobile-friendly interactions

---

# Mobile Learning Philosophy

Most users study on mobile devices.

Optimize for:

* one-handed usage
* quick interactions
* touch-friendly UI
* short study sessions

---

# Data Philosophy

Track:

* learning progress
* review history
* study streaks
* quiz performance

Avoid:

* unnecessary personal data collection

---

# Engineering Philosophy

Frontend:

* fast interactions
* reusable UI
* composables-first logic

Backend:

* service-oriented architecture
* scalable scheduling logic
* optimized queries

Important:
The platform should optimize for long-term maintainability and learning effectiveness.
