<script setup lang="ts">
import { onMounted, onUnmounted, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BaseSpinner, BaseAlert } from '@/shared/components/ui'
import { useStudyFlow } from '@/features/study/composables/useStudyFlow'
import { useCardFlip } from '@/features/study/composables/useCardFlip'
import StudyCard from '@/features/study/components/StudyCard.vue'
import StudyProgress from '@/features/study/components/StudyProgress.vue'

const route = useRoute()
const router = useRouter()
const deckId = Number(route.params.deckId)
const setId = route.query.setId ? Number(route.query.setId) : undefined

const {
  currentCard,
  currentIndex,
  total,
  loading,
  error,
  startStudy,
  rateCard,
} = useStudyFlow()

const { isFlipped, flip, reset: resetFlip } = useCardFlip()

// Reset flip state when the session advances to the next card
watch(currentIndex, () => resetFlip())

function handleKeydown(e: KeyboardEvent) {
  if (!currentCard.value) return
  if (e.key === ' ' || e.key === 'Enter') {
    e.preventDefault()
    flip()
  } else if (e.key === 'ArrowRight') {
    rateCard('easy')
  } else if (e.key === 'ArrowLeft') {
    rateCard('again')
  }
}

onMounted(() => {
  startStudy(deckId, setId)
  window.addEventListener('keydown', handleKeydown)
})

onUnmounted(() => {
  window.removeEventListener('keydown', handleKeydown)
})
</script>

<template>
  <div class="flex flex-col max-w-sm mx-auto gap-4">
    <div class="flex items-center justify-between">
      <button
        class="text-sm font-medium text-gray-600 hover:text-gray-900 hover:bg-gray-100 active:bg-gray-200 -ml-2.5 px-2.5 py-1.5 rounded-lg transition-colors"
        @click="router.push({ name: ROUTE_NAMES.STUDY })"
      >
        ← Back
      </button>
    </div>

    <div
      v-if="loading"
      class="flex justify-center py-20"
    >
      <BaseSpinner size="lg" />
    </div>

    <BaseAlert
      v-else-if="error"
      variant="error"
      :message="error"
    />

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
    </template>
  </div>
</template>
