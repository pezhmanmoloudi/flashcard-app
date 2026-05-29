<script setup lang="ts">
import { computed } from 'vue'
import { LEARNING_MODE_CONFIG, type LearningMode } from '@/shared/constants/learningModes'

const props = defineProps<{
  mode: LearningMode
  isExpanded: boolean
  deckCount: number
}>()

const emit = defineEmits<{ select: [LearningMode] }>()

const config = computed(() => LEARNING_MODE_CONFIG[props.mode])
</script>

<template>
  <button
    class="w-full flex items-center justify-between px-5 py-4 text-left transition-colors hover:bg-stone-50"
    @click="emit('select', mode)"
  >
    <div class="flex items-center gap-3">
      <span class="text-xl leading-none">{{ config.sourceFlag }}</span>
      <div>
        <p class="text-sm font-semibold text-[var(--color-text)]">
          {{ config.label }}
        </p>
        <p class="text-xs text-stone-400 mt-0.5">
          {{ deckCount }} decks
        </p>
      </div>
      <span class="text-xl leading-none">{{ config.targetFlag }}</span>
    </div>
    <svg
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 20 20"
      fill="currentColor"
      class="w-4 h-4 text-stone-400 transition-transform duration-200 shrink-0"
      :class="isExpanded ? 'rotate-180' : ''"
    >
      <path
        fill-rule="evenodd"
        d="M5.22 8.22a.75.75 0 0 1 1.06 0L10 11.94l3.72-3.72a.75.75 0 1 1 1.06 1.06l-4.25 4.25a.75.75 0 0 1-1.06 0L5.22 9.28a.75.75 0 0 1 0-1.06Z"
        clip-rule="evenodd"
      />
    </svg>
  </button>
</template>
