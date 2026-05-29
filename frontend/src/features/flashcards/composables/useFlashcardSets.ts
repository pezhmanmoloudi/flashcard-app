import { ref } from 'vue'
import { extractError } from '@/shared/utils'
import type { FlashcardSet, FlashcardSetParams } from '../types'
import { flashcardSetService } from '../services/flashcard-set.service'

export function useFlashcardSets() {
  const flashcardSets = ref<FlashcardSet[]>([])
  const loading = ref(false)
  const error = ref<string | null>(null)

  async function fetchFlashcardSets(deckId: number) {
    loading.value = true
    error.value = null
    try {
      flashcardSets.value = await flashcardSetService.list(deckId)
    } catch (e) {
      error.value = extractError(e)
    } finally {
      loading.value = false
    }
  }

  async function createFlashcardSet(deckId: number, params: FlashcardSetParams): Promise<FlashcardSet | null> {
    loading.value = true
    error.value = null
    try {
      const set = await flashcardSetService.create(deckId, params)
      flashcardSets.value.push(set)
      return set
    } catch (e) {
      error.value = extractError(e)
      return null
    } finally {
      loading.value = false
    }
  }

  async function destroyFlashcardSet(id: number): Promise<boolean> {
    error.value = null
    try {
      await flashcardSetService.destroy(id)
      flashcardSets.value = flashcardSets.value.filter((s) => s.id !== id)
      return true
    } catch (e) {
      error.value = extractError(e)
      return false
    }
  }

  return { flashcardSets, loading, error, fetchFlashcardSets, createFlashcardSet, destroyFlashcardSet }
}
