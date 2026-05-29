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
    query: { setId, reviewsOnly: 'true' },
  })
}

function studyDeck(deckId: number) {
  router.push({
    name: ROUTE_NAMES.STUDY_SESSION,
    params: { deckId },
    query: { reviewsOnly: 'true' },
  })
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
      <h1 class="text-2xl font-bold text-[var(--color-text)]">
        Study
      </h1>
      <p class="mt-0.5 text-sm text-[var(--color-text-muted)]">
        Cards due for review today
      </p>
    </div>

    <!-- Stats row -->
    <div
      v-if="userStats"
      class="grid grid-cols-3 gap-3 mb-8"
    >
      <div
        v-for="stat in [
          { label: 'Day streak', value: userStats.study_streak },
          { label: 'Mastered', value: userStats.cards_mastered },
          { label: 'Sessions', value: userStats.total_sessions },
        ]"
        :key="stat.label"
        class="rounded-[var(--radius-card)] bg-[var(--color-surface-alt)] px-3 py-3 text-center"
      >
        <p class="text-xl font-semibold tabular-nums text-[var(--color-text)]">
          {{ stat.value }}
        </p>
        <p class="text-xs text-[var(--color-text-muted)] mt-0.5">
          {{ stat.label }}
        </p>
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
      <div class="w-16 h-16 rounded-full bg-[var(--color-surface-alt)] flex items-center justify-center mb-4">
        <svg
          class="w-7 h-7 text-[var(--color-text-muted)]"
          fill="none"
          stroke="currentColor"
          stroke-width="2"
          viewBox="0 0 24 24"
          aria-hidden="true"
        >
          <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
        </svg>
      </div>
      <h2 class="text-base font-semibold text-[var(--color-text)]">
        All caught up
      </h2>
      <p class="mt-1 text-sm text-[var(--color-text-muted)] max-w-xs">
        No cards are due right now. Come back later or study new cards in the Library.
      </p>
    </div>

    <!-- Review queue -->
    <div
      v-else
      class="space-y-4"
    >
      <p class="text-xs font-semibold uppercase tracking-wider text-[var(--color-text-muted)] mb-2">
        Due for review
      </p>

      <div
        v-for="deck in queue"
        :key="deck.id"
        class="rounded-[var(--radius-card)] border border-[var(--color-border)] bg-white overflow-hidden"
      >
        <!-- Deck header -->
        <div class="flex items-center justify-between px-4 py-3 border-b border-[var(--color-border)] bg-[var(--color-surface-alt)]">
          <div class="flex items-center gap-2 min-w-0">
            <span class="text-sm font-semibold text-[var(--color-text)] truncate">{{ deck.name }}</span>
            <span
              v-if="deck.level"
              class="shrink-0 text-xs font-medium text-[var(--color-text-muted)] bg-white border border-[var(--color-border)] px-1.5 py-0.5 rounded"
            >
              {{ deck.level }}
            </span>
            <span
              v-if="LANGUAGE_PAIR_LABELS[deck.language_pair]"
              class="shrink-0 text-xs font-medium text-[var(--color-primary)] bg-[var(--color-primary-light)] px-1.5 py-0.5 rounded"
            >
              {{ LANGUAGE_PAIR_LABELS[deck.language_pair] }}
            </span>
          </div>
          <div class="flex items-center gap-3 shrink-0 ml-3">
            <span class="text-xs text-[var(--color-text-muted)] tabular-nums">{{ deck.total_due }} due</span>
            <button
              class="text-xs font-semibold text-[var(--color-primary)] hover:opacity-75 transition-opacity"
              @click="studyDeck(deck.id)"
            >
              Review all →
            </button>
          </div>
        </div>

        <!-- Sets -->
        <div class="divide-y divide-[var(--color-border)]">
          <button
            v-for="set in deck.flashcard_sets"
            :key="set.id"
            class="w-full flex items-center justify-between px-4 py-3 hover:bg-[var(--color-surface-alt)] active:bg-gray-100 transition-colors text-left"
            @click="studySet(deck.id, set.id)"
          >
            <span class="text-sm text-[var(--color-text)] truncate pr-4">{{ set.name }}</span>
            <div class="flex items-center gap-2 shrink-0">
              <span
                class="text-xs font-semibold text-white bg-[var(--color-primary)] px-2 py-0.5 rounded-full tabular-nums"
              >
                {{ set.due_count }}
              </span>
              <svg
                class="w-3.5 h-3.5 text-[var(--color-text-muted)]"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
                aria-hidden="true"
              >
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
              </svg>
            </div>
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
