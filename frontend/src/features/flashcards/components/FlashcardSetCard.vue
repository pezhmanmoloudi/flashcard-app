<script setup lang="ts">
import type { FlashcardSet } from '../types'

interface Props {
  set: FlashcardSet
  setNumber: number
  isSelected?: boolean
}

defineProps<Props>()
const emit = defineEmits<{ select: [] }>()
</script>

<template>
  <button
    class="aspect-square w-full rounded-2xl border-2 flex flex-col justify-between p-4 text-left transition-transform"
    :class="[
      !set.is_unlocked
        ? 'border-[var(--color-border)] bg-[var(--color-surface-alt)] cursor-default'
        : set.is_completed
          ? 'border-emerald-400 bg-emerald-50 active:scale-95 cursor-pointer'
          : 'border-[var(--color-primary)] bg-white active:scale-95 cursor-pointer',
      isSelected && set.is_unlocked && !set.is_completed ? 'ring-2 ring-offset-2 ring-[var(--color-primary)]' : '',
      isSelected && set.is_completed ? 'ring-2 ring-offset-2 ring-emerald-400' : '',
    ]"
    :disabled="!set.is_unlocked || set.flashcard_count === 0"
    @click="set.is_unlocked && set.flashcard_count > 0 && emit('select')"
  >
    <!-- Top: count + status icon -->
    <div class="flex items-start justify-between">
      <span
        class="text-3xl font-bold tabular-nums"
        :class="
          !set.is_unlocked ? 'text-gray-300'
          : set.is_completed ? 'text-emerald-500'
          : 'text-[var(--color-primary)]'
        "
      >
        {{ set.flashcard_count }}
      </span>

      <!-- Lock icon -->
      <svg
        v-if="!set.is_unlocked"
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        class="w-5 h-5 text-gray-300 mt-1"
      >
        <path fill-rule="evenodd" d="M10 1a4.5 4.5 0 0 0-4.5 4.5V9H5a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2v-6a2 2 0 0 0-2-2h-.5V5.5A4.5 4.5 0 0 0 10 1Zm3 8V5.5a3 3 0 1 0-6 0V9h6Z" clip-rule="evenodd" />
      </svg>
      <!-- Done badge -->
      <span
        v-else-if="set.is_completed"
        class="text-[10px] font-semibold uppercase tracking-wider text-emerald-700 bg-emerald-100 px-1.5 py-0.5 rounded mt-1"
      >
        Done
      </span>
      <!-- Active badge -->
      <span
        v-else
        class="text-[10px] font-semibold uppercase tracking-wider text-[var(--color-primary)] bg-[var(--color-primary-light)] px-1.5 py-0.5 rounded mt-1"
      >
        Active
      </span>
    </div>

    <!-- Bottom: name + status -->
    <div>
      <p
        class="text-sm font-semibold leading-snug"
        :class="
          !set.is_unlocked ? 'text-gray-400'
          : set.is_completed ? 'text-emerald-700'
          : 'text-[var(--color-text)]'
        "
      >
        {{ set.name }}
      </p>
      <p class="text-xs mt-0.5">
        <span v-if="!set.is_unlocked" class="text-gray-400">Locked</span>
        <span v-else-if="set.is_completed" class="text-emerald-600">Completed</span>
        <span v-else class="text-[var(--color-text-muted)]">{{ set.flashcard_count }} cards</span>
      </p>
    </div>

  </button>
</template>
