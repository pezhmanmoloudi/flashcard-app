<script setup lang="ts">
import type { FlashcardSet } from '../types'

interface Props {
  set: FlashcardSet
  setNumber: number
}

defineProps<Props>()
const emit = defineEmits<{
  study: []
  review: []
}>()

</script>

<template>
  <div
    class="relative flex items-center gap-4 rounded-[var(--radius-card)] border px-5 py-4 transition-shadow"
    :class="
      set.is_unlocked
        ? 'bg-white border-[var(--color-border)] hover:shadow-sm'
        : 'bg-gray-50 border-gray-100'
    "
  >
    <!-- Status strip -->
    <div
      class="absolute left-0 top-0 bottom-0 w-1 rounded-l-[var(--radius-card)]"
      :class="
        set.is_completed
          ? 'bg-green-400'
          : set.is_unlocked
            ? 'bg-[var(--color-primary)]'
            : 'bg-gray-200'
      "
    />

    <!-- Badge -->
    <div
      class="flex-shrink-0 w-9 h-9 rounded-full flex items-center justify-center text-sm font-semibold"
      :class="
        set.is_completed
          ? 'bg-green-100 text-green-600'
          : set.is_unlocked
            ? 'bg-[var(--color-primary-light)] text-[var(--color-primary)]'
            : 'bg-gray-100 text-gray-300'
      "
    >
      <!-- Checkmark -->
      <svg
        v-if="set.is_completed"
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        class="w-4 h-4"
      >
        <path
          fill-rule="evenodd"
          d="M16.704 4.153a.75.75 0 0 1 .143 1.052l-8 10.5a.75.75 0 0 1-1.127.075l-4.5-4.5a.75.75 0 0 1 1.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 0 1 1.05-.143Z"
          clip-rule="evenodd"
        />
      </svg>
      <!-- Lock -->
      <svg
        v-else-if="!set.is_unlocked"
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        class="w-4 h-4"
      >
        <path
          fill-rule="evenodd"
          d="M10 1a4.5 4.5 0 0 0-4.5 4.5V9H5a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2v-6a2 2 0 0 0-2-2h-.5V5.5A4.5 4.5 0 0 0 10 1Zm3 8V5.5a3 3 0 1 0-6 0V9h6Z"
          clip-rule="evenodd"
        />
      </svg>
      <!-- Number -->
      <span v-else>{{ setNumber }}</span>
    </div>

    <!-- Info -->
    <div class="flex-1 min-w-0">
      <div class="flex items-center gap-2">
        <p
          class="text-sm font-semibold truncate"
          :class="set.is_unlocked ? 'text-[var(--color-text)]' : 'text-gray-400'"
        >
          {{ set.name }}
        </p>
        <!-- Active indicator -->
        <span
          v-if="set.is_unlocked && !set.is_completed"
          class="flex-shrink-0 text-[10px] font-semibold uppercase tracking-wider text-[var(--color-primary)] bg-[var(--color-primary-light)] px-1.5 py-0.5 rounded"
        >
          Active
        </span>
      </div>
      <p
        class="text-xs mt-0.5"
        :class="set.is_unlocked ? 'text-[var(--color-text-muted)]' : 'text-gray-400'"
      >
        <template v-if="set.is_unlocked">
          {{ set.flashcard_count }} {{ set.flashcard_count === 1 ? 'card' : 'cards' }}
          <span
            v-if="set.is_completed"
            class="ml-2 text-green-500 font-medium"
          >Completed</span>
        </template>
        <template v-else>
          Complete Set {{ setNumber - 1 }} to unlock
        </template>
      </p>
    </div>

    <!-- Action -->
    <template v-if="set.is_unlocked && set.flashcard_count > 0">
      <button
        v-if="set.is_completed"
        class="flex-shrink-0 text-xs font-semibold text-[var(--color-text-muted)] hover:text-[var(--color-text)] transition-colors"
        @click="emit('review')"
      >
        Review →
      </button>
      <button
        v-else
        class="flex-shrink-0 text-xs font-semibold text-[var(--color-primary)] hover:opacity-75 transition-opacity"
        @click="emit('study')"
      >
        Study →
      </button>
    </template>
    <span
      v-else-if="set.is_unlocked && set.flashcard_count === 0"
      class="flex-shrink-0 text-xs text-gray-300"
    >
      Empty
    </span>
  </div>
</template>
