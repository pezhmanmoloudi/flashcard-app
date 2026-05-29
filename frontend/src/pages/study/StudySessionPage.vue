<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BaseSpinner, BaseAlert } from '@/shared/components/ui'
import { useStats } from '@/features/study/composables/useStats'
import { studyService } from '@/features/study/services/study.service'
import type { ReviewQueueDeck } from '@/features/study/types'

const router = useRouter()
const { userStats, fetchUserStats } = useStats()

const queue = ref<ReviewQueueDeck[]>([])
const loading = ref(false)
const error = ref<string | null>(null)

async function fetchQueue() {
  loading.value = true
  error.value = null
  try {
    queue.value = await studyService.fetchReviewQueue()
  } catch {
    error.value = 'Failed to load review queue.'
  } finally {
    loading.value = false
  }
}

function studySet(deckId: number, setId: number) {
  router.push({
    name: ROUTE_NAMES.STUDY_SESSION,
    params: { deckId },
    query: { setId },
  })
}

function studyDeck(deckId: number) {
  router.push({ name: ROUTE_NAMES.STUDY_SESSION, params: { deckId } })
}

const LANGUAGE_PAIR_LABELS: Record<string, string> = {
  de_to_en: 'DE → EN',
  de_to_fa: 'DE → FA',
  en_to_fa: 'EN → FA',
}

onMounted(() => {
  fetchQueue()
  fetchUserStats()
})
</script>

<template>
  <div class="max-w-lg mx-auto">
    <!-- Header -->
    <div class="mb-6">
      <h1 class="text-2xl font-bold text-gray-900">Study</h1>
      <p class="mt-0.5 text-sm text-gray-500">Your cards due for review</p>
    </div>

    <!-- Stats row -->
    <div
      v-if="userStats"
      class="flex gap-6 mb-8"
    >
      <div class="flex flex-col">
        <span class="text-xl font-bold text-gray-900 tabular-nums">{{ userStats.study_streak }}</span>
        <span class="text-xs text-gray-400 mt-0.5">day streak</span>
      </div>
      <div class="flex flex-col">
        <span class="text-xl font-bold text-gray-900 tabular-nums">{{ userStats.cards_mastered }}</span>
        <span class="text-xs text-gray-400 mt-0.5">mastered</span>
      </div>
      <div class="flex flex-col">
        <span class="text-xl font-bold text-gray-900 tabular-nums">{{ userStats.total_sessions }}</span>
        <span class="text-xs text-gray-400 mt-0.5">sessions</span>
      </div>
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

    <!-- All caught up -->
    <div
      v-else-if="queue.length === 0"
      class="flex flex-col items-center justify-center py-20 text-center"
    >
      <div class="text-4xl mb-4">✓</div>
      <h2 class="text-lg font-semibold text-gray-900">All caught up</h2>
      <p class="mt-1 text-sm text-gray-500 max-w-xs">
        No cards are due right now. Come back later or add new cards in the Library.
      </p>
    </div>

    <!-- Review queue -->
    <div
      v-else
      class="space-y-5"
    >
      <div
        v-for="deck in queue"
        :key="deck.id"
        class="rounded-xl border border-gray-200 bg-white overflow-hidden"
      >
        <!-- Deck header -->
        <div class="flex items-center justify-between px-4 py-3 border-b border-gray-100 bg-gray-50">
          <div class="flex items-center gap-2 min-w-0">
            <span class="text-sm font-semibold text-gray-900 truncate">{{ deck.name }}</span>
            <span class="shrink-0 text-xs font-medium text-gray-500 bg-gray-100 px-1.5 py-0.5 rounded">
              {{ deck.level }}
            </span>
            <span
              v-if="LANGUAGE_PAIR_LABELS[deck.language_pair]"
              class="shrink-0 text-xs font-medium text-blue-600 bg-blue-50 px-1.5 py-0.5 rounded"
            >
              {{ LANGUAGE_PAIR_LABELS[deck.language_pair] }}
            </span>
          </div>
          <div class="flex items-center gap-2 shrink-0 ml-3">
            <span class="text-xs text-gray-400">{{ deck.total_due }} due</span>
            <button
              class="text-xs font-medium text-gray-600 hover:text-gray-900 bg-white hover:bg-gray-100 border border-gray-200 px-2.5 py-1 rounded-md transition-colors"
              @click="studyDeck(deck.id)"
            >
              Study all
            </button>
          </div>
        </div>

        <!-- Sets -->
        <div class="divide-y divide-gray-100">
          <button
            v-for="set in deck.flashcard_sets"
            :key="set.id"
            class="w-full flex items-center justify-between px-4 py-3 hover:bg-gray-50 active:bg-gray-100 transition-colors text-left"
            @click="studySet(deck.id, set.id)"
          >
            <span class="text-sm text-gray-700 truncate pr-4">{{ set.name }}</span>
            <div class="flex items-center gap-2 shrink-0">
              <span
                class="text-xs font-semibold text-white bg-gray-800 px-2 py-0.5 rounded-full tabular-nums"
              >
                {{ set.due_count }}
              </span>
              <svg
                class="w-3.5 h-3.5 text-gray-400"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M9 5l7 7-7 7"
                />
              </svg>
            </div>
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
