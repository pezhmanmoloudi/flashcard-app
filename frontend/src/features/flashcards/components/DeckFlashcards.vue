<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import {
  BaseButton,
  BaseEmptyState,
  BaseSpinner,
  BaseAlert,
} from '@/shared/components/ui'
import { useFlashcards } from '../composables/useFlashcards'
import { flashcardSetService } from '../services/flashcard-set.service'
import FlashcardCard from './FlashcardCard.vue'
import FlashcardForm from './FlashcardForm.vue'
import type { Flashcard, FlashcardParams } from '../types'

interface Props {
  deckId: number
  mode: 'create' | 'edit' | 'add'
}

const props = defineProps<Props>()

const emit = defineEmits<{
  cardSaved: []
  pendingCountChange: [count: number]
}>()

const { flashcards, meta, loading, error, fetchFlashcards, destroyFlashcard, createFlashcard } = useFlashcards()
const currentPage = ref(1)

const pendingCards = ref<string[]>([])
let _uid = 0
function newUid() { return String(++_uid) }

const flashcardSetId = ref<number | null>(null)
const setLoading = ref(false)
const setError = ref<string | null>(null)

type CardValues = { front_text: string; back_text: string; source_language: string; target_language: string }
const cardData   = ref<Record<string, CardValues>>({})
const cardErrors = ref<Record<string, string | null>>({})

const isCreateLikeMode = props.mode === 'create' || props.mode === 'add'
const defaultCardCount = 1

function isCardValid(uid: string): boolean {
  const d = cardData.value[uid]
  return !!(d?.front_text?.trim() && d?.back_text?.trim() && d?.source_language && d?.target_language)
}

const canSave = computed(() =>
  pendingCards.value.length > 0 && pendingCards.value.every(isCardValid)
)

async function loadPage(page: number) {
  currentPage.value = page
  await fetchFlashcards(props.deckId, page)
}

onMounted(async () => {
  loadPage(1)

  if (isCreateLikeMode) {
    setLoading.value = true
    try {
      const sets = await flashcardSetService.list(props.deckId)
      flashcardSetId.value = sets[0]?.id ?? null
      if (!flashcardSetId.value) {
        setError.value = 'This deck has no sets. Cards cannot be added yet.'
      }
    } catch {
      setError.value = 'Could not load deck configuration.'
    } finally {
      setLoading.value = false
    }
    pendingCards.value = Array.from({ length: defaultCardCount }, newUid)
    emit('pendingCountChange', pendingCards.value.length)
  }
})

function addCard() {
  pendingCards.value = [...pendingCards.value, newUid()]
  emit('pendingCountChange', pendingCards.value.length)
}

function handleCardChange(uid: string, values: CardValues) {
  cardData.value = { ...cardData.value, [uid]: values }
}

async function handleSaveAll() {
  if (!flashcardSetId.value || !canSave.value) return
  for (const uid of [...pendingCards.value]) {
    const d = cardData.value[uid]
    const created = await createFlashcard(flashcardSetId.value, {
      front_text:      d.front_text.trim(),
      back_text:       d.back_text.trim(),
      source_language: d.source_language,
      target_language: d.target_language,
    })
    if (created) {
      emit('cardSaved')
      delete cardData.value[uid]
    } else {
      cardErrors.value = { ...cardErrors.value, [uid]: error.value }
      return
    }
  }
  const fresh = newUid()
  pendingCards.value = [fresh]
  cardErrors.value = {}
  emit('pendingCountChange', 1)
}

function handleCardCancel(uid: string) {
  pendingCards.value = pendingCards.value.filter(id => id !== uid)
  const { [uid]: _cd, ...restData } = cardData.value
  const { [uid]: _ce, ...restErrors } = cardErrors.value
  cardData.value = restData
  cardErrors.value = restErrors
  emit('pendingCountChange', pendingCards.value.length)
}

async function handleDelete(flashcard: Flashcard) {
  await destroyFlashcard(flashcard.id)
}
</script>

<template>
  <div>
    <div class="flex items-center justify-between mb-4">
      <h2 class="text-sm font-semibold text-gray-900">
        Flashcards
      </h2>
      <BaseButton
        v-if="!isCreateLikeMode && mode !== 'edit'"
        size="sm"
        @click="addCard"
      >
        Add Card
      </BaseButton>
    </div>

    <BaseAlert
      v-if="setError"
      variant="error"
      :message="setError"
      class="mb-4"
    />

    <div
      v-if="setLoading"
      class="flex justify-center py-4"
    >
      <BaseSpinner size="md" />
    </div>

    <div
      v-for="uid in pendingCards"
      :key="uid"
      class="relative mb-4"
    >
      <FlashcardForm
        :show-actions="!isCreateLikeMode"
        :loading="loading"
        :error="cardErrors[uid] ?? (loading ? null : error)"
        @change="handleCardChange(uid, $event)"
        @cancel="handleCardCancel(uid)"
      />
      <button
        v-if="isCreateLikeMode"
        type="button"
        class="absolute top-0 right-0 p-1 text-gray-400 hover:text-red-500 transition-colors"
        aria-label="Remove card"
        @click="handleCardCancel(uid)"
      >
        ✕
      </button>
    </div>

    <template v-if="isCreateLikeMode">
      <div class="mt-2">
        <BaseButton
          variant="secondary"
          size="sm"
          @click="addCard"
        >
          Add Card
        </BaseButton>
      </div>
      <div class="mt-4 flex justify-end">
        <BaseButton
          :disabled="!canSave || loading"
          :loading="loading"
          @click="handleSaveAll"
        >
          Save
        </BaseButton>
      </div>
    </template>

    <BaseAlert
      v-if="error && !loading"
      variant="error"
      :message="error"
      class="mb-4 mt-4"
    />

    <div
      v-if="loading && flashcards.length === 0"
      class="flex justify-center py-10"
    >
      <BaseSpinner size="lg" />
    </div>

    <template v-else-if="flashcards.length > 0">
      <div class="space-y-3 mt-6">
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
      v-else-if="!loading && pendingCards.length === 0"
      title="No flashcards yet"
      description="Add your first flashcard to start studying."
    >
      <template
        v-if="isCreateLikeMode"
        #action
      >
        <BaseButton @click="addCard">
          Add Card
        </BaseButton>
      </template>
    </BaseEmptyState>
  </div>
</template>
