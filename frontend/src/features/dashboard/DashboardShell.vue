<script setup lang="ts">
import { computed, ref, toRef } from 'vue'
import { useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { useDashboardGrouping } from './composables/useDashboardGrouping'
import { LEARNING_MODE_CONFIG, type LearningMode } from '@/shared/constants/learningModes'
import TrainingCard from './components/TrainingCard.vue'
import type { Deck } from '@/features/flashcards/types'

const props = defineProps<{ decks: Deck[] }>()

const router = useRouter()
const { decksByModeAndLevel, activeModes, levelsByMode } = useDashboardGrouping(
  toRef(props, 'decks'),
)

interface LevelItem { level: string; deck: Deck | null }
interface ModeRow {
  mode: LearningMode
  label: string
  sourceFlag: string
  targetFlag: string
  levels: LevelItem[]
}

const rows = computed<ModeRow[]>(() =>
  activeModes.value.map((mode) => ({
    mode,
    ...LEARNING_MODE_CONFIG[mode],
    levels: (levelsByMode.value[mode] ?? []).map((level) => ({
      level,
      deck: decksByModeAndLevel.value[mode]?.[level]?.[0] ?? null,
    })),
  })),
)

const rowSummary = computed(() =>
  rows.value.map((row) => ({
    ...row,
    completedLevels: row.levels.filter((i) => i.deck?.is_completed).length,
    totalLevels: row.levels.filter((i) => i.deck !== null).length,
  })),
)

const selectedMode = ref<LearningMode | null>(null)

const selectedRow = computed(() =>
  selectedMode.value ? rows.value.find((r) => r.mode === selectedMode.value) ?? null : null,
)

function handleLevelClick(deck: Deck | null) {
  if (!deck) return
  router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: deck.id } })
}
</script>

<template>
  <!-- Step 1: Training selection -->
  <div v-if="!selectedMode">
    <div class="grid grid-cols-2 sm:grid-cols-3 gap-4">
      <TrainingCard
        v-for="row in rowSummary"
        :key="row.mode"
        :mode="row.mode"
        :total-levels="row.totalLevels"
        :completed-levels="row.completedLevels"
        @select="selectedMode = $event"
      />
    </div>
  </div>

  <!-- Step 2: Level selection -->
  <div v-else-if="selectedRow">
    <!-- Back button -->
    <button
      class="flex items-center gap-2 mb-6 text-sm font-medium text-[var(--color-text-muted)] hover:text-[var(--color-text)] transition-colors"
      @click="selectedMode = null"
    >
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-4 h-4">
        <path fill-rule="evenodd" d="M11.78 5.22a.75.75 0 0 1 0 1.06L8.06 10l3.72 3.72a.75.75 0 1 1-1.06 1.06l-4.25-4.25a.75.75 0 0 1 0-1.06l4.25-4.25a.75.75 0 0 1 1.06 0Z" clip-rule="evenodd" />
      </svg>
      <span>{{ selectedRow.sourceFlag }} {{ selectedRow.label }} {{ selectedRow.targetFlag }}</span>
    </button>

    <!-- Level buttons grid -->
    <div class="grid grid-cols-3 gap-3 max-w-xl mx-auto">
      <button
        v-for="item in selectedRow.levels"
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
