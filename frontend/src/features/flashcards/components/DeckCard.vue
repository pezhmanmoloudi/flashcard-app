<script setup lang="ts">
import { ref, computed } from 'vue'
import { useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BaseCard, BaseButton } from '@/shared/components/ui'
import { formatRelativeDate } from '@/shared/utils'
import type { Deck } from '../types'
import type { DeckStats } from '@/features/study/types'

const LANGUAGE_PAIR_LABELS: Record<string, string> = {
  de_to_en: 'DE → EN',
  de_to_fa: 'DE → FA',
  en_to_fa: 'EN → FA',
}

interface Props {
  deck: Deck
  variant?: 'library' | 'dashboard'
  stats?: DeckStats | null
}

const props = withDefaults(defineProps<Props>(), {
  variant: 'library',
  stats: null,
})

const emit = defineEmits<{
  edit: [deck: Deck]
  delete: [deck: Deck]
}>()

const router = useRouter()
const confirmingDelete = ref(false)

function navigate() {
  if (!confirmingDelete.value) {
    router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: props.deck.id } })
  }
}

function studyNow() {
  router.push({ name: ROUTE_NAMES.STUDY_SESSION, params: { deckId: props.deck.id } })
}

const masteryPercent = computed(() => {
  if (!props.stats || props.stats.total_cards === 0) return 0
  return Math.round((props.stats.mastered_count / props.stats.total_cards) * 100)
})
</script>

<template>
  <!-- Dashboard variant: study-focused, no management actions -->
  <div
    v-if="variant === 'dashboard'"
    class="flex flex-col gap-4 bg-white border border-[var(--color-border)]
           rounded-[var(--radius-card)] p-5 transition-shadow duration-200
           hover:shadow-md dark:bg-gray-900 dark:border-gray-700"
  >
    <div class="flex-1 min-w-0">
      <h3 class="text-base font-semibold text-[var(--color-text)] truncate">
        {{ deck.name }}
      </h3>
      <p
        v-if="deck.description"
        class="mt-1 text-sm text-[var(--color-text-muted)] line-clamp-2 leading-relaxed"
      >
        {{ deck.description }}
      </p>
    </div>

    <div class="flex items-center justify-between text-xs text-gray-400">
      <span>{{ stats ? stats.total_cards : deck.flashcard_count }} cards</span>
      <span v-if="stats">
        {{ stats.mastered_count }} mastered &middot; {{ stats.due_count }} due
      </span>
    </div>

    <div
      class="w-full h-1.5 bg-gray-100 rounded-full overflow-hidden dark:bg-gray-700"
      role="progressbar"
      :aria-valuenow="masteryPercent"
      aria-valuemin="0"
      aria-valuemax="100"
    >
      <div
        class="h-full bg-[var(--color-primary)] rounded-full transition-all duration-500"
        :style="{ width: `${masteryPercent}%` }"
      />
    </div>

    <BaseButton
      class="w-full"
      @click="studyNow"
    >
      Study Now
    </BaseButton>
  </div>

  <!-- Library variant: full management actions (unchanged) -->
  <BaseCard
    v-else
    hoverable
    padding="md"
    @click="navigate"
  >
    <div class="flex items-start justify-between gap-3">
      <div class="flex-1 min-w-0">
        <h3 class="text-sm font-semibold text-gray-900 truncate">
          {{ deck.name }}
        </h3>
        <div
          v-if="deck.level || deck.language_pair"
          class="mt-1.5 flex items-center gap-1.5 flex-wrap"
        >
          <span
            v-if="deck.level"
            class="text-xs font-medium text-gray-500 bg-gray-100 px-1.5 py-0.5 rounded"
          >
            {{ deck.level }}
          </span>
          <span
            v-if="deck.language_pair && LANGUAGE_PAIR_LABELS[deck.language_pair]"
            class="text-xs font-medium text-blue-600 bg-blue-50 px-1.5 py-0.5 rounded"
          >
            {{ LANGUAGE_PAIR_LABELS[deck.language_pair] }}
          </span>
        </div>
        <p
          v-if="deck.description"
          class="mt-1 text-xs text-gray-500 line-clamp-2"
        >
          {{ deck.description }}
        </p>
        <p class="mt-2 text-xs text-gray-400">
          {{ deck.flashcard_count }} cards · {{ formatRelativeDate(deck.created_at) }}
        </p>
      </div>

      <div
        class="flex items-center gap-1 shrink-0"
        @click.stop
      >
        <template v-if="confirmingDelete">
          <span class="text-xs text-red-600 mr-1">Delete?</span>
          <BaseButton
            size="sm"
            variant="danger"
            @click="emit('delete', deck)"
          >
            Yes
          </BaseButton>
          <BaseButton
            size="sm"
            variant="ghost"
            @click="confirmingDelete = false"
          >
            No
          </BaseButton>
        </template>
        <template v-else>
          <BaseButton
            size="sm"
            variant="ghost"
            @click="emit('edit', deck)"
          >
            Edit
          </BaseButton>
          <BaseButton
            size="sm"
            variant="ghost"
            @click="confirmingDelete = true"
          >
            Delete
          </BaseButton>
        </template>
      </div>
    </div>
  </BaseCard>
</template>
