<script setup lang="ts">
interface Props {
  cardsStudied: number
}

defineProps<Props>()
const emit = defineEmits<{ done: []; again: [] }>()
</script>

<template>
  <div class="flex flex-col items-center text-center py-10 gap-8">
    <!-- Icon -->
    <div
      class="w-20 h-20 rounded-full flex items-center justify-center"
      :class="cardsStudied > 0 ? 'bg-green-100' : 'bg-[var(--color-surface-alt)]'"
    >
      <svg
        v-if="cardsStudied > 0"
        class="w-9 h-9 text-green-500"
        fill="none"
        stroke="currentColor"
        stroke-width="2"
        viewBox="0 0 24 24"
        aria-hidden="true"
      >
        <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
      </svg>
      <svg
        v-else
        class="w-9 h-9 text-[var(--color-text-muted)]"
        fill="none"
        stroke="currentColor"
        stroke-width="2"
        viewBox="0 0 24 24"
        aria-hidden="true"
      >
        <path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
      </svg>
    </div>

    <!-- Message -->
    <div>
      <h2 class="text-xl font-bold text-[var(--color-text)]">
        {{ cardsStudied > 0 ? 'Session complete!' : 'All caught up' }}
      </h2>
      <p class="mt-2 text-sm text-[var(--color-text-muted)] max-w-[20rem]">
        <template v-if="cardsStudied > 0">
          You reviewed {{ cardsStudied }} {{ cardsStudied === 1 ? 'card' : 'cards' }}. Great work.
        </template>
        <template v-else>
          No cards are due right now. Come back later or explore the Library.
        </template>
      </p>
    </div>

    <!-- Actions -->
    <div class="flex flex-col gap-3 w-full">
      <button
        v-if="cardsStudied > 0"
        class="w-full py-3.5 rounded-[var(--radius-btn)] bg-[var(--color-primary)] text-white text-sm font-semibold hover:opacity-90 transition-opacity"
        @click="emit('again')"
      >
        Study again
      </button>
      <button
        class="w-full py-3.5 rounded-[var(--radius-btn)] border border-[var(--color-border)] text-sm font-medium text-[var(--color-text-muted)] hover:bg-gray-50 transition-colors"
        @click="emit('done')"
      >
        Done
      </button>
    </div>
  </div>
</template>
