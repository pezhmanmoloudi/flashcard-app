import { ref } from 'vue'
import { extractError } from '@/shared/utils'
import type { Flashcard, FlashcardParams } from '../types'
import { flashcardService } from '../services/flashcard.service'

export function useFlashcard() {
  const flashcard = ref<Flashcard | null>(null)
  const loading = ref(false)
  const error = ref<string | null>(null)

  async function fetchFlashcard(id: number) {
    loading.value = true
    error.value = null
    try {
      flashcard.value = await flashcardService.show(id)
    } catch (e) {
      error.value = extractError(e)
    } finally {
      loading.value = false
    }
  }

  async function updateFlashcard(id: number, params: FlashcardParams): Promise<Flashcard | null> {
    loading.value = true
    error.value = null
    try {
      flashcard.value = await flashcardService.update(id, params)
      return flashcard.value
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
      flashcard.value = null
      return true
    } catch (e) {
      error.value = extractError(e)
      return false
    }
  }

  return { flashcard, loading, error, fetchFlashcard, updateFlashcard, destroyFlashcard }
}
