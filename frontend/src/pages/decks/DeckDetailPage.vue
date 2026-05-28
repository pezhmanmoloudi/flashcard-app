<script setup lang="ts">
import { ref, onMounted } from 'vue'
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
import DeckFlashcards from '@/features/flashcards/components/DeckFlashcards.vue'
import { useStats } from '@/features/study/composables/useStats'
import { formatDate } from '@/shared/utils'

const route = useRoute()
const router = useRouter()
const deckId = Number(route.params.id)
const { deck, loading, error, fetchDeck, deleteDeck } = useDeck()
const { deckStats, fetchDeckStats } = useStats()
const confirmingDelete = ref(false)

onMounted(() => {
  fetchDeck(deckId)
  fetchDeckStats(deckId)
})

async function handleDelete() {
  const ok = await deleteDeck(deckId)
  if (ok) {
    router.push({ name: ROUTE_NAMES.DECKS })
  }
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

      <DeckFlashcards :deck-id="deckId" />
    </template>
  </div>
</template>
