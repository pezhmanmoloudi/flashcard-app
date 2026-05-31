<script setup lang="ts">
import { computed } from 'vue'
import { LEARNING_MODE_CONFIG, type LearningMode } from '@/shared/constants/learningModes'

const props = defineProps<{
  mode: LearningMode
  totalLevels: number
  completedLevels: number
}>()

const emit = defineEmits<{ select: [LearningMode] }>()

const config = computed(() => LEARNING_MODE_CONFIG[props.mode])

const statusText = computed(() => {
  if (props.totalLevels === 0) return 'No levels yet'
  if (props.completedLevels === props.totalLevels) return 'All levels done'
  return `${props.completedLevels} / ${props.totalLevels} done`
})
</script>

<template>
  <button
    class="flex flex-col items-center justify-center gap-3 rounded-2xl border-2 p-5 text-center transition-transform active:scale-95 cursor-pointer"
    :class="
      totalLevels === 0
        ? 'border-[var(--color-border)] bg-[var(--color-surface-alt)]'
        : 'border-[var(--color-primary)] bg-white'
    "
    @click="emit('select', mode)"
  >
    <!-- Flags -->
    <div class="flex items-center gap-2 text-2xl leading-none">
      <span>{{ config.sourceFlag }}</span>
      <span class="text-sm text-[var(--color-text-muted)]">→</span>
      <span>{{ config.targetFlag }}</span>
    </div>

    <!-- Label -->
    <p
      class="text-sm font-semibold leading-snug"
      :class="totalLevels === 0 ? 'text-gray-400' : 'text-[var(--color-text)]'"
    >
      {{ config.label }}
    </p>

    <!-- Status -->
    <p
      class="text-xs"
      :class="
        completedLevels === totalLevels && totalLevels > 0
          ? 'text-emerald-600 font-semibold'
          : 'text-[var(--color-text-muted)]'
      "
    >
      {{ statusText }}
    </p>
  </button>
</template>
