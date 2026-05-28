<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import {
  BasePageHeader,
  BaseButton,
  BaseEmptyState,
  BaseSpinner,
  BaseAlert,
  BaseCard,
} from '@/shared/components/ui'
import { useDeck } from '@/features/flashcards/composables/useDeck'
import { formatDate } from '@/shared/utils'

const route = useRoute()
const router = useRouter()
const deckId = Number(route.params.id)
const { deck, loading, error, fetchDeck, deleteDeck } = useDeck()
const confirmingDelete = ref(false)

onMounted(() => fetchDeck(deckId))

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
        class="mb-6"
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
        class="text-xs text-gray-400 mb-6"
      >
        Created {{ formatDate(deck.created_at) }}
      </p>

      <BaseEmptyState
        title="No flashcards yet"
        description="Flashcard management is coming in Part 4.2."
      >
        <template #icon>
          <svg
            class="w-6 h-6 text-gray-400"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            stroke-width="1.5"
            aria-hidden="true"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"
            />
          </svg>
        </template>
      </BaseEmptyState>
    </template>
  </div>
</template>
