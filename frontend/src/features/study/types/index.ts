export type StudyRating = 'easy' | 'good' | 'hard' | 'again'

export interface StudySession {
  id: number
  deck_id: number
  cards_studied: number
  completed: boolean
  completed_at?: string
  created_at: string
}

export interface UpdateStudySessionParams {
  cards_studied?: number
}

export interface CardProgress {
  id: number
  flashcard_id: number
  repetitions: number
  easiness_factor: number
  interval_days: number
  next_review_at: string
  due: boolean
}

export interface CardProgressParams {
  repetitions: number
  easiness_factor: number
  interval_days: number
  next_review_at: string
}

export interface UserStats {
  total_cards_studied: number
  total_sessions: number
  study_streak: number
  cards_mastered: number
}

export interface DeckStats {
  total_cards: number
  new_count: number
  due_count: number
  mastered_count: number
  learning_count: number
}

export interface ReviewQueueSet {
  id: number
  name: string
  position: number
  due_count: number
}

export interface ReviewQueueDeck {
  id: number
  name: string
  description: string | null
  level: string
  language_pair: string
  total_due: number
  flashcard_sets: ReviewQueueSet[]
}

export interface InboxQueueSet {
  id: number
  name: string
  position: number
  due_count: number
  waiting_count: number
}

export interface InboxQueueDeck {
  id: number
  name: string
  level: string
  language_pair: string
  total_due: number
  total_waiting: number
  flashcard_sets: InboxQueueSet[]
}

// Review queue — unified per-language-pair summary (inbox + SM-2 due)
export interface ReviewQueueSummaryItem {
  language_pair: string
  inbox_due: number
  sm2_due: number
  total_due: number
  inbox_waiting: number  // inbox cards scheduled for a future date, not yet reviewable
}

// Review session returned by POST /review_sessions
export interface ReviewSession {
  id: number
  language_pair: string
  cards_reviewed: number
  completed: boolean
  completed_at?: string
  created_at: string
}

// Card returned by GET /review_sessions/:id/cards — extends Flashcard with metadata
export interface ReviewCard {
  id: number
  flashcard_set_id: number
  deck_id: number
  front_text: string
  back_text: string
  source_language: string
  target_language: string
  example_sentence?: string
  translated_sentence?: string
  grammar_notes?: string
  image_url?: string
  audio_url?: string
  created_at: string
  set_name: string
  deck_name: string
  deck_level: string | null
}
