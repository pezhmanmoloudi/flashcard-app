import { ref } from 'vue'
import { extractError } from '@/shared/utils'
import type { CardProgress, CardProgressParams } from '../types'
import { studyService } from '../services/study.service'

export function useCardProgress() {
  const progress = ref<CardProgress | null>(null)
  const loading = ref(false)
  const error = ref<string | null>(null)

  async function fetchProgress(flashcardId: number) {
    loading.value = true
    error.value = null
    try {
      progress.value = await studyService.fetchProgress(flashcardId)
    } catch (e) {
      error.value = extractError(e)
    } finally {
      loading.value = false
    }
  }

  async function createProgress(
    flashcardId: number,
    params: CardProgressParams,
  ): Promise<CardProgress | null> {
    loading.value = true
    error.value = null
    try {
      progress.value = await studyService.createProgress(flashcardId, params)
      return progress.value
    } catch (e) {
      error.value = extractError(e)
      return null
    } finally {
      loading.value = false
    }
  }

  async function updateProgress(
    flashcardId: number,
    params: CardProgressParams,
  ): Promise<CardProgress | null> {
    loading.value = true
    error.value = null
    try {
      progress.value = await studyService.updateProgress(flashcardId, params)
      return progress.value
    } catch (e) {
      error.value = extractError(e)
      return null
    } finally {
      loading.value = false
    }
  }

  return { progress, loading, error, fetchProgress, createProgress, updateProgress }
}
