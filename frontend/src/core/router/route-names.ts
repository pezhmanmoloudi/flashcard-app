export const ROUTE_NAMES = {
  // Auth
  AUTH_LOGIN: 'auth.login',
  AUTH_REGISTER: 'auth.register',

  // Decks & Flashcards
  DECKS: 'decks',
  DECK_NEW: 'decks.new',
  DECK_SHOW: 'decks.show',
  DECK_EDIT: 'decks.edit',

  // Flashcards
  FLASHCARD_NEW: 'decks.flashcards.new',
  FLASHCARD_EDIT: 'flashcards.edit',

  // Study
  STUDY: 'study',
  STUDY_SESSION: 'study.session',

  // Quizzes
  QUIZZES: 'quizzes',

  // Settings
  SETTINGS: 'settings',

  // Fallback
  NOT_FOUND: 'not-found',
} as const

export type RouteName = (typeof ROUTE_NAMES)[keyof typeof ROUTE_NAMES]
