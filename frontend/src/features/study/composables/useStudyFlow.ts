import { ref, computed } from 'vue'
import { extractError } from '@/shared/utils'
import type { Flashcard } from '@/features/flashcards/types'
import { studyService } from '../services/study.service'
import type { StudySession, StudyRating } from '../types'

export function useStudyFlow() {
  const cards = ref<Flashcard[]>([])
  const currentIndex = ref(0)
  const session = ref<StudySession | null>(null)
  const loading = ref(false)
  const error = ref<string | null>(null)
  const completed = ref(false)
  const cardsStudied = ref(0)

  const currentCard = computed(() => cards.value[currentIndex.value] ?? null)
  const total = computed(() => cards.value.length)

  async function startStudy(deckId: number, setId?: number, reviewsOnly = false) {
    loading.value = true
    error.value = null
    completed.value = false
    cardsStudied.value = 0
    currentIndex.value = 0
    cards.value = []

    try {
      const [sess, dueCards] = await Promise.all([
        studyService.startSession(deckId),
        studyService.getDueCards(deckId, setId, reviewsOnly),
      ])
      session.value = sess
      cards.value = dueCards

      if (cards.value.length === 0) {
        completed.value = true
        await studyService
          .updateSession(sess.id, { cards_studied: 0, completed_at: new Date().toISOString() })
          .catch(() => {})
      }
    } catch (e) {
      error.value = extractError(e)
    } finally {
      loading.value = false
    }
  }

  async function rateCard(rating: StudyRating) {
    const card = currentCard.value
    if (!card) return

    try {
      await studyService.reviewCard(card.id, rating)
    } catch {
      // Progress update failed — continue the session
    }

    cardsStudied.value++

    if (currentIndex.value < cards.value.length - 1) {
      currentIndex.value++
    } else {
      if (session.value) {
        await studyService
          .updateSession(session.value.id, {
            cards_studied: cardsStudied.value,
            completed_at: new Date().toISOString(),
          })
          .catch(() => {})
      }
      completed.value = true
    }
  }

  return {
    cards,
    currentCard,
    currentIndex,
    total,
    loading,
    error,
    completed,
    cardsStudied,
    startStudy,
    rateCard,
  }
}
