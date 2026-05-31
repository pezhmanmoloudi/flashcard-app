import { computed } from 'vue'
import type { Ref } from 'vue'
import { LEARNING_MODE_ORDER, type LearningMode } from '@/shared/constants/learningModes'
import type { Deck } from '@/features/flashcards/types'

const LEVEL_ORDER = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2']

export function useDashboardGrouping(decks: Ref<Deck[]>) {
  const decksByModeAndLevel = computed(() => {
    const map: Partial<Record<LearningMode, Record<string, Deck[]>>> = {}
    for (const deck of decks.value) {
      if (!deck.language_pair) continue
      const mode = deck.language_pair as LearningMode
      const level = deck.level ?? 'Other'
      if (!map[mode]) map[mode] = {}
      if (!map[mode]![level]) map[mode]![level] = []
      map[mode]![level].push(deck)
    }
    return map
  })

  const activeModes = computed(() =>
    LEARNING_MODE_ORDER.filter((m) => decksByModeAndLevel.value[m]),
  )

  const levelsByMode = computed<Partial<Record<LearningMode, string[]>>>(() => {
    const result: Partial<Record<LearningMode, string[]>> = {}
    for (const mode of activeModes.value) {
      result[mode] = LEVEL_ORDER
    }
    return result
  })

  return { decksByModeAndLevel, activeModes, levelsByMode }
}
