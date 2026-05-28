export type QuizType = 'fill_in_blank' | 'word_meaning' | 'mixed'
export type QuestionType = 'fill_in_blank' | 'word_meaning'

export interface QuizQuestion {
  id: number
  quiz_session_id: number
  flashcard_id: number
  question_type: QuestionType
  prompt: string
  options: string[]
  correct_answer: string
  user_answer: string | null
  answered_correctly: boolean | null
  answered: boolean
  position: number
}

export interface QuizSession {
  id: number
  deck_id: number
  quiz_type: QuizType
  total_questions: number
  correct_answers: number
  score: number
  completed: boolean
  completed_at: string | null
  created_at: string
  questions: QuizQuestion[]
}

export interface GenerateQuizParams {
  quiz_type?: QuizType
  count?: number
}

export interface SubmitAnswerParams {
  answer: string
}

export interface QuizResult {
  totalQuestions: number
  correctAnswers: number
  score: number
}
