import { ref } from 'vue'
import type { PaginationMeta } from '@/shared/types'
import { extractError } from '@/shared/utils'
import type { StudySession, UpdateStudySessionParams } from '../types'
import { studyService } from '../services/study.service'

export function useStudySession() {
  const session = ref<StudySession | null>(null)
  const sessions = ref<StudySession[]>([])
  const meta = ref<PaginationMeta | null>(null)
  const loading = ref(false)
  const error = ref<string | null>(null)

  async function fetchSessions(page = 1) {
    loading.value = true
    error.value = null
    try {
      const result = await studyService.listSessions(page)
      sessions.value = result.data
      meta.value = result.meta ?? null
    } catch (e) {
      error.value = extractError(e)
    } finally {
      loading.value = false
    }
  }

  async function startSession(deckId: number): Promise<StudySession | null> {
    loading.value = true
    error.value = null
    try {
      session.value = await studyService.startSession(deckId)
      return session.value
    } catch (e) {
      error.value = extractError(e)
      return null
    } finally {
      loading.value = false
    }
  }

  async function completeSession(
    id: number,
    params: UpdateStudySessionParams,
  ): Promise<StudySession | null> {
    loading.value = true
    error.value = null
    try {
      session.value = await studyService.updateSession(id, params)
      return session.value
    } catch (e) {
      error.value = extractError(e)
      return null
    } finally {
      loading.value = false
    }
  }

  return { session, sessions, meta, loading, error, fetchSessions, startSession, completeSession }
}
