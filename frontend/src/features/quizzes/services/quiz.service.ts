import { apiClient } from '@/core/api/client'
import type { ApiResponse } from '@/shared/types'
import type {
  QuizSession,
  QuizQuestion,
  GenerateQuizParams,
  SubmitAnswerParams,
} from '../types'

interface QuizSessionListResponse {
  data: QuizSession[]
  meta: ApiResponse<QuizSession[]>['meta']
}

export const quizService = {
  async list(page = 1): Promise<QuizSessionListResponse> {
    const { data } = await apiClient.get<QuizSessionListResponse>('/quiz_sessions', {
      params: { page },
    })
    return data
  },

  async get(id: number): Promise<QuizSession> {
    const { data } = await apiClient.get<ApiResponse<QuizSession>>(`/quiz_sessions/${id}`)
    return data.data
  },

  async generate(deckId: number, params: GenerateQuizParams = {}): Promise<QuizSession> {
    const { data } = await apiClient.post<ApiResponse<QuizSession>>(
      `/decks/${deckId}/quiz_sessions`,
      params,
    )
    return data.data
  },

  async complete(id: number): Promise<QuizSession> {
    const { data } = await apiClient.patch<ApiResponse<QuizSession>>(`/quiz_sessions/${id}`)
    return data.data
  },

  async submitAnswer(questionId: number, params: SubmitAnswerParams): Promise<QuizQuestion> {
    const { data } = await apiClient.post<ApiResponse<QuizQuestion>>(
      `/quiz_questions/${questionId}/answer`,
      { quiz_question: params },
    )
    return data.data
  },
}
