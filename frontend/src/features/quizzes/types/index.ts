export type QuizType = 'fill_in_blank' | 'word_meaning'

export interface QuizQuestion {
  id: number
  type: QuizType
  question: string
  options?: string[]
  correct_answer: string
}

export interface QuizSession {
  id: number
  questions: QuizQuestion[]
  score?: number
  completed_at?: string
}
