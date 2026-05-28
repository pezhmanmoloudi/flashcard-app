<script setup lang="ts">
import { onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BasePageHeader, BaseSpinner, BaseAlert } from '@/shared/components/ui'
import { useDeck } from '@/features/flashcards/composables/useDeck'
import DeckForm from '@/features/flashcards/components/DeckForm.vue'
import type { DeckParams } from '@/features/flashcards/types'

const route = useRoute()
const router = useRouter()
const deckId = Number(route.params.id)
const { deck, loading, error, fetchDeck, updateDeck } = useDeck()

onMounted(() => fetchDeck(deckId))

async function handleSubmit(params: DeckParams) {
  const updated = await updateDeck(deckId, params)
  if (updated) {
    router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: deckId } })
  }
}
</script>

<template>
  <div>
    <BasePageHeader
      title="Edit Deck"
      :description="deck?.name"
    />

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

    <DeckForm
      v-else-if="deck"
      submit-label="Save Changes"
      :initial-values="{ name: deck.name, description: deck.description }"
      :loading="loading"
      :error="loading ? null : error"
      @submit="handleSubmit"
      @cancel="router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: deckId } })"
    />
  </div>
</template>
