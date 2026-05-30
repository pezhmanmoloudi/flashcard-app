<script setup lang="ts">
import { onMounted, onUnmounted, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BaseSpinner, BaseAlert } from '@/shared/components/ui'
import { useStudyFlow } from '@/features/study/composables/useStudyFlow'
import { useCardFlip } from '@/features/study/composables/useCardFlip'
import StudyCard from '@/features/study/components/StudyCard.vue'
import StudyProgress from '@/features/study/components/StudyProgress.vue'
import StudyComplete from '@/features/study/components/StudyComplete.vue'

const route = useRoute()
const router = useRouter()
const deckId = Number(route.params.deckId)
const setId = route.query.setId ? Number(route.query.setId) : undefined
const reviewsOnly = route.query.reviewsOnly === 'true'

const {
  currentCard,
  currentIndex,
  total,
  loading,
  error,
  completed,
  cardsStudied,
  startStudy,
  rateCard,
} = useStudyFlow()

const { isFlipped, flip, reset: resetFlip } = useCardFlip()

watch(currentIndex, () => resetFlip())

function handleKeydown(e: KeyboardEvent) {
  if (!currentCard.value) return
  if (e.key === ' ' || e.key === 'Enter') {
    e.preventDefault()
    flip()
  } else if (isFlipped.value) {
    if (e.key === 'ArrowRight') rateCard('easy')
    else if (e.key === 'ArrowLeft') rateCard('again')
  }
}

onMounted(() => {
  startStudy(deckId, setId, reviewsOnly)
  window.addEventListener('keydown', handleKeydown)
})

onUnmounted(() => {
  window.removeEventListener('keydown', handleKeydown)
})

function goBack() {
  if (window.history.state?.back) {
    router.back()
  } else {
    router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: deckId } })
  }
}

function handleDone() {
  goBack()
}

function handleAgain() {
  resetFlip()
  startStudy(deckId, setId, reviewsOnly)
}
</script>

<template>
  <div class="flex flex-col max-w-sm mx-auto gap-4">
    <!-- Back nav — hidden when session is in completion state -->
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
        :current="currentIndex"
        :total="total"
      />

      <StudyCard
        :flashcard="currentCard"
        :is-flipped="isFlipped"
        @flip="flip"
        @swipe-right="rateCard('easy')"
        @swipe-left="rateCard('again')"
      />

      <!-- Rating buttons — visible tap targets after card flips -->
      <Transition name="rating-fade">
        <div
          v-if="isFlipped"
          class="flex gap-3"
        >
          <button
            class="flex-1 py-3.5 rounded-[var(--radius-btn)] bg-red-50 text-red-600 text-sm font-semibold hover:bg-red-100 active:bg-red-200 transition-colors"
            @click="rateCard('again')"
          >
            Again
          </button>
          <button
            class="flex-1 py-3.5 rounded-[var(--radius-btn)] bg-green-50 text-green-600 text-sm font-semibold hover:bg-green-100 active:bg-green-200 transition-colors"
            @click="rateCard('easy')"
          >
            Know it
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
