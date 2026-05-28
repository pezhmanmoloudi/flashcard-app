import { ref } from 'vue'
import type { PaginationMeta } from '@/shared/types'
import { extractError } from '@/shared/utils'
import type { Deck, DeckParams } from '../types'
import { deckService } from '../services/deck.service'

export function useDecks() {
  const decks = ref<Deck[]>([])
  const meta = ref<PaginationMeta | null>(null)
  const loading = ref(false)
  const error = ref<string | null>(null)

  async function fetchDecks(page = 1) {
    loading.value = true
    error.value = null
    try {
      const result = await deckService.list(page)
      decks.value = result.data
      meta.value = result.meta ?? null
    } catch (e) {
      error.value = extractError(e)
    } finally {
      loading.value = false
    }
  }

  async function createDeck(params: DeckParams): Promise<Deck | null> {
    loading.value = true
    error.value = null
    try {
      const deck = await deckService.create(params)
      decks.value.unshift(deck)
      return deck
    } catch (e) {
      error.value = extractError(e)
      return null
    } finally {
      loading.value = false
    }
  }

  async function destroyDeck(id: number): Promise<boolean> {
    error.value = null
    try {
      await deckService.destroy(id)
      decks.value = decks.value.filter((d) => d.id !== id)
      return true
    } catch (e) {
      error.value = extractError(e)
      return false
    }
  }

  return { decks, meta, loading, error, fetchDecks, createDeck, destroyDeck }
}
