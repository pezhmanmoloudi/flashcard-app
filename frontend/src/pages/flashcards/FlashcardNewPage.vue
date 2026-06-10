<script setup lang="ts">
import { ref, computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BasePageHeader, BaseButton } from '@/shared/components/ui'
import DeckFlashcards from '@/features/flashcards/components/DeckFlashcards.vue'

const route = useRoute()
const router = useRouter()
const deckId = Number(route.params.deckId)

const savedCardCount = ref(0)
const pendingCardCount = ref(0)

const doneDisabled = computed(
  () => savedCardCount.value === 0 && pendingCardCount.value === 0
)
</script>

<template>
  <div>
    <BasePageHeader
      title="Add Flashcards"
      description="Add new cards to your deck."
    />

    <DeckFlashcards
      :deck-id="deckId"
      mode="add"
      @card-saved="savedCardCount++"
      @pending-count-change="pendingCardCount = $event"
    />

    <div class="mt-6">
      <BaseButton
        variant="ghost"
        :disabled="doneDisabled"
        @click="router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: deckId } })"
      >
        Done — Go to Deck
      </BaseButton>
    </div>
  </div>
</template>
