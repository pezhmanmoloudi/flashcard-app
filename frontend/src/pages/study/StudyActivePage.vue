<script setup lang="ts">
import { onMounted, onUnmounted, watch, computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BaseSpinner, BaseAlert } from '@/shared/components/ui'
import { useStudyFlow } from '@/features/study/composables/useStudyFlow'
import { useCardFlip } from '@/features/study/composables/useCardFlip'
import StudyCard from '@/features/study/components/StudyCard.vue'
import StudyProgress from '@/features/study/components/StudyProgress.vue'
import StudyComplete from '@/features/study/components/StudyComplete.vue'
import type { ReviewCard } from '@/features/study/types'

const route  = useRoute()
const router = useRouter()

// ── Detect mode from route ─────────────────────────────────────────────────
// Review queue:  /study/review/:languagePair   → route.params.languagePair
// Deck learning: /study/:deckId                → route.params.deckId
const languagePair = route.params.languagePair as string | undefined
const isReviewMode = !!languagePair

const deckId        = isReviewMode ? undefined : Number(route.params.deckId)
const setId         = route.query.setId ? Number(route.query.setId) : undefined
const includeWaiting = route.query.includeWaiting === 'true'

const {
  currentCard,
  total,
  loading,
  error,
  completed,
  cardsStudied,
  isReviewSession,
  startStudy,
  startReview,
  rateCard,
} = useStudyFlow()

const { isFlipped, flip, reset: resetFlip } = useCardFlip()

// Metadata strip shown on review cards (set name + CEFR level)
const cardMeta = computed(() => {
  if (!isReviewSession.value || !currentCard.value) return null
  const c = currentCard.value as ReviewCard
  return {
    setName:   c.set_name,
    deckLevel: c.deck_level,
  }
})

let flipTimestamp: number | null = null

function handleFlip() {
  flipTimestamp = Date.now()
  flip()
}

function handleRateCard(rating: Parameters<typeof rateCard>[0]) {
  const responseTimeMs = flipTimestamp != null ? Date.now() - flipTimestamp : undefined
  flipTimestamp = null
  rateCard(rating, responseTimeMs)
}

watch(currentCard, () => {
  resetFlip()
  flipTimestamp = null
})

function handleKeydown(e: KeyboardEvent) {
  if (!currentCard.value) return
  if (e.key === ' ' || e.key === 'Enter') {
    e.preventDefault()
    handleFlip()
  } else if (isFlipped.value) {
    if      (e.key === 'ArrowRight' || e.key === '4') handleRateCard('easy')
    else if (e.key === 'ArrowLeft'  || e.key === '1') handleRateCard('again')
    else if (e.key === '3') handleRateCard('good')
    else if (e.key === '2') handleRateCard('hard')
  }
}

onMounted(() => {
  if (isReviewMode) {
    startReview(languagePair!, includeWaiting)
  } else {
    startStudy(deckId!, setId)
  }
  window.addEventListener('keydown', handleKeydown)
})

onUnmounted(() => {
  window.removeEventListener('keydown', handleKeydown)
})

function goBack() {
  if (window.history.state?.back) {
    router.back()
  } else if (isReviewMode) {
    router.push({ name: ROUTE_NAMES.STUDY })
  } else {
    router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: deckId } })
  }
}

function handleDone() {
  goBack()
}

function handleAgain() {
  resetFlip()
  if (isReviewMode) {
    startReview(languagePair!, includeWaiting)
  } else {
    startStudy(deckId!, setId)
  }
}
</script>

<template>
  <div class="flex flex-col max-w-sm mx-auto gap-4">
    <!-- Back nav -->
    <div
      v-if="!completed"
      class="flex items-center justify-between"
    >
      <button
        class="text-sm font-medium text-gray-600 hover:text-gray-900 hover:bg-gray-100 active:bg-gray-200 -ml-2.5 px-2.5 py-1.5 rounded-lg transition-colors"
        @click="goBack()"
      >
        ← Back
      </button>
    </div>

    <!-- Loading -->
    <div
      v-if="loading"
      class="flex justify-center py-20"
    >
      <BaseSpinner size="lg" />
    </div>

    <!-- Error -->
    <BaseAlert
      v-else-if="error"
      variant="error"
      :message="error"
    />

    <!-- Completion screen -->
    <StudyComplete
      v-else-if="completed"
      :cards-studied="cardsStudied"
      @done="handleDone"
      @again="handleAgain"
    />

    <!-- Active study -->
    <template v-else-if="currentCard">
      <StudyProgress
        :current="cardsStudied"
        :total="total"
      />

      <!-- Card metadata strip (review queue only) -->
      <div
        v-if="cardMeta"
        class="flex items-center gap-2 px-1"
      >
        <span
          v-if="cardMeta.deckLevel"
          class="text-xs font-semibold text-[var(--color-text-muted)] bg-[var(--color-surface-alt)] border border-[var(--color-border)] px-1.5 py-0.5 rounded"
        >
          {{ cardMeta.deckLevel }}
        </span>
        <span class="text-xs text-[var(--color-text-muted)] truncate">
          {{ cardMeta.setName }}
        </span>
      </div>

      <StudyCard
        :flashcard="currentCard"
        :is-flipped="isFlipped"
        @flip="handleFlip"
        @swipe-right="handleRateCard('easy')"
        @swipe-left="handleRateCard('again')"
      />

      <!-- Rating buttons -->
      <Transition name="rating-fade">
        <div
          v-if="isFlipped"
          class="flex gap-2"
        >
          <button
            class="flex-1 py-3.5 rounded-[var(--radius-btn)] bg-red-50 text-red-600 text-sm font-semibold hover:bg-red-100 active:bg-red-200 transition-colors"
            @click="handleRateCard('again')"
          >
            Again
          </button>
          <button
            class="flex-1 py-3.5 rounded-[var(--radius-btn)] bg-orange-50 text-orange-600 text-sm font-semibold hover:bg-orange-100 active:bg-orange-200 transition-colors"
            @click="handleRateCard('hard')"
          >
            Hard
          </button>
          <button
            class="flex-1 py-3.5 rounded-[var(--radius-btn)] bg-blue-50 text-blue-600 text-sm font-semibold hover:bg-blue-100 active:bg-blue-200 transition-colors"
            @click="handleRateCard('good')"
          >
            Good
          </button>
          <button
            class="flex-1 py-3.5 rounded-[var(--radius-btn)] bg-green-50 text-green-600 text-sm font-semibold hover:bg-green-100 active:bg-green-200 transition-colors"
            @click="handleRateCard('easy')"
          >
            Easy
          </button>
        </div>
      </Transition>
    </template>
  </div>
</template>

<style scoped>
.rating-fade-enter-active,
.rating-fade-leave-active {
  transition: opacity 0.18s ease;
}
.rating-fade-enter-from,
.rating-fade-leave-to {
  opacity: 0;
}
</style>
