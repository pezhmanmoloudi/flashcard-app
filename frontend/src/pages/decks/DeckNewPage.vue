<script setup lang="ts">
import { ref, computed } from 'vue'
import { useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BasePageHeader, BaseButton } from '@/shared/components/ui'
import { useDecks } from '@/features/flashcards/composables/useDecks'
import DeckForm from '@/features/flashcards/components/DeckForm.vue'
import DeckFlashcards from '@/features/flashcards/components/DeckFlashcards.vue'
import type { DeckParams } from '@/features/flashcards/types'

const router = useRouter()
const { loading, error, createDeck } = useDecks()
const newDeckId = ref<number | null>(null)

const savedCardCount = ref(0)
const pendingCardCount = ref(0)

const doneDisabled = computed(
  () => savedCardCount.value === 0 && pendingCardCount.value === 0
)

async function handleSubmit(params: DeckParams) {
  const deck = await createDeck(params)
  if (deck) {
    newDeckId.value = deck.id
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
      v-if="!newDeckId"
      submit-label="Create Deck"
      :loading="loading"
      :error="error"
      @submit="handleSubmit"
      @cancel="router.push({ name: ROUTE_NAMES.DECKS })"
    />

    <template v-else>
      <DeckFlashcards
        :deck-id="newDeckId"
        mode="create"
        @card-saved="savedCardCount++"
        @pending-count-change="pendingCardCount = $event"
      />

      <div class="mt-6">
        <BaseButton
          variant="ghost"
          :disabled="doneDisabled"
          @click="router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: newDeckId } })"
        >
          Done — Go to Deck
        </BaseButton>
      </div>
    </template>
  </div>
</template>
