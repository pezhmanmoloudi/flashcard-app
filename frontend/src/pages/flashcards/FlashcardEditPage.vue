<script setup lang="ts">
import { onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BasePageHeader, BaseSpinner, BaseAlert } from '@/shared/components/ui'
import { useFlashcard } from '@/features/flashcards/composables/useFlashcard'
import FlashcardForm from '@/features/flashcards/components/FlashcardForm.vue'
import FlashcardImageUpload from '@/features/flashcards/components/FlashcardImageUpload.vue'
import FlashcardAudioUpload from '@/features/flashcards/components/FlashcardAudioUpload.vue'
import type { FlashcardParams, Flashcard } from '@/features/flashcards/types'

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

function handleMediaUpdated(updated: Flashcard) {
  flashcard.value = updated
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

    <template v-else-if="flashcard">
      <FlashcardForm
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

      <div class="mt-8 pt-6 border-t border-[var(--color-border)] space-y-4">
        <p class="text-sm font-semibold text-gray-900">
          Media
        </p>
        <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
          <FlashcardImageUpload
            :flashcard-id="flashcard.id"
            :image-url="flashcard.image_url"
            @updated="handleMediaUpdated"
          />
          <FlashcardAudioUpload
            :flashcard-id="flashcard.id"
            :audio-url="flashcard.audio_url"
            @updated="handleMediaUpdated"
          />
        </div>
      </div>
    </template>
  </div>
</template>
