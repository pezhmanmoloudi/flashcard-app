<script setup lang="ts">
import { computed, toRef } from 'vue'
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

const rowSummary = computed(() =>
  activeModes.value.map((mode) => ({
    mode,
    ...LEARNING_MODE_CONFIG[mode],
    completedLevels: (levelsByMode.value[mode] ?? []).filter(
      (level) => decksByModeAndLevel.value[mode]?.[level]?.[0]?.is_completed,
    ).length,
    totalLevels: (levelsByMode.value[mode] ?? []).filter(
      (level) => decksByModeAndLevel.value[mode]?.[level]?.[0] != null,
    ).length,
  })),
)

function goToMode(mode: LearningMode) {
  router.push({ name: ROUTE_NAMES.LANGUAGE_PAIR_LEVELS, params: { mode } })
}
</script>

<template>
  <div class="grid grid-cols-2 sm:grid-cols-3 gap-4">
    <TrainingCard
      v-for="row in rowSummary"
      :key="row.mode"
      :mode="row.mode"
      :total-levels="row.totalLevels"
      :completed-levels="row.completedLevels"
      @select="goToMode($event)"
    />
  </div>
</template>
