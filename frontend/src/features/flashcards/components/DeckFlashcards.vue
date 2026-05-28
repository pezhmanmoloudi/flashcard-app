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
import { useFlashcards } from '../composables/useFlashcards'
import FlashcardCard from './FlashcardCard.vue'
import type { Flashcard } from '../types'

interface Props {
  deckId: number
}

const props = defineProps<Props>()

const router = useRouter()
const { flashcards, meta, loading, error, fetchFlashcards, destroyFlashcard } = useFlashcards()
const currentPage = ref(1)

async function loadPage(page: number) {
  currentPage.value = page
  await fetchFlashcards(props.deckId, page)
}

onMounted(() => loadPage(1))

async function handleDelete(flashcard: Flashcard) {
  await destroyFlashcard(flashcard.id)
}

function goToNew() {
  router.push({ name: ROUTE_NAMES.FLASHCARD_NEW, params: { deckId: props.deckId } })
}
</script>

<template>
  <div>
    <div class="flex items-center justify-between mb-4">
      <h2 class="text-sm font-semibold text-gray-900">
        Flashcards
      </h2>
      <BaseButton
        v-if="flashcards.length > 0 || loading"
        size="sm"
        @click="goToNew"
      >
        Add Flashcard
      </BaseButton>
    </div>

    <BaseAlert
      v-if="error && !loading"
      variant="error"
      :message="error"
      class="mb-4"
    />

    <div
      v-if="loading && flashcards.length === 0"
      class="flex justify-center py-10"
    >
      <BaseSpinner size="lg" />
    </div>

    <template v-else-if="flashcards.length > 0">
      <div class="space-y-3">
        <FlashcardCard
          v-for="flashcard in flashcards"
          :key="flashcard.id"
          :flashcard="flashcard"
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
      title="No flashcards yet"
      description="Add your first flashcard to start studying."
    >
      <template #action>
        <BaseButton @click="goToNew">
          Add Flashcard
        </BaseButton>
      </template>
    </BaseEmptyState>
  </div>
</template>
