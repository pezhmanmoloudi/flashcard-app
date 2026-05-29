<script setup lang="ts">
import { toRef } from 'vue'
import { storeToRefs } from 'pinia'
import { useSettingsStore } from '@/core/stores/settings.store'
import { useDashboardGrouping } from './composables/useDashboardGrouping'
import ModeHeader from './components/ModeHeader.vue'
import ModeSection from './components/ModeSection.vue'
import type { LearningMode } from '@/shared/constants/learningModes'
import type { Deck } from '@/features/flashcards/types'
import type { DeckStats } from '@/features/study/types'

const props = defineProps<{
  decks: Deck[]
  statsMap: Record<number, DeckStats>
}>()

const settingsStore = useSettingsStore()
const { preferredLearningMode } = storeToRefs(settingsStore)
const { decksByModeAndLevel, activeModes, levelsByMode, deckCountByMode, expandedMode } =
  useDashboardGrouping(
    toRef(props, 'decks'),
    preferredLearningMode,
  )

function selectMode(mode: LearningMode) {
  settingsStore.setPreferredLearningMode(mode)
}
</script>

<template>
  <div class="space-y-3">
    <div
      v-for="mode in activeModes"
      :key="mode"
      class="rounded-2xl border border-stone-200 bg-white overflow-hidden"
    >
      <ModeHeader
        :mode="mode"
        :is-expanded="expandedMode === mode"
        :deck-count="deckCountByMode[mode] ?? 0"
        @select="selectMode"
      />

      <Transition name="accordion">
        <ModeSection
          v-if="expandedMode === mode"
          :decks-by-level="decksByModeAndLevel[mode] ?? {}"
          :levels="levelsByMode[mode] ?? []"
          :stats-map="statsMap"
        />
      </Transition>
    </div>
  </div>
</template>

<style scoped>
.accordion-enter-active,
.accordion-leave-active {
  transition: opacity 0.25s ease, max-height 0.3s ease;
  overflow: hidden;
  max-height: 2000px;
}
.accordion-enter-from,
.accordion-leave-to {
  opacity: 0;
  max-height: 0;
}
</style>
