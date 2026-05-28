<script setup lang="ts">
import { BasePageHeader, BaseEmptyState } from '@/shared/components/ui'
</script>

<template>
  <div>
    <BasePageHeader
      title="Study"
      description="Review your due flashcards."
    />

    <BaseEmptyState
      title="No cards due"
      description="You're all caught up! Come back later to review more cards."
    >
      <template #icon>
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
            d="M4.5 12.75l6 6 9-13.5"
          />
        </svg>
      </template>
    </BaseEmptyState>
  </div>
</template>
