<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BaseSpinner, BaseAlert } from '@/shared/components/ui'
import { useDecks } from '@/features/flashcards/composables/useDecks'
import { studyService } from '@/features/study/services/study.service'
import DeckCard from '@/features/flashcards/components/DeckCard.vue'
import type { DeckStats } from '@/features/study/types'

const router = useRouter()
const { decks, loading, error, fetchDecks } = useDecks()
const statsMap = ref<Record<number, DeckStats>>({})

onMounted(async () => {
  await fetchDecks()
  if (decks.value.length === 0) {
    router.replace({ name: ROUTE_NAMES.DECKS })
    return
  }
  const results = await Promise.allSettled(
    decks.value.map((deck) => studyService.fetchDeckStats(deck.id)),
  )
  results.forEach((result, i) => {
    if (result.status === 'fulfilled') {
      statsMap.value[decks.value[i].id] = result.value
    }
  })
})
</script>

<template>
  <div>
    <div class="mb-8">
      <h1 class="text-2xl font-semibold text-[var(--color-text)]">
        Your Decks
      </h1>
      <p class="mt-1 text-sm text-[var(--color-text-muted)]">
        Pick a deck and continue learning.
      </p>
    </div>

    <div
      v-if="loading"
      class="flex justify-center py-20"
    >
      <BaseSpinner size="lg" />
    </div>

    <BaseAlert
      v-else-if="error"
      variant="error"
      :message="error"
    />

    <div
      v-else-if="decks.length > 0"
      class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5"
    >
      <DeckCard
        v-for="deck in decks"
        :key="deck.id"
        :deck="deck"
        :stats="statsMap[deck.id] ?? null"
        variant="dashboard"
      />
    </div>

  </div>
</template>
