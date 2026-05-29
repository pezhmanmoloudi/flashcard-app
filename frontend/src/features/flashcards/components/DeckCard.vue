<script setup lang="ts">
import { ref, computed } from 'vue'
import { useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BaseCard, BaseButton } from '@/shared/components/ui'
import { formatRelativeDate } from '@/shared/utils'
import { LEARNING_MODE_CONFIG } from '@/shared/constants/learningModes'
import type { Deck } from '../types'
import type { DeckStats } from '@/features/study/types'

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
const lockedMessage = ref(false)
let lockedTimer: ReturnType<typeof setTimeout> | null = null

const isLocked = computed(() => props.deck.is_unlocked === false)
const isCompleted = computed(() => props.deck.is_completed === true)

const progressPercent = computed(() => {
  if (props.deck.progress_percentage !== undefined) return props.deck.progress_percentage
  if (!props.stats || props.stats.total_cards === 0) return 0
  return Math.round((props.stats.mastered_count / props.stats.total_cards) * 100)
})

const progressLabel = computed(() => {
  if (props.deck.total_cards_count !== undefined) {
    return `${props.deck.completed_cards_count ?? 0} / ${props.deck.total_cards_count} cards`
  }
  if (props.stats) {
    return `${props.stats.total_cards} cards`
  }
  return `${props.deck.flashcard_count} cards`
})

function navigate() {
  if (!confirmingDelete.value) {
    router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: props.deck.id } })
  }
}

function handleDashboardClick() {
  if (isLocked.value) {
    showLockedMessage()
    return
  }
  router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: props.deck.id } })
}

function showLockedMessage() {
  lockedMessage.value = true
  if (lockedTimer) clearTimeout(lockedTimer)
  lockedTimer = setTimeout(() => {
    lockedMessage.value = false
  }, 2000)
}
</script>

<template>
  <!-- Dashboard variant: study-focused with progression states -->
  <div
    v-if="variant === 'dashboard'"
    class="flex flex-col gap-4 rounded-2xl border p-5 transition-shadow duration-200 cursor-pointer"
    :class="
      isLocked
        ? 'bg-stone-50 border-stone-100'
        : isCompleted
          ? 'bg-emerald-50 border-emerald-100 shadow-sm'
          : 'bg-white border-stone-200 shadow-sm hover:shadow-md'
    "
    @click="handleDashboardClick"
  >
    <div class="flex items-start justify-between gap-2">
      <div class="flex-1 min-w-0">
        <h3
          class="text-base font-semibold truncate"
          :class="isLocked ? 'text-stone-400' : 'text-[var(--color-text)]'"
        >
          {{ deck.name }}
        </h3>
        <p
          v-if="deck.description && !isLocked"
          class="mt-1 text-sm text-[var(--color-text-muted)] line-clamp-2 leading-relaxed"
        >
          {{ deck.description }}
        </p>
      </div>

      <!-- Lock icon -->
      <svg
        v-if="isLocked"
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        class="w-4 h-4 text-gray-300 shrink-0 mt-0.5"
      >
        <path
          fill-rule="evenodd"
          d="M10 1a4.5 4.5 0 0 0-4.5 4.5V9H5a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2v-6a2 2 0 0 0-2-2h-.5V5.5A4.5 4.5 0 0 0 10 1Zm3 8V5.5a3 3 0 1 0-6 0V9h6Z"
          clip-rule="evenodd"
        />
      </svg>

      <!-- Completed badge -->
      <span
        v-else-if="isCompleted"
        class="text-[10px] font-semibold uppercase tracking-wider text-emerald-700 bg-emerald-100 px-1.5 py-0.5 rounded shrink-0"
      >
        Done
      </span>
    </div>

    <!-- Progress line -->
    <div
      v-if="!isLocked"
      class="flex items-center justify-between text-xs"
      :class="isCompleted ? 'text-green-500' : 'text-[var(--color-text-muted)]'"
    >
      <span>{{ progressLabel }}</span>
      <span v-if="stats && !isCompleted">{{ stats.due_count }} due</span>
    </div>

    <!-- Progress bar -->
    <div
      v-if="!isLocked"
      class="w-full h-1 rounded-full overflow-hidden"
      :class="isCompleted ? 'bg-emerald-100' : 'bg-stone-100'"
      role="progressbar"
      :aria-valuenow="progressPercent"
      aria-valuemin="0"
      aria-valuemax="100"
    >
      <div
        class="h-full rounded-full transition-all duration-500"
        :class="isCompleted ? 'bg-emerald-400' : 'bg-sky-400'"
        :style="{ width: `${progressPercent}%` }"
      />
    </div>

    <!-- Action button -->
    <BaseButton
      v-if="!isLocked && !isCompleted"
      class="w-full"
      @click.stop="handleDashboardClick"
    >
      Study Now
    </BaseButton>
    <BaseButton
      v-else-if="isCompleted"
      variant="secondary"
      class="w-full"
      @click.stop="handleDashboardClick"
    >
      Review
    </BaseButton>

    <!-- Locked message -->
    <p
      v-if="lockedMessage"
      class="text-xs text-center text-gray-400 -mt-1"
    >
      Complete the previous deck first
    </p>
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
            v-if="deck.language_pair && LEARNING_MODE_CONFIG[deck.language_pair]"
            class="text-xs font-medium text-blue-600 bg-blue-50 px-1.5 py-0.5 rounded"
          >
            {{ LEARNING_MODE_CONFIG[deck.language_pair].label }}
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
