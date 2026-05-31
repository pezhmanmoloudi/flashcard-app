<script setup lang="ts">
import { computed, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BaseSpinner } from '@/shared/components/ui'
import { useDecks } from '@/features/flashcards/composables/useDecks'
import { useDashboardGrouping } from '@/features/dashboard/composables/useDashboardGrouping'
import { isLearningMode, LEARNING_MODE_CONFIG } from '@/shared/constants/learningModes'
import type { Deck } from '@/features/flashcards/types'

const route = useRoute()
const router = useRouter()

const rawMode = route.params.mode as string
if (!isLearningMode(rawMode)) {
  router.replace({ name: ROUTE_NAMES.DASHBOARD })
}
const mode = rawMode

const { decks, loading, fetchDecks } = useDecks()
const { decksByModeAndLevel, levelsByMode } = useDashboardGrouping(decks)

const config = computed(() => LEARNING_MODE_CONFIG[mode])

interface LevelItem { level: string; deck: Deck | null }

const levels = computed<LevelItem[]>(() =>
  (levelsByMode.value[mode] ?? []).map((level) => ({
    level,
    deck: decksByModeAndLevel.value[mode]?.[level]?.[0] ?? null,
  })),
)

onMounted(() => fetchDecks(1, 100))

function handleLevelClick(deck: Deck | null) {
  if (!deck) return
  router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: deck.id } })
}
</script>

<template>
  <div>
    <!-- Back button -->
    <button
      class="flex items-center gap-2 mb-6 text-sm font-medium text-[var(--color-text-muted)] hover:text-[var(--color-text)] transition-colors"
      @click="router.push({ name: ROUTE_NAMES.DASHBOARD })"
    >
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-4 h-4">
        <path fill-rule="evenodd" d="M11.78 5.22a.75.75 0 0 1 0 1.06L8.06 10l3.72 3.72a.75.75 0 1 1-1.06 1.06l-4.25-4.25a.75.75 0 0 1 0-1.06l4.25-4.25a.75.75 0 0 1 1.06 0Z" clip-rule="evenodd" />
      </svg>
      <span v-if="config">{{ config.sourceFlag }} {{ config.label }} {{ config.targetFlag }}</span>
    </button>

    <div v-if="loading && levels.length === 0" class="flex justify-center py-20">
      <BaseSpinner size="lg" />
    </div>

    <!-- Level grid -->
    <div v-else class="grid grid-cols-3 gap-3 max-w-xl mx-auto">
      <button
        v-for="item in levels"
        :key="item.level"
        class="aspect-square w-full rounded-2xl border-2 flex flex-col justify-between p-4 text-left transition-transform"
        :class="
          item.deck === null
            ? 'border-[var(--color-border)] bg-[var(--color-surface-alt)] cursor-default'
            : item.deck.is_completed
              ? 'border-emerald-400 bg-emerald-50 active:scale-95 cursor-pointer'
              : 'border-[var(--color-primary)] bg-white active:scale-95 cursor-pointer'
        "
        @click="handleLevelClick(item.deck)"
      >
        <!-- Top: card count + done badge -->
        <div class="flex items-start justify-between">
          <span
            class="text-3xl font-bold tabular-nums"
            :class="
              item.deck === null ? 'text-gray-300'
              : item.deck.is_completed ? 'text-emerald-500'
              : 'text-[var(--color-primary)]'
            "
          >
            {{ item.deck?.flashcard_count ?? '···' }}
          </span>
          <span
            v-if="item.deck?.is_completed"
            class="text-[10px] font-semibold uppercase tracking-wider text-emerald-700 bg-emerald-100 px-1.5 py-0.5 rounded mt-1"
          >Done</span>
        </div>

        <!-- Bottom: level name + status -->
        <div>
          <p
            class="text-sm font-semibold leading-snug"
            :class="
              item.deck === null ? 'text-gray-400'
              : item.deck.is_completed ? 'text-emerald-700'
              : 'text-[var(--color-text)]'
            "
          >
            {{ item.level }}
          </p>
          <p class="text-xs mt-0.5">
            <span v-if="item.deck === null" class="text-gray-400">Coming soon</span>
            <span v-else-if="item.deck.is_completed" class="text-emerald-600">Completed</span>
            <span v-else class="text-[var(--color-text-muted)]">{{ item.deck.flashcard_count }} cards</span>
          </p>
        </div>
      </button>
    </div>
  </div>
</template>
