<script setup lang="ts">
import { BaseButton } from '@/shared/components/ui'

interface Props {
  cardsStudied: number
}

defineProps<Props>()

const emit = defineEmits<{
  studyAgain: []
  backToDeck: []
}>()
</script>

<template>
  <div class="flex flex-col items-center justify-center py-16 px-4 text-center">
    <div class="w-14 h-14 rounded-full bg-green-100 flex items-center justify-center mb-5">
      <svg
        class="w-7 h-7 text-green-600"
        fill="none"
        viewBox="0 0 24 24"
        stroke="currentColor"
        stroke-width="2.5"
        aria-hidden="true"
      >
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          d="M4.5 12.75l6 6 9-13.5"
        />
      </svg>
    </div>

    <h2 class="text-lg font-semibold text-gray-900 mb-1">
      Session complete!
    </h2>
    <p class="text-sm text-gray-500 mb-8">
      You studied
      <span class="font-medium text-gray-700">{{ cardsStudied }}</span>
      {{ cardsStudied === 1 ? 'card' : 'cards' }} this session.
    </p>

    <div class="flex gap-3">
      <BaseButton
        variant="secondary"
        @click="emit('backToDeck')"
      >
        Back to deck
      </BaseButton>
      <BaseButton @click="emit('studyAgain')">
        Study again
      </BaseButton>
    </div>
  </div>
</template>
