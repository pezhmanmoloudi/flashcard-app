<script setup lang="ts">
import { onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import {
  BasePageHeader,
  BaseCard,
  BaseButton,
  BaseEmptyState,
  BaseSpinner,
  BaseAlert,
} from '@/shared/components/ui'
import { useDecks } from '@/features/flashcards/composables/useDecks'
import { useStats } from '@/features/study/composables/useStats'

const router = useRouter()
const { decks, loading, error, fetchDecks } = useDecks()
const { userStats, fetchUserStats } = useStats()

onMounted(() => {
  fetchDecks()
  fetchUserStats()
})
</script>

<template>
  <div>
    <BasePageHeader
      title="Study"
      description="Choose a deck to review your due cards."
    />

    <div
      v-if="userStats"
      class="flex gap-6 mb-6 px-1"
    >
      <div class="flex items-center gap-1.5 text-sm text-gray-500">
        <span class="text-lg font-semibold text-gray-900">{{ userStats.study_streak }}</span>
        day streak
      </div>
      <div class="flex items-center gap-1.5 text-sm text-gray-500">
        <span class="text-lg font-semibold text-gray-900">{{ userStats.cards_mastered }}</span>
        mastered
      </div>
      <div class="flex items-center gap-1.5 text-sm text-gray-500">
        <span class="text-lg font-semibold text-gray-900">{{ userStats.total_sessions }}</span>
        sessions
      </div>
    </div>

    <div
      v-if="loading"
      class="flex justify-center py-16"
    >
      <BaseSpinner size="lg" />
    </div>

    <BaseAlert
      v-else-if="error"
      variant="error"
      :message="error"
    />

    <div
      v-else-if="decks.length > 0"
      class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4"
    >
      <BaseCard
        v-for="deck in decks"
        :key="deck.id"
        padding="md"
        hoverable
        @click="router.push({ name: ROUTE_NAMES.STUDY_SESSION, params: { deckId: deck.id } })"
      >
        <div class="flex items-start justify-between gap-3">
          <div class="flex-1 min-w-0">
            <h3 class="text-sm font-semibold text-gray-900 truncate">
              {{ deck.name }}
            </h3>
            <p
              v-if="deck.description"
              class="mt-0.5 text-xs text-gray-500 line-clamp-1"
            >
              {{ deck.description }}
            </p>
          </div>
          <BaseButton
            size="sm"
            @click.stop="router.push({ name: ROUTE_NAMES.STUDY_SESSION, params: { deckId: deck.id } })"
          >
            Study
          </BaseButton>
        </div>
      </BaseCard>
    </div>

    <BaseEmptyState
      v-else
      title="No decks yet"
      description="Create a deck to start studying."
    >
      <template #action>
        <BaseButton @click="router.push({ name: ROUTE_NAMES.DECK_NEW })">
          Create a deck
        </BaseButton>
      </template>
    </BaseEmptyState>
  </div>
</template>
