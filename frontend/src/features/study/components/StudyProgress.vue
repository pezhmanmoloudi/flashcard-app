<script setup lang="ts">
import { computed } from 'vue'

interface Props {
  current: number
  total: number
}

const props = defineProps<Props>()

const percentage = computed(() =>
  props.total > 0 ? Math.round((props.current / props.total) * 100) : 0,
)
</script>

<template>
  <div class="w-full">
    <div class="flex items-center justify-between mb-1.5">
      <span class="text-xs text-gray-400">{{ current + 1 }} of {{ total }}</span>
      <span class="text-xs text-gray-400">{{ percentage }}%</span>
    </div>
    <div class="w-full h-1.5 bg-gray-100 rounded-full overflow-hidden">
      <div
        class="h-full bg-[var(--color-primary)] rounded-full transition-all duration-500"
        :style="{ width: `${percentage}%` }"
        role="progressbar"
        :aria-valuenow="percentage"
        aria-valuemin="0"
        aria-valuemax="100"
      />
    </div>
  </div>
</template>
