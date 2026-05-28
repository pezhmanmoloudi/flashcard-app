<script setup lang="ts">
import { onMounted, onUnmounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BaseSpinner, BaseAlert } from '@/shared/components/ui'
import { useStudyFlow } from '@/features/study/composables/useStudyFlow'
import StudyFlashcard from '@/features/study/components/StudyFlashcard.vue'
import StudyRatingButtons from '@/features/study/components/StudyRatingButtons.vue'
import StudyProgress from '@/features/study/components/StudyProgress.vue'
import StudyComplete from '@/features/study/components/StudyComplete.vue'
import type { StudyRating } from '@/features/study/types'

const route = useRoute()
const router = useRouter()
const deckId = Number(route.params.deckId)

const {
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
} = useStudyFlow()

const ratingKeys: Record<string, StudyRating> = {
  '1': 'again',
  '2': 'hard',
  '3': 'good',
  '4': 'easy',
}

function handleKeydown(e: KeyboardEvent) {
  if (e.key === ' ' || e.key === 'Enter') {
    e.preventDefault()
    if (!isFlipped.value && currentCard.value) flipCard()
    return
  }
  if (isFlipped.value && ratingKeys[e.key]) {
    rateCard(ratingKeys[e.key])
  }
}

onMounted(() => {
  startStudy(deckId)
  window.addEventListener('keydown', handleKeydown)
})

onUnmounted(() => {
  window.removeEventListener('keydown', handleKeydown)
})
</script>

<template>
  <div class="flex flex-col gap-6 max-w-lg mx-auto">
    <div class="flex items-center justify-between">
      <button
        class="text-sm text-gray-400 hover:text-gray-700 transition-colors"
        @click="router.push({ name: ROUTE_NAMES.STUDY })"
      >
        ← Back
      </button>
      <span
        v-if="!loading && !completed && total > 0"
        class="text-xs text-gray-400"
      >
        {{ currentIndex + 1 }} / {{ total }}
      </span>
    </div>

    <div
      v-if="loading"
      class="flex justify-center py-16"
    >
      <BaseSpinner size="lg" />
    </div>

    <BaseAlert
      v-else-if="error"
      variant="error"
      :message="error"
    />

    <StudyComplete
      v-else-if="completed"
      :cards-studied="cardsStudied"
      @study-again="startStudy(deckId)"
      @back-to-deck="router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: deckId } })"
    />

    <template v-else-if="currentCard">
      <StudyProgress
        :current="currentIndex"
        :total="total"
      />

      <StudyFlashcard
        :flashcard="currentCard"
        :flipped="isFlipped"
        @flip="flipCard"
      />

      <Transition name="fade">
        <StudyRatingButtons
          v-if="isFlipped"
          @rate="rateCard"
        />
      </Transition>

      <Transition name="fade">
        <p
          v-if="!isFlipped"
          class="text-center text-xs text-gray-400"
        >
          Press
          <kbd class="px-1.5 py-0.5 rounded bg-gray-100 text-gray-500 font-mono text-[10px]">Space</kbd>
          or tap the card to reveal
        </p>
      </Transition>
    </template>
  </div>
</template>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.2s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
