# state-management.md

Pinia State Management Rules:

Purpose:
Global shared application state only.

Do NOT use Pinia for:

* temporary form state
* local modal state
* component-only state

Allowed Global State:

* auth
* theme
* user settings
* global preferences

Rules:

* Keep stores small
* Avoid giant stores
* Keep actions focused
* Avoid duplicated state

Store Naming:

* useAuthStore
* useSettingsStore

Architecture:

* feature state belongs in composables
* global state belongs in Pinia

Important:
Prefer local state whenever possible.
