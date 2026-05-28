<script setup lang="ts">
import { useRoute, useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BasePageHeader } from '@/shared/components/ui'
import { useFlashcards } from '@/features/flashcards/composables/useFlashcards'
import FlashcardForm from '@/features/flashcards/components/FlashcardForm.vue'
import type { FlashcardParams } from '@/features/flashcards/types'

const route = useRoute()
const router = useRouter()
const deckId = Number(route.params.deckId)
const { loading, error, createFlashcard } = useFlashcards()

async function handleSubmit(params: FlashcardParams) {
  const flashcard = await createFlashcard(deckId, params)
  if (flashcard) {
    router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: deckId } })
  }
}
</script>

<template>
  <div>
    <BasePageHeader
      title="New Flashcard"
      description="Add a new card to your deck."
    />

    <FlashcardForm
      submit-label="Create Flashcard"
      :loading="loading"
      :error="error"
      @submit="handleSubmit"
      @cancel="router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: deckId } })"
    />
  </div>
</template>
