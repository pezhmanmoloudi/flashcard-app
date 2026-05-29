import { apiClient } from '@/core/api/client'
import type { ApiResponse } from '@/shared/types'
import type { Flashcard } from '@/features/flashcards/types'
import type {
  StudySession,
  UpdateStudySessionParams,
  CardProgress,
  CardProgressParams,
  StudyRating,
  UserStats,
  DeckStats,
  ReviewQueueDeck,
} from '../types'

interface StudySessionListResponse {
  data: StudySession[]
  meta: ApiResponse<StudySession[]>['meta']
}

export const studyService = {
  async fetchReviewQueue(): Promise<ReviewQueueDeck[]> {
    const { data } = await apiClient.get<ApiResponse<ReviewQueueDeck[]>>('/study/queue')
    return data.data
  },

  async getDueCards(deckId: number, setId?: number, reviewsOnly = false): Promise<Flashcard[]> {
    const params: Record<string, unknown> = {}
    if (setId) params.flashcard_set_id = setId
    if (reviewsOnly) params.reviews_only = 'true'
    const { data } = await apiClient.get<ApiResponse<Flashcard[]>>(
      `/decks/${deckId}/due_flashcards`,
      { params },
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

  async reviewCard(flashcardId: number, rating: StudyRating): Promise<CardProgress> {
    const { data } = await apiClient.post<ApiResponse<CardProgress>>(
      `/flashcards/${flashcardId}/progress/review`,
      { rating },
    )
    return data.data
  },

  async fetchUserStats(): Promise<UserStats> {
    const { data } = await apiClient.get<ApiResponse<UserStats>>('/stats')
    return data.data
  },

  async fetchDeckStats(deckId: number): Promise<DeckStats> {
    const { data } = await apiClient.get<ApiResponse<DeckStats>>(`/decks/${deckId}/stats`)
    return data.data
  },
}
