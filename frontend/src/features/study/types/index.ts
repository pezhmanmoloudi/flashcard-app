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
  completed_at?: string
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
