<script setup lang="ts">
import { onMounted } from 'vue'
import { BaseSpinner, BaseAlert } from '@/shared/components/ui'
import { useDecks } from '@/features/flashcards/composables/useDecks'
import { useDeckStats } from '@/features/dashboard/composables/useDeckStats'
import DashboardShell from '@/features/dashboard/DashboardShell.vue'

const { decks, loading, error, fetchDecks } = useDecks()
const { statsMap, fetchAllStats } = useDeckStats()

onMounted(async () => {
  await fetchDecks(1, 100)
  await fetchAllStats(decks.value)
})
</script>

<template>
  <div>
    <div class="mb-8">
      <h1 class="text-2xl font-semibold text-[var(--color-text)]">
        Your Decks
      </h1>
      <p class="mt-1 text-sm text-[var(--color-text-muted)]">
        Pick a learning path and continue your studies.
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

    <DashboardShell
      v-else-if="decks.length > 0"
      :decks="decks"
      :stats-map="statsMap"
    />

    <p
      v-else
      class="text-sm text-[var(--color-text-muted)] py-4"
    >
      No decks yet.
    </p>
  </div>
</template>
