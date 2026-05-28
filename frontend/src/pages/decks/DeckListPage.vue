<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import {
  BaseButton,
  BaseEmptyState,
  BaseSpinner,
  BaseAlert,
} from '@/shared/components/ui'
import { useDecks } from '@/features/flashcards/composables/useDecks'
import DeckCard from '@/features/flashcards/components/DeckCard.vue'
import type { Deck } from '@/features/flashcards/types'

const router = useRouter()
const { decks, meta, loading, error, fetchDecks, destroyDeck } = useDecks()
const currentPage = ref(1)

async function loadPage(page: number) {
  currentPage.value = page
  await fetchDecks(page)
}

onMounted(() => loadPage(1))

function handleEdit(deck: Deck) {
  router.push({ name: ROUTE_NAMES.DECK_EDIT, params: { id: deck.id } })
}

async function handleDelete(deck: Deck) {
  await destroyDeck(deck.id)
}
</script>

<template>
  <div>
    <!-- Header row -->
    <div class="flex items-center justify-between mb-8">
      <h1 class="text-2xl font-semibold text-[var(--color-text)]">
        Library
      </h1>

      <BaseButton @click="router.push({ name: ROUTE_NAMES.DECK_NEW })">
        New Deck
      </BaseButton>
    </div>

    <BaseAlert
      v-if="error && !loading"
      variant="error"
      :message="error"
      class="mb-4"
    />

    <div
      v-if="loading && decks.length === 0"
      class="flex justify-center py-16"
    >
      <BaseSpinner size="lg" />
    </div>

    <template v-else-if="decks.length > 0">
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        <DeckCard
          v-for="deck in decks"
          :key="deck.id"
          :deck="deck"
          @edit="handleEdit"
          @delete="handleDelete"
        />
      </div>

      <div
        v-if="meta && meta.total_pages > 1"
        class="flex items-center justify-between mt-6"
      >
        <span class="text-xs text-gray-400">
          Page {{ meta.current_page }} of {{ meta.total_pages }}
        </span>
        <div class="flex gap-2">
          <BaseButton
            variant="secondary"
            size="sm"
            :disabled="meta.current_page <= 1 || loading"
            @click="loadPage(meta.current_page - 1)"
          >
            Previous
          </BaseButton>
          <BaseButton
            variant="secondary"
            size="sm"
            :disabled="meta.current_page >= meta.total_pages || loading"
            @click="loadPage(meta.current_page + 1)"
          >
            Next
          </BaseButton>
        </div>
      </div>
    </template>

    <BaseEmptyState
      v-else-if="!loading"
      title="No decks yet"
      description="Create your first deck to start learning."
    >
      <template #action>
        <BaseButton @click="router.push({ name: ROUTE_NAMES.DECK_NEW })">
          Create a deck
        </BaseButton>
      </template>
    </BaseEmptyState>
  </div>
</template>
