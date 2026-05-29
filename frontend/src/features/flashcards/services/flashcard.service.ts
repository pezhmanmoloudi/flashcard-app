import { apiClient } from '@/core/api/client'
import type { ApiResponse } from '@/shared/types'
import type { Flashcard, FlashcardParams } from '../types'

interface FlashcardListResponse {
  data: Flashcard[]
  meta: ApiResponse<Flashcard[]>['meta']
}

export const flashcardService = {
  async list(deckId: number, page = 1, perPage?: number): Promise<FlashcardListResponse> {
    const params: Record<string, number> = { page }
    if (perPage) params.per_page = perPage
    const { data } = await apiClient.get<FlashcardListResponse>(`/decks/${deckId}/flashcards`, {
      params,
    })
    return data
  },

  async show(id: number): Promise<Flashcard> {
    const { data } = await apiClient.get<ApiResponse<Flashcard>>(`/flashcards/${id}`)
    return data.data
  },

  async create(flashcardSetId: number, params: FlashcardParams): Promise<Flashcard> {
    const { data } = await apiClient.post<ApiResponse<Flashcard>>(
      `/flashcard_sets/${flashcardSetId}/flashcards`,
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

  async uploadImage(id: number, file: File): Promise<Flashcard> {
    const form = new FormData()
    form.append('flashcard[image]', file)
    const { data } = await apiClient.post<ApiResponse<Flashcard>>(
      `/flashcards/${id}/upload_image`,
      form,
      { headers: { 'Content-Type': undefined } },
    )
    return data.data
  },

  async uploadAudio(id: number, file: File): Promise<Flashcard> {
    const form = new FormData()
    form.append('flashcard[audio]', file)
    const { data } = await apiClient.post<ApiResponse<Flashcard>>(
      `/flashcards/${id}/upload_audio`,
      form,
      { headers: { 'Content-Type': undefined } },
    )
    return data.data
  },

  async removeImage(id: number): Promise<Flashcard> {
    const { data } = await apiClient.delete<ApiResponse<Flashcard>>(`/flashcards/${id}/image`)
    return data.data
  },

  async removeAudio(id: number): Promise<Flashcard> {
    const { data } = await apiClient.delete<ApiResponse<Flashcard>>(`/flashcards/${id}/audio`)
    return data.data
  },
}
