<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import {
  BasePageHeader,
  BaseButton,
  BaseSpinner,
  BaseAlert,
  BaseCard,
} from '@/shared/components/ui'
import { useDeck } from '@/features/flashcards/composables/useDeck'
import { useFlashcardSets } from '@/features/flashcards/composables/useFlashcardSets'
import FlashcardSetCard from '@/features/flashcards/components/FlashcardSetCard.vue'
import { useStats } from '@/features/study/composables/useStats'
import { formatDate } from '@/shared/utils'

const route = useRoute()
const router = useRouter()
const deckId = Number(route.params.id)

const { deck, loading, error, fetchDeck, deleteDeck } = useDeck()
const { deckStats, fetchDeckStats } = useStats()
const { flashcardSets, loading: setsLoading, fetchFlashcardSets } = useFlashcardSets()
const confirmingDelete = ref(false)

const activeSet = computed(() =>
  flashcardSets.value.find((s) => s.is_unlocked && !s.is_completed) ?? null,
)

const allCompleted = computed(
  () => flashcardSets.value.length > 0 && flashcardSets.value.every((s) => s.is_completed),
)

onMounted(() => {
  fetchDeck(deckId)
  fetchDeckStats(deckId)
  fetchFlashcardSets(deckId)
})

async function handleDelete() {
  const ok = await deleteDeck(deckId)
  if (ok) router.push({ name: ROUTE_NAMES.DECKS })
}

function studySet(setId: number) {
  router.push({
    name: ROUTE_NAMES.STUDY_SESSION,
    params: { deckId },
    query: { setId },
  })
}

function reviewSet(setId: number) {
  router.push({
    name: ROUTE_NAMES.STUDY_SESSION,
    params: { deckId },
    query: { setId, reviewsOnly: 'true' },
  })
}

function reviewAll() {
  router.push({
    name: ROUTE_NAMES.STUDY_SESSION,
    params: { deckId },
    query: { reviewsOnly: 'true' },
  })
}
</script>

<template>
  <div>
    <BasePageHeader :title="deck?.name ?? 'Deck'">
      <template
        v-if="deck"
        #actions
      >
        <template v-if="confirmingDelete">
          <span class="text-xs text-red-600">Delete this deck?</span>
          <BaseButton
            variant="danger"
            size="sm"
            :loading="loading"
            @click="handleDelete"
          >
            Yes, delete
          </BaseButton>
          <BaseButton
            variant="ghost"
            size="sm"
            :disabled="loading"
            @click="confirmingDelete = false"
          >
            Cancel
          </BaseButton>
        </template>
        <template v-else>
          <BaseButton
            variant="secondary"
            size="sm"
            @click="router.push({ name: ROUTE_NAMES.DECK_EDIT, params: { id: deckId } })"
          >
            Edit
          </BaseButton>
          <BaseButton
            variant="ghost"
            size="sm"
            @click="confirmingDelete = true"
          >
            Delete
          </BaseButton>
        </template>
      </template>
    </BasePageHeader>

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

    <template v-else-if="deck">
      <!-- Deck meta -->
      <BaseCard
        v-if="deck.description"
        padding="md"
        class="mb-6"
      >
        <p class="text-sm text-[var(--color-text)]">
          {{ deck.description }}
        </p>
        <p class="mt-2 text-xs text-[var(--color-text-muted)]">
          Created {{ formatDate(deck.created_at) }}
        </p>
      </BaseCard>

      <!-- Stats row -->
      <div
        v-if="deckStats"
        class="grid grid-cols-4 gap-3 mb-6"
      >
        <div
          v-for="stat in [
            { label: 'Total', value: deckStats.total_cards },
            { label: 'Due', value: deckStats.due_count },
            { label: 'Learning', value: deckStats.learning_count },
            { label: 'Mastered', value: deckStats.mastered_count },
          ]"
          :key="stat.label"
          class="rounded-[var(--radius-card)] bg-[var(--color-surface-alt)] px-3 py-3 text-center"
        >
          <p class="text-xl font-semibold text-[var(--color-text)]">
            {{ stat.value }}
          </p>
          <p class="text-xs text-[var(--color-text-muted)] mt-0.5">
            {{ stat.label }}
          </p>
        </div>
      </div>

      <!-- Sets loading -->
      <div
        v-if="setsLoading && flashcardSets.length === 0"
        class="flex justify-center py-10"
      >
        <BaseSpinner size="lg" />
      </div>

      <template v-else-if="flashcardSets.length > 0">
        <!-- Active set CTA -->
        <div
          v-if="activeSet"
          class="mb-6 rounded-[var(--radius-card)] border border-[var(--color-primary)] bg-[var(--color-primary-light)] px-5 py-4 flex items-center justify-between gap-4"
        >
          <div class="min-w-0">
            <p class="text-[11px] font-semibold uppercase tracking-wider text-[var(--color-primary)] mb-1">
              Continue Learning
            </p>
            <p class="text-sm font-semibold text-[var(--color-text)] truncate">
              {{ activeSet.name }}
            </p>
            <p class="text-xs text-[var(--color-text-muted)] mt-0.5">
              {{ activeSet.flashcard_count }} {{ activeSet.flashcard_count === 1 ? 'card' : 'cards' }}
            </p>
          </div>
          <BaseButton
            class="shrink-0"
            @click="studySet(activeSet.id)"
          >
            Start →
          </BaseButton>
        </div>

        <!-- All completed CTA -->
        <div
          v-else-if="allCompleted"
          class="mb-6 rounded-[var(--radius-card)] border border-green-200 bg-green-50 px-5 py-4 flex items-center justify-between gap-4"
        >
          <div>
            <p class="text-sm font-semibold text-green-700">
              All sets completed!
            </p>
            <p class="text-xs text-green-600 mt-0.5">
              Keep your cards fresh with daily reviews.
            </p>
          </div>
          <BaseButton
            variant="secondary"
            class="shrink-0"
            @click="reviewAll"
          >
            Review →
          </BaseButton>
        </div>

        <!-- Set progression list -->
        <div class="space-y-3">
          <p class="text-xs font-semibold uppercase tracking-wider text-[var(--color-text-muted)] mb-4">
            {{ flashcardSets.length }} {{ flashcardSets.length === 1 ? 'Set' : 'Sets' }}
          </p>

          <FlashcardSetCard
            v-for="(set, idx) in flashcardSets"
            :key="set.id"
            :set="set"
            :set-number="idx + 1"
            @study="studySet(set.id)"
            @review="reviewSet(set.id)"
          />
        </div>
      </template>

      <p
        v-else-if="!setsLoading"
        class="text-sm text-[var(--color-text-muted)] py-4"
      >
        No sets in this deck yet.
      </p>
    </template>
  </div>
</template>
