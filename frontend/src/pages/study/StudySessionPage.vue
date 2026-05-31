<script setup lang="ts">
import { ref, computed, watch, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BaseSpinner, BaseAlert } from '@/shared/components/ui'
import { useStats } from '@/features/study/composables/useStats'
import { studyService } from '@/features/study/services/study.service'
import { useStudyRefreshStore } from '@/features/study/stores/useStudyRefreshStore'
import type { ReviewQueueSummaryItem } from '@/features/study/types'

const router = useRouter()
const { userStats, fetchUserStats } = useStats()

const reviewSummary = ref<ReviewQueueSummaryItem[]>([])
const loading = ref(false)
const error = ref<string | null>(null)

const totalDue     = computed(() => reviewSummary.value.reduce((sum, r) => sum + r.total_due, 0))
const totalWaiting = computed(() => reviewSummary.value.reduce((sum, r) => sum + r.inbox_waiting, 0))

const allItems = computed(() =>
  reviewSummary.value.filter(r => r.total_due + r.inbox_waiting > 0)
)

async function fetchSummary() {
  loading.value = true
  error.value = null
  try {
    reviewSummary.value = await studyService.fetchReviewSummary()
  } catch {
    error.value = 'Failed to load review queue.'
  } finally {
    loading.value = false
  }
}

function startReview(languagePair: string, includeWaiting = false) {
  router.push({
    name: ROUTE_NAMES.REVIEW_SESSION,
    params: { languagePair },
    query: includeWaiting ? { includeWaiting: 'true' } : {},
  })
}

const LANGUAGE_PAIR_LABELS: Record<string, string> = {
  de_to_en: 'German ↔ English',
  de_to_fa: 'German ↔ Persian',
  en_to_fa: 'English ↔ Persian',
}

const refreshStore = useStudyRefreshStore()
watch(() => refreshStore.inboxVersion, () => {
  fetchSummary()
})

onMounted(() => {
  fetchSummary()
  fetchUserStats()
})
</script>

<template>
  <div class="max-w-xl mx-auto">
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

    <!-- All caught up — nothing due and nothing recovering -->
    <div
      v-else-if="totalDue === 0 && totalWaiting === 0"
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

    <!-- Review queue — one card per language pair -->
    <div
      v-else
      class="grid grid-cols-3 gap-3 max-w-xl mx-auto"
    >
      <button
        v-for="item in allItems"
        :key="item.language_pair"
        class="aspect-square w-full rounded-2xl border-2 border-[var(--color-primary)] bg-white p-4 flex flex-col justify-between text-left transition-transform active:scale-95"
        @click="startReview(item.language_pair, true)"
      >
        <span class="text-4xl font-bold tabular-nums text-[var(--color-primary)]">
          {{ item.total_due + item.inbox_waiting }}
        </span>
        <div>
          <p class="text-sm font-semibold text-[var(--color-text)] leading-snug">
            {{ LANGUAGE_PAIR_LABELS[item.language_pair] ?? item.language_pair }}
          </p>
          <p class="text-xs text-[var(--color-text-muted)] mt-1 tabular-nums">
            <template v-if="item.total_due > 0 && item.inbox_waiting > 0">
              {{ item.total_due }} due · {{ item.inbox_waiting }} recovering
            </template>
            <template v-else-if="item.total_due > 0">
              {{ item.total_due }} due
            </template>
            <template v-else>
              {{ item.inbox_waiting }} recovering
            </template>
          </p>
        </div>
      </button>
    </div>
  </div>
</template>
