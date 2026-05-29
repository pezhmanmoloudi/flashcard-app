import { computed } from 'vue'
import type { Ref } from 'vue'
import {
  LEARNING_MODE_ORDER,
  type LearningMode,
} from '@/shared/constants/learningModes'
import type { Deck } from '@/features/flashcards/types'

const LEVEL_ORDER = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2']

export function useDashboardGrouping(
  decks: Ref<Deck[]>,
  preferredMode: Ref<LearningMode | null>,
) {
  const decksByModeAndLevel = computed(() => {
    const map: Partial<Record<LearningMode, Record<string, Deck[]>>> = {}
    for (const deck of decks.value) {
      if (!deck.language_pair) continue
      const mode = deck.language_pair
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
      result[mode] = [...LEVEL_ORDER, 'Other'].filter(
        (l) => decksByModeAndLevel.value[mode]?.[l]?.length,
      )
    }
    return result
  })

  const deckCountByMode = computed<Partial<Record<LearningMode, number>>>(() => {
    const result: Partial<Record<LearningMode, number>> = {}
    for (const mode of activeModes.value) {
      result[mode] = Object.values(decksByModeAndLevel.value[mode] ?? {}).flat().length
    }
    return result
  })

  const expandedMode = computed<LearningMode | null>(() => {
    const stored = preferredMode.value
    if (stored && activeModes.value.includes(stored)) return stored

    return (
      activeModes.value.find((mode) =>
        Object.values(decksByModeAndLevel.value[mode] ?? {})
          .flat()
          .some((d) => d.is_unlocked && !d.is_completed),
      ) ?? activeModes.value[0] ?? null
    )
  })

  return {
    decksByModeAndLevel,
    activeModes,
    levelsByMode,
    deckCountByMode,
    expandedMode,
  }
}
