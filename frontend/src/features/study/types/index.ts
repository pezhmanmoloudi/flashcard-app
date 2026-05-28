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
