<script setup lang="ts">
import { onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BasePageHeader, BaseSpinner, BaseAlert } from '@/shared/components/ui'
import { useFlashcard } from '@/features/flashcards/composables/useFlashcard'
import FlashcardForm from '@/features/flashcards/components/FlashcardForm.vue'
import type { FlashcardParams } from '@/features/flashcards/types'

const route = useRoute()
const router = useRouter()
const flashcardId = Number(route.params.id)
const { flashcard, loading, error, fetchFlashcard, updateFlashcard } = useFlashcard()

onMounted(() => fetchFlashcard(flashcardId))

async function handleSubmit(params: FlashcardParams) {
  const updated = await updateFlashcard(flashcardId, params)
  if (updated) {
    router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: updated.deck_id } })
  }
}
</script>

<template>
  <div>
    <BasePageHeader
      title="Edit Flashcard"
      :description="flashcard?.front_text"
    />

    <div
      v-if="loading && !flashcard"
      class="flex justify-center py-16"
    >
      <BaseSpinner size="lg" />
    </div>

    <BaseAlert
      v-else-if="error && !flashcard"
      variant="error"
      :message="error"
    />

    <FlashcardForm
      v-else-if="flashcard"
      submit-label="Save Changes"
      :initial-values="{
        front_text: flashcard.front_text,
        back_text: flashcard.back_text,
        source_language: flashcard.source_language,
        target_language: flashcard.target_language,
        example_sentence: flashcard.example_sentence,
      }"
      :loading="loading"
      :error="loading ? null : error"
      @submit="handleSubmit"
      @cancel="router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: flashcard.deck_id } })"
    />
  </div>
</template>
