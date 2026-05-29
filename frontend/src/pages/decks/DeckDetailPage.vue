<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import {
  BasePageHeader,
  BaseButton,
  BaseSpinner,
  BaseAlert,
  BaseCard,
} from '@/shared/components/ui'
import { useDeck } from '@/features/flashcards/composables/useDeck'
import { useFlashcardSets } from '@/features/flashcards/composables/useFlashcardSets'
import { useFlashcards } from '@/features/flashcards/composables/useFlashcards'
import FlashcardCard from '@/features/flashcards/components/FlashcardCard.vue'
import { useStats } from '@/features/study/composables/useStats'
import { formatDate } from '@/shared/utils'
import type { Flashcard } from '@/features/flashcards/types'

const route = useRoute()
const router = useRouter()
const deckId = Number(route.params.id)

const { deck, loading, error, fetchDeck, deleteDeck } = useDeck()
const { deckStats, fetchDeckStats } = useStats()
const { flashcardSets, fetchFlashcardSets } = useFlashcardSets()
const { flashcards, loading: cardsLoading, destroyFlashcard, fetchFlashcards } = useFlashcards()
const confirmingDelete = ref(false)

const cardsBySet = computed(() => {
  const map: Record<number, Flashcard[]> = {}
  for (const card of flashcards.value) {
    if (!map[card.flashcard_set_id]) map[card.flashcard_set_id] = []
    map[card.flashcard_set_id].push(card)
  }
  return map
})

onMounted(() => {
  fetchDeck(deckId)
  fetchDeckStats(deckId)
  fetchFlashcardSets(deckId)
  fetchFlashcards(deckId, 1, 100)
})

async function handleDelete() {
  const ok = await deleteDeck(deckId)
  if (ok) router.push({ name: ROUTE_NAMES.DECKS })
}

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
    <BasePageHeader :title="deck?.name ?? 'Deck'">
      <template
        v-if="deck"
        #actions
      >
        <template v-if="confirmingDelete">
          <span class="text-xs text-red-600">Delete this deck?</span>
          <BaseButton
            variant="danger"
            size="sm"
            :loading="loading"
            @click="handleDelete"
          >
            Yes, delete
          </BaseButton>
          <BaseButton
            variant="ghost"
            size="sm"
            :disabled="loading"
            @click="confirmingDelete = false"
          >
            Cancel
          </BaseButton>
        </template>
        <template v-else>
          <BaseButton
            variant="secondary"
            size="sm"
            @click="router.push({ name: ROUTE_NAMES.DECK_EDIT, params: { id: deckId } })"
          >
            Edit
          </BaseButton>
          <BaseButton
            variant="ghost"
            size="sm"
            @click="confirmingDelete = true"
          >
            Delete
          </BaseButton>
        </template>
      </template>
    </BasePageHeader>

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
      <BaseCard
        v-if="deck.description"
        padding="md"
        class="mb-8"
      >
        <p class="text-sm text-gray-700">
          {{ deck.description }}
        </p>
        <p class="mt-2 text-xs text-gray-400">
          Created {{ formatDate(deck.created_at) }}
        </p>
      </BaseCard>
      <p
        v-else
        class="text-xs text-gray-400 mb-8"
      >
        Created {{ formatDate(deck.created_at) }}
      </p>

      <!-- Stats row -->
      <div
        v-if="deckStats"
        class="grid grid-cols-4 gap-3 mb-8"
      >
        <div
          v-for="stat in [
            { label: 'Total', value: deckStats.total_cards },
            { label: 'Due', value: deckStats.due_count },
            { label: 'Learning', value: deckStats.learning_count },
            { label: 'Mastered', value: deckStats.mastered_count },
          ]"
          :key="stat.label"
          class="rounded-[var(--radius-card)] bg-gray-50 px-3 py-3 text-center"
        >
          <p class="text-xl font-semibold text-gray-900">
            {{ stat.value }}
          </p>
          <p class="text-xs text-gray-400 mt-0.5">
            {{ stat.label }}
          </p>
        </div>
      </div>

      <!-- Loading sets -->
      <div
        v-if="cardsLoading && flashcardSets.length === 0"
        class="flex justify-center py-10"
      >
        <BaseSpinner size="lg" />
      </div>

      <!-- Flashcard sets -->
      <div
        v-else
        class="space-y-8"
      >
        <div
          v-for="set in flashcardSets"
          :key="set.id"
        >
          <!-- Set header -->
          <div class="flex items-center justify-between mb-3">
            <div class="flex items-center gap-2">
              <h2 class="text-sm font-semibold text-gray-900">
                {{ set.name }}
              </h2>
              <span class="text-xs font-medium text-gray-500 bg-gray-100 px-1.5 py-0.5 rounded">
                {{ set.flashcard_count }} cards
              </span>
            </div>
            <button
              class="text-xs font-medium text-[var(--color-primary)] hover:opacity-75 transition-opacity"
              @click="studySet(set.id)"
            >
              Study set →
            </button>
          </div>

          <!-- Cards -->
          <div
            v-if="cardsBySet[set.id]?.length"
            class="space-y-3"
          >
            <FlashcardCard
              v-for="card in cardsBySet[set.id]"
              :key="card.id"
              :flashcard="card"
              @delete="(fc) => destroyFlashcard(fc.id)"
            />
          </div>
          <p
            v-else-if="!cardsLoading"
            class="text-sm text-gray-400 py-2"
          >
            No flashcards in this set yet.
          </p>
        </div>
      </div>
    </template>
  </div>
</template>
