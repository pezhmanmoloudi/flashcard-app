import { apiClient } from '@/core/api/client'
import type { ApiResponse } from '@/shared/types'
import type { FlashcardSet, FlashcardSetParams } from '../types'

export const flashcardSetService = {
  async list(deckId: number): Promise<FlashcardSet[]> {
    const { data } = await apiClient.get<ApiResponse<FlashcardSet[]>>(
      `/decks/${deckId}/flashcard_sets`,
    )
    return data.data
  },

  async show(id: number): Promise<FlashcardSet> {
    const { data } = await apiClient.get<ApiResponse<FlashcardSet>>(`/flashcard_sets/${id}`)
    return data.data
  },

  async create(deckId: number, params: FlashcardSetParams): Promise<FlashcardSet> {
    const { data } = await apiClient.post<ApiResponse<FlashcardSet>>(
      `/decks/${deckId}/flashcard_sets`,
      { flashcard_set: params },
    )
    return data.data
  },

  async update(id: number, params: FlashcardSetParams): Promise<FlashcardSet> {
    const { data } = await apiClient.put<ApiResponse<FlashcardSet>>(
      `/flashcard_sets/${id}`,
      { flashcard_set: params },
    )
    return data.data
  },

  async destroy(id: number): Promise<void> {
    await apiClient.delete(`/flashcard_sets/${id}`)
  },
}
