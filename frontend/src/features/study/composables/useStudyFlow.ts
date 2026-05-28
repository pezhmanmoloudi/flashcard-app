import { ref, computed } from 'vue'
import { extractError } from '@/shared/utils'
import type { Flashcard } from '@/features/flashcards/types'
import { studyService } from '../services/study.service'
import type { StudySession, StudyRating, CardProgressParams } from '../types'

// Simple SM-2 stub — proper algorithm implemented in Part 5.1
function calculateSM2(rating: StudyRating): CardProgressParams {
  const intervalMap: Record<StudyRating, number> = { again: 1, hard: 1, good: 3, easy: 7 }
  const efMap: Record<StudyRating, number> = { again: 2.0, hard: 2.2, good: 2.5, easy: 2.7 }
  const intervalDays = intervalMap[rating]
  const nextReview = new Date()
  nextReview.setDate(nextReview.getDate() + intervalDays)

  return {
    repetitions: rating === 'again' ? 0 : 1,
    easiness_factor: efMap[rating],
    interval_days: intervalDays,
    next_review_at: nextReview.toISOString(),
  }
}

export function useStudyFlow() {
  const cards = ref<Flashcard[]>([])
  const currentIndex = ref(0)
  const isFlipped = ref(false)
  const session = ref<StudySession | null>(null)
  const loading = ref(false)
  const error = ref<string | null>(null)
  const completed = ref(false)
  const cardsStudied = ref(0)

  const currentCard = computed(() => cards.value[currentIndex.value] ?? null)
  const total = computed(() => cards.value.length)

  async function startStudy(deckId: number) {
    loading.value = true
    error.value = null
    completed.value = false
    cardsStudied.value = 0
    currentIndex.value = 0
    isFlipped.value = false
    cards.value = []

    try {
      const [sess, dueCards] = await Promise.all([
        studyService.startSession(deckId),
        studyService.getDueCards(deckId),
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

  function flipCard() {
    if (!isFlipped.value) {
      isFlipped.value = true
    }
  }

  async function rateCard(rating: StudyRating) {
    const card = currentCard.value
    if (!card || !isFlipped.value) return

    const params = calculateSM2(rating)
    try {
      await studyService.updateProgress(card.id, params)
    } catch {
      try {
        await studyService.createProgress(card.id, params)
      } catch {
        // Progress update failed — continue the session
      }
    }

    cardsStudied.value++

    if (currentIndex.value < cards.value.length - 1) {
      currentIndex.value++
      isFlipped.value = false
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
    isFlipped,
    loading,
    error,
    completed,
    cardsStudied,
    startStudy,
    flipCard,
    rateCard,
  }
}
