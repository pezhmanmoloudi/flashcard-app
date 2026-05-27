export type StudyRating = 'easy' | 'good' | 'hard' | 'again'

export interface StudySession {
  id: number
  flashcards_reviewed: number
  started_at: string
  completed_at?: string
}

export interface CardProgress {
  id: number
  flashcard_id: number
  repetitions: number
  easiness_factor: number
  interval_days: number
  next_review_at: string
}
