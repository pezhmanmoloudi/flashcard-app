import { apiClient } from '@/core/api/client'
import type { ApiResponse } from '@/shared/types'
import type { Deck, DeckParams } from '../types'

interface DeckListResponse {
  data: Deck[]
  meta: ApiResponse<Deck[]>['meta']
}

export const deckService = {
  async list(page = 1, perPage?: number): Promise<DeckListResponse> {
    const params: Record<string, number> = { page }
    if (perPage) params.per_page = perPage
    const { data } = await apiClient.get<DeckListResponse>('/decks', { params })
    return data
  },

  async show(id: number): Promise<Deck> {
    const { data } = await apiClient.get<ApiResponse<Deck>>(`/decks/${id}`)
    return data.data
  },

  async create(params: DeckParams): Promise<Deck> {
    const { data } = await apiClient.post<ApiResponse<Deck>>('/decks', { deck: params })
    return data.data
  },

  async update(id: number, params: DeckParams): Promise<Deck> {
    const { data } = await apiClient.put<ApiResponse<Deck>>(`/decks/${id}`, { deck: params })
    return data.data
  },

  async destroy(id: number): Promise<void> {
    await apiClient.delete(`/decks/${id}`)
  },
}
