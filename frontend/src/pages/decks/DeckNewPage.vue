<script setup lang="ts">
import { useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BasePageHeader } from '@/shared/components/ui'
import { useDecks } from '@/features/flashcards/composables/useDecks'
import DeckForm from '@/features/flashcards/components/DeckForm.vue'
import type { DeckParams } from '@/features/flashcards/types'

const router = useRouter()
const { loading, error, createDeck } = useDecks()

async function handleSubmit(params: DeckParams) {
  const deck = await createDeck(params)
  if (deck) {
    router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: deck.id } })
  }
}
</script>

<template>
  <div>
    <BasePageHeader
      title="New Deck"
      description="Create a new flashcard deck to start learning."
    />

    <DeckForm
      submit-label="Create Deck"
      :loading="loading"
      :error="error"
      @submit="handleSubmit"
      @cancel="router.push({ name: ROUTE_NAMES.DECKS })"
    />
  </div>
</template>
