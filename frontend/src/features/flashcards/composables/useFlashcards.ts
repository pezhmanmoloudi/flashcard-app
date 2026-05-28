import { ref } from 'vue'
import type { PaginationMeta } from '@/shared/types'
import { extractError } from '@/shared/utils'
import type { Flashcard, FlashcardParams } from '../types'
import { flashcardService } from '../services/flashcard.service'

export function useFlashcards() {
  const flashcards = ref<Flashcard[]>([])
  const meta = ref<PaginationMeta | null>(null)
  const loading = ref(false)
  const error = ref<string | null>(null)

  async function fetchFlashcards(deckId: number, page = 1) {
    loading.value = true
    error.value = null
    try {
      const result = await flashcardService.list(deckId, page)
      flashcards.value = result.data
      meta.value = result.meta ?? null
    } catch (e) {
      error.value = extractError(e)
    } finally {
      loading.value = false
    }
  }

  async function createFlashcard(deckId: number, params: FlashcardParams): Promise<Flashcard | null> {
    loading.value = true
    error.value = null
    try {
      const flashcard = await flashcardService.create(deckId, params)
      flashcards.value.unshift(flashcard)
      return flashcard
    } catch (e) {
      error.value = extractError(e)
      return null
    } finally {
      loading.value = false
    }
  }

  async function destroyFlashcard(id: number): Promise<boolean> {
    error.value = null
    try {
      await flashcardService.destroy(id)
      flashcards.value = flashcards.value.filter((f) => f.id !== id)
      return true
    } catch (e) {
      error.value = extractError(e)
      return false
    }
  }

  return { flashcards, meta, loading, error, fetchFlashcards, createFlashcard, destroyFlashcard }
}
