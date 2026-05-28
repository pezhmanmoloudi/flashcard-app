<script setup lang="ts">
import type { StudyRating } from '../types'

const emit = defineEmits<{ rate: [rating: StudyRating] }>()

const ratings: Array<{ rating: StudyRating; label: string; key: string; classes: string }> = [
  {
    rating: 'again',
    label: 'Again',
    key: '1',
    classes: 'bg-red-100 text-red-700 hover:bg-red-200',
  },
  {
    rating: 'hard',
    label: 'Hard',
    key: '2',
    classes: 'bg-gray-100 text-gray-700 hover:bg-gray-200',
  },
  {
    rating: 'good',
    label: 'Good',
    key: '3',
    classes: 'bg-[var(--color-primary-light)] text-[var(--color-primary)] hover:opacity-90',
  },
  {
    rating: 'easy',
    label: 'Easy',
    key: '4',
    classes: 'bg-green-100 text-green-700 hover:bg-green-200',
  },
]
</script>

<template>
  <div class="flex gap-3 justify-center">
    <button
      v-for="r in ratings"
      :key="r.rating"
      class="flex-1 flex flex-col items-center gap-1 py-3 px-2 rounded-[var(--radius-btn)] font-medium text-sm transition-all focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[var(--color-primary)] focus-visible:ring-offset-2"
      :class="r.classes"
      @click="emit('rate', r.rating)"
    >
      {{ r.label }}
      <span class="text-[10px] opacity-50 font-normal">{{ r.key }}</span>
    </button>
  </div>
</template>
