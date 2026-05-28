import { apiClient } from '@/core/api/client'
import type { ApiResponse } from '@/shared/types'
import type { Flashcard } from '@/features/flashcards/types'
import type {
  StudySession,
  UpdateStudySessionParams,
  CardProgress,
  CardProgressParams,
} from '../types'

interface StudySessionListResponse {
  data: StudySession[]
  meta: ApiResponse<StudySession[]>['meta']
}

export const studyService = {
  async getDueCards(deckId: number): Promise<Flashcard[]> {
    const { data } = await apiClient.get<ApiResponse<Flashcard[]>>(
      `/decks/${deckId}/due_flashcards`,
    )
    return data.data
  },

  async listSessions(page = 1): Promise<StudySessionListResponse> {
    const { data } = await apiClient.get<StudySessionListResponse>('/study_sessions', {
      params: { page },
    })
    return data
  },

  async startSession(deckId: number): Promise<StudySession> {
    const { data } = await apiClient.post<ApiResponse<StudySession>>(
      `/decks/${deckId}/study_sessions`,
    )
    return data.data
  },

  async updateSession(id: number, params: UpdateStudySessionParams): Promise<StudySession> {
    const { data } = await apiClient.put<ApiResponse<StudySession>>(
      `/study_sessions/${id}`,
      { study_session: params },
    )
    return data.data
  },

  async fetchProgress(flashcardId: number): Promise<CardProgress> {
    const { data } = await apiClient.get<ApiResponse<CardProgress>>(
      `/flashcards/${flashcardId}/progress`,
    )
    return data.data
  },

  async createProgress(flashcardId: number, params: CardProgressParams): Promise<CardProgress> {
    const { data } = await apiClient.post<ApiResponse<CardProgress>>(
      `/flashcards/${flashcardId}/progress`,
      { card_progress: params },
    )
    return data.data
  },

  async updateProgress(flashcardId: number, params: CardProgressParams): Promise<CardProgress> {
    const { data } = await apiClient.put<ApiResponse<CardProgress>>(
      `/flashcards/${flashcardId}/progress`,
      { card_progress: params },
    )
    return data.data
  },
}
