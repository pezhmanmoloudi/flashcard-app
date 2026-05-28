<script setup lang="ts">
interface Props {
  title: string
  description?: string
}

defineProps<Props>()
</script>

<template>
  <div class="flex flex-col items-center justify-center py-16 px-4 text-center">
    <div class="w-12 h-12 rounded-full bg-[var(--color-surface-alt)] flex items-center justify-center mb-4">
      <slot name="icon">
        <svg
          class="w-6 h-6 text-gray-400"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
          stroke-width="1.5"
          aria-hidden="true"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4"
          />
        </svg>
      </slot>
    </div>

    <h3 class="text-sm font-semibold text-gray-900 mb-1">
      {{ title }}
    </h3>
    <p
      v-if="description"
      class="text-sm text-gray-400 mb-5 max-w-xs"
    >
      {{ description }}
    </p>

    <slot name="action" />
  </div>
</template>
