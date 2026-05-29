import { ref } from 'vue'
import { studyService } from '@/features/study/services/study.service'
import type { Deck } from '@/features/flashcards/types'
import type { DeckStats } from '@/features/study/types'

export function useDeckStats() {
  const statsMap = ref<Record<number, DeckStats>>({})

  async function fetchAllStats(decks: Deck[]) {
    const results = await Promise.allSettled(
      decks.map((d) => studyService.fetchDeckStats(d.id)),
    )
    results.forEach((r, i) => {
      if (r.status === 'fulfilled') statsMap.value[decks[i].id] = r.value
    })
  }

  return { statsMap, fetchAllStats }
}
