import { ref, computed } from 'vue'
import { extractError } from '@/shared/utils'
import type { Flashcard } from '@/features/flashcards/types'
import type { ReviewCard } from '../types'
import { studyService } from '../services/study.service'
import { useStudyRefreshStore } from '../stores/useStudyRefreshStore'
import type { StudySession, ReviewSession, StudyRating } from '../types'

/**
 * Session state machine for both deck learning and language-pair review.
 *
 * Modes:
 *   Deck learning  — startStudy(deckId, setId?)
 *   Review queue   — startReview(languagePair)
 *
 * Invariants:
 *   - cards[]           active queue; "again" cards move to the end on first press
 *   - currentIndex      always points at the next unrated card in cards[]
 *   - removedCards      "again" cards ejected after their second failure in the same session
 *   - requeuedCardIds   tracks which cards have already been given one second chance
 *   - backend calls are ALWAYS fire-and-forget — they never gate UI transitions
 *
 * In review queue mode all ratings advance the pointer (cards never eject).
 * In deck learning mode first "again" requeues the card at the end of the queue;
 * a second "again" on the same card ejects it permanently.
 */
export function useStudyFlow() {
  type AnyCard = Flashcard | ReviewCard
  type AnySession = StudySession | ReviewSession

  const cards         = ref<AnyCard[]>([])
  const removedCards  = ref<AnyCard[]>([])
  const currentIndex  = ref(0)
  const initialCount  = ref(0)
  const session       = ref<AnySession | null>(null)
  const loading       = ref(false)
  const error         = ref<string | null>(null)
  const completed     = ref(false)
  const cardsStudied    = ref(0)
  const isReviewSession = ref(false)  // language-pair review queue
  const requeuedCardIds = ref(new Set<number>())

  const currentCard = computed(() => cards.value[currentIndex.value] ?? null)
  const total       = computed(() => initialCount.value)

  // ─── helpers ──────────────────────────────────────────────────────────────

  function completeSession() {
    completed.value = true
    if (!session.value) return

    if (isReviewSession.value) {
      studyService
        .completeReviewSession(session.value.id)
        .catch((e) => console.error('Failed to complete review session:', e))
    } else {
      studyService
        .completeSession(session.value.id)
        .catch((e) => console.error('Failed to complete session:', e))
    }
  }

  function advance() {
    if (cards.value.length === 0 || currentIndex.value >= cards.value.length) {
      completeSession()
    }
  }

  // ─── deck learning mode ───────────────────────────────────────────────────

  async function startStudy(deckId: number, setId?: number) {
    loading.value       = true
    error.value         = null
    completed.value     = false
    cardsStudied.value    = 0
    currentIndex.value    = 0
    cards.value           = []
    removedCards.value    = []
    requeuedCardIds.value = new Set()
    initialCount.value    = 0
    isReviewSession.value = false

    try {
      const [sess, dueCards] = await Promise.all([
        studyService.startSession(deckId),
        studyService.getDueCards(deckId, setId),
      ])
      session.value      = sess
      cards.value        = dueCards
      initialCount.value = dueCards.length

      if (dueCards.length === 0) completeSession()
    } catch (e) {
      error.value = extractError(e)
    } finally {
      loading.value = false
    }
  }

  // ─── review queue mode ────────────────────────────────────────────────────

  async function startReview(languagePair: string, includeWaiting = false) {
    loading.value       = true
    error.value         = null
    completed.value     = false
    cardsStudied.value    = 0
    currentIndex.value    = 0
    cards.value           = []
    removedCards.value    = []
    requeuedCardIds.value = new Set()
    initialCount.value    = 0
    isReviewSession.value = true

    try {
      const sess = await studyService.startReviewSession(languagePair)
      session.value = sess

      const reviewCards = await studyService.getReviewCards(sess.id, includeWaiting)
      cards.value        = reviewCards
      initialCount.value = reviewCards.length

      if (reviewCards.length === 0) completeSession()
    } catch (e) {
      error.value = extractError(e)
    } finally {
      loading.value = false
    }
  }

  // ─── shared rating ────────────────────────────────────────────────────────

  function rateCard(rating: StudyRating, responseTimeMs?: number) {
    const card = currentCard.value
    if (!card || !session.value || completed.value) return

    const sessionId = session.value.id
    const cardId    = card.id

    if (rating === 'again' && !isReviewSession.value) {
      if (!requeuedCardIds.value.has(card.id)) {
        // First "again" in this session: move card to end of queue so the user
        // gets one more attempt. Don't count as studied — card isn't resolved yet.
        requeuedCardIds.value.add(card.id)
        cards.value.push(cards.value.splice(currentIndex.value, 1)[0])
        // currentIndex unchanged: next card slides into the vacated position.
      } else {
        // Second "again" on the same card: eject permanently into inbox.
        cardsStudied.value++
        removedCards.value.push(cards.value.splice(currentIndex.value, 1)[0])
      }
    } else {
      // Good / Hard / Easy (or review-session "again"): resolve and advance.
      cardsStudied.value++
      currentIndex.value++
    }

    const persist = isReviewSession.value
      ? studyService.reviewCardInReviewSession(sessionId, cardId, rating, responseTimeMs)
      : studyService.reviewCardInSession(sessionId, cardId, rating, responseTimeMs)

    persist
      .then(() => {
        if (rating === 'again' || isReviewSession.value) {
          useStudyRefreshStore().markInboxDirty()
        }
      })
      .catch((e) => console.error('Failed to record review:', e))

    advance()
  }

  return {
    cards,
    removedCards,
    currentCard,
    currentIndex,
    total,
    loading,
    error,
    completed,
    cardsStudied,
    isReviewSession,
    startStudy,
    startReview,
    rateCard,
  }
}
