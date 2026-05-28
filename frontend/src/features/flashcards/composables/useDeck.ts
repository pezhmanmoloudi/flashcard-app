import { ref } from 'vue'
import { extractError } from '@/shared/utils'
import type { Deck, DeckParams } from '../types'
import { deckService } from '../services/deck.service'

export function useDeck() {
  const deck = ref<Deck | null>(null)
  const loading = ref(false)
  const error = ref<string | null>(null)

  async function fetchDeck(id: number) {
    loading.value = true
    error.value = null
    try {
      deck.value = await deckService.show(id)
    } catch (e) {
      error.value = extractError(e)
    } finally {
      loading.value = false
    }
  }

  async function updateDeck(id: number, params: DeckParams): Promise<Deck | null> {
    loading.value = true
    error.value = null
    try {
      deck.value = await deckService.update(id, params)
      return deck.value
    } catch (e) {
      error.value = extractError(e)
      return null
    } finally {
      loading.value = false
    }
  }

  return { deck, loading, error, fetchDeck, updateDeck }
}
