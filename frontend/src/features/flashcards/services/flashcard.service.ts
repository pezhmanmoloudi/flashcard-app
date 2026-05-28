import { apiClient } from '@/core/api/client'
import type { ApiResponse } from '@/shared/types'
import type { Flashcard, FlashcardParams } from '../types'

interface FlashcardListResponse {
  data: Flashcard[]
  meta: ApiResponse<Flashcard[]>['meta']
}

export const flashcardService = {
  async list(deckId: number, page = 1): Promise<FlashcardListResponse> {
    const { data } = await apiClient.get<FlashcardListResponse>(`/decks/${deckId}/flashcards`, {
      params: { page },
    })
    return data
  },

  async show(id: number): Promise<Flashcard> {
    const { data } = await apiClient.get<ApiResponse<Flashcard>>(`/flashcards/${id}`)
    return data.data
  },

  async create(deckId: number, params: FlashcardParams): Promise<Flashcard> {
    const { data } = await apiClient.post<ApiResponse<Flashcard>>(
      `/decks/${deckId}/flashcards`,
      { flashcard: params },
    )
    return data.data
  },

  async update(id: number, params: FlashcardParams): Promise<Flashcard> {
    const { data } = await apiClient.put<ApiResponse<Flashcard>>(
      `/flashcards/${id}`,
      { flashcard: params },
    )
    return data.data
  },

  async destroy(id: number): Promise<void> {
    await apiClient.delete(`/flashcards/${id}`)
  },
}
