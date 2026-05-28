<script setup lang="ts">
import { useRoute, useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BasePageHeader, BaseButton, BaseEmptyState } from '@/shared/components/ui'

const route = useRoute()
const router = useRouter()
const deckId = route.params.id as string
</script>

<template>
  <div>
    <BasePageHeader :title="`Deck #${deckId}`">
      <template #actions>
        <BaseButton
          variant="secondary"
          @click="router.push({ name: ROUTE_NAMES.DECK_EDIT, params: { id: deckId } })"
        >
          Edit
        </BaseButton>
      </template>
    </BasePageHeader>

    <BaseEmptyState
      title="No flashcards yet"
      description="Add flashcards to this deck to start studying."
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
            d="M12 4v16m8-8H4"
          />
        </svg>
      </template>
    </BaseEmptyState>
  </div>
</template>
