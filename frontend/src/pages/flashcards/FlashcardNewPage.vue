<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BasePageHeader, BaseAlert, BaseSpinner } from '@/shared/components/ui'
import { useFlashcards } from '@/features/flashcards/composables/useFlashcards'
import { flashcardSetService } from '@/features/flashcards/services/flashcard-set.service'
import FlashcardForm from '@/features/flashcards/components/FlashcardForm.vue'
import type { FlashcardParams } from '@/features/flashcards/types'

const route = useRoute()
const router = useRouter()
const deckId = Number(route.params.deckId)
const { loading, error, createFlashcard } = useFlashcards()

const flashcardSetId = ref<number | null>(null)
const setLoadError = ref<string | null>(null)
const setLoading = ref(true)

onMounted(async () => {
  try {
    const sets = await flashcardSetService.list(deckId)
    flashcardSetId.value = sets[0]?.id ?? null
    if (!flashcardSetId.value) {
      setLoadError.value = 'This deck has no sets. Please add a set before adding flashcards.'
    }
  } catch {
    setLoadError.value = 'Could not load deck sets. Please try again.'
  } finally {
    setLoading.value = false
  }
})

async function handleSubmit(params: FlashcardParams) {
  if (!flashcardSetId.value) return
  const flashcard = await createFlashcard(flashcardSetId.value, params)
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

    <div
      v-if="setLoading"
      class="flex justify-center py-16"
    >
      <BaseSpinner size="lg" />
    </div>

    <BaseAlert
      v-else-if="setLoadError"
      variant="error"
      :message="setLoadError"
      class="mb-4"
    />

    <FlashcardForm
      v-else
      submit-label="Create Flashcard"
      :loading="loading"
      :error="error"
      @submit="handleSubmit"
      @cancel="router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: deckId } })"
    />
  </div>
</template>
