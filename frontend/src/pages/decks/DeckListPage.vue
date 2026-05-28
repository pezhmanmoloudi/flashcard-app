<script setup lang="ts">
import { onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BasePageHeader, BaseButton, BaseEmptyState } from '@/shared/components/ui'
import { useDecks } from '@/features/flashcards/composables/useDecks'

const router = useRouter()
const { decks, fetchDecks } = useDecks()

onMounted(() => fetchDecks())
</script>

<template>
  <div>
    <BasePageHeader title="My Decks">
      <template
        v-if="decks.length > 0"
        #actions
      >
        <BaseButton @click="router.push({ name: ROUTE_NAMES.DECK_NEW })">
          New Deck
        </BaseButton>
      </template>
    </BasePageHeader>

    <BaseEmptyState
      v-if="decks.length === 0"
      title="No decks yet"
      description="Create your first deck to start learning."
    >
      <template #action>
        <BaseButton @click="router.push({ name: ROUTE_NAMES.DECK_NEW })">
          Create a deck
        </BaseButton>
      </template>
    </BaseEmptyState>
  </div>
</template>
