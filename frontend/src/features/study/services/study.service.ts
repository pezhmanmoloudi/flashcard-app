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
  InboxQueueDeck,
  ReviewQueueSummaryItem,
  ReviewSession,
  ReviewCard,
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

  async getDueCards(deckId: number, setId?: number): Promise<Flashcard[]> {
    const params: Record<string, unknown> = {}
    if (setId) params.flashcard_set_id = setId
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
    const { data } = await apiClient.patch<ApiResponse<StudySession>>(
      `/study_sessions/${id}`,
      { study_session: params },
    )
    return data.data
  },

  async reviewCardInSession(
    sessionId: number,
    flashcardId: number,
    rating: StudyRating,
    responseTimeMs?: number,
  ): Promise<CardProgress> {
    const { data } = await apiClient.post<ApiResponse<CardProgress>>(
      `/study_sessions/${sessionId}/reviews`,
      { flashcard_id: flashcardId, result: rating, response_time_ms: responseTimeMs },
    )
    return data.data
  },

  async completeSession(sessionId: number): Promise<StudySession> {
    const { data } = await apiClient.post<ApiResponse<StudySession>>(
      `/study_sessions/${sessionId}/complete`,
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

  async fetchInbox(): Promise<InboxQueueDeck[]> {
    const { data } = await apiClient.get<ApiResponse<InboxQueueDeck[]>>('/study/inbox')
    return data.data
  },

  // ── Review Queue (language-pair scoped) ──────────────────────────────────

  async fetchReviewSummary(): Promise<ReviewQueueSummaryItem[]> {
    const { data } = await apiClient.get<ApiResponse<ReviewQueueSummaryItem[]>>('/study/review')
    return data.data
  },

  async startReviewSession(languagePair: string): Promise<ReviewSession> {
    const { data } = await apiClient.post<ApiResponse<ReviewSession>>(
      '/review_sessions',
      { language_pair: languagePair },
    )
    return data.data
  },

  async getReviewCards(sessionId: number, includeWaiting = false): Promise<ReviewCard[]> {
    const params: Record<string, string> = {}
    if (includeWaiting) params.include_waiting = 'true'
    const { data } = await apiClient.get<ApiResponse<ReviewCard[]>>(
      `/review_sessions/${sessionId}/cards`,
      { params },
    )
    return data.data
  },

  async reviewCardInReviewSession(
    sessionId: number,
    flashcardId: number,
    rating: StudyRating,
    responseTimeMs?: number,
  ): Promise<CardProgress> {
    const { data } = await apiClient.post<ApiResponse<CardProgress>>(
      `/review_sessions/${sessionId}/reviews`,
      { flashcard_id: flashcardId, result: rating, response_time_ms: responseTimeMs },
    )
    return data.data
  },

  async completeReviewSession(sessionId: number): Promise<ReviewSession> {
    const { data } = await apiClient.post<ApiResponse<ReviewSession>>(
      `/review_sessions/${sessionId}/complete`,
    )
    return data.data
  },
}
