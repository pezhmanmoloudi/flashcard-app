import { ref } from 'vue'
import { extractError } from '@/shared/utils'
import type { UserStats, DeckStats } from '../types'
import { studyService } from '../services/study.service'

export function useStats() {
  const userStats = ref<UserStats | null>(null)
  const deckStats = ref<DeckStats | null>(null)
  const loading = ref(false)
  const error = ref<string | null>(null)

  async function fetchUserStats() {
    loading.value = true
    error.value = null
    try {
      userStats.value = await studyService.fetchUserStats()
    } catch (e) {
      error.value = extractError(e)
    } finally {
      loading.value = false
    }
  }

  async function fetchDeckStats(deckId: number) {
    loading.value = true
    error.value = null
    try {
      deckStats.value = await studyService.fetchDeckStats(deckId)
    } catch (e) {
      error.value = extractError(e)
    } finally {
      loading.value = false
    }
  }

  return { userStats, deckStats, loading, error, fetchUserStats, fetchDeckStats }
}
