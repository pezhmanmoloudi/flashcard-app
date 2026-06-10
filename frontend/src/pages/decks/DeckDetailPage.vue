<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import {
  BaseSpinner,
  BaseAlert,
  BaseButton,
} from '@/shared/components/ui'
import { useDeck } from '@/features/flashcards/composables/useDeck'
import { useFlashcardSets } from '@/features/flashcards/composables/useFlashcardSets'
import FlashcardSetCard from '@/features/flashcards/components/FlashcardSetCard.vue'
import DeckFlashcards from '@/features/flashcards/components/DeckFlashcards.vue'
import { useStats } from '@/features/study/composables/useStats'

const route = useRoute()
const router = useRouter()
const deckId = Number(route.params.id)

const { deck, loading, error, fetchDeck } = useDeck()
const { deckStats, fetchDeckStats } = useStats()
const { flashcardSets, loading: setsLoading, fetchFlashcardSets } = useFlashcardSets()

const showAddCards = ref(false)

const selectedSetId = computed(() => {
  const active = flashcardSets.value.find((s) => s.is_unlocked && !s.is_completed)
  return (active ?? flashcardSets.value[0] ?? null)?.id ?? null
})

onMounted(() => {
  fetchDeck(deckId)
  fetchDeckStats(deckId)
  fetchFlashcardSets(deckId)
})

function studySet(setId: number) {
  router.push({
    name: ROUTE_NAMES.STUDY_SESSION,
    params: { deckId },
    query: { setId },
  })
}

</script>

<template>
  <div>
<div
      v-if="loading && !deck"
      class="flex justify-center py-16"
    >
      <BaseSpinner size="lg" />
    </div>

    <BaseAlert
      v-else-if="error && !deck"
      variant="error"
      :message="error"
    />

    <template v-else-if="deck">
      <!-- Header card -->
      <div class="bg-white border border-[var(--color-border)] rounded-2xl px-6 py-5 mb-8 text-center shadow-sm">
        <h1 class="text-2xl font-bold text-[var(--color-text)] mb-3">
          {{ deck.name }}
        </h1>
        <div
          v-if="deckStats"
          class="flex items-center justify-center flex-wrap gap-y-1 text-sm"
        >
          <template
            v-for="(stat, i) in [
              { label: 'Total',    value: deckStats.total_cards },
              { label: 'Due',      value: deckStats.due_count },
              { label: 'Learning', value: deckStats.learning_count },
              { label: 'Mastered', value: deckStats.mastered_count },
            ]"
            :key="stat.label"
          >
            <span class="px-4 text-[var(--color-text-muted)]">
              {{ stat.label }}:
              <span class="font-bold text-[var(--color-text)]">{{ stat.value }}</span>
            </span>
            <span
              v-if="i < 3"
              class="text-[var(--color-border)] select-none"
            >|</span>
          </template>
        </div>
      </div>

      <!-- Sets loading -->
      <div
        v-if="setsLoading && flashcardSets.length === 0"
        class="flex justify-center py-10"
      >
        <BaseSpinner size="lg" />
      </div>

      <template v-else-if="flashcardSets.length > 0">
        <!-- Set progression grid -->
        <div class="grid grid-cols-3 gap-3 max-w-xl mx-auto">
          <FlashcardSetCard
            v-for="(set, idx) in flashcardSets"
            :key="set.id"
            :set="set"
            :set-number="idx + 1"
            :is-selected="set.id === selectedSetId"
            @select="studySet(set.id)"
          />
        </div>
      </template>

      <p
        v-else-if="!setsLoading"
        class="text-sm text-[var(--color-text-muted)] py-4"
      >
        No sets in this deck yet.
      </p>

      <p
        v-if="flashcardSets.length > 0"
        class="mt-6 text-center text-xs text-[var(--color-text-muted)]"
      >
        ⓘ Tap a set to continue studying
      </p>

      <!-- Add Cards section -->
      <div class="mt-8">
        <BaseButton
          variant="secondary"
          size="sm"
          @click="showAddCards = !showAddCards"
        >
          {{ showAddCards ? 'Hide' : 'Add Cards' }}
        </BaseButton>

        <div
          v-if="showAddCards"
          class="mt-4"
        >
          <DeckFlashcards
            :deck-id="deckId"
            mode="add"
          />
        </div>
      </div>
    </template>
  </div>
</template>
