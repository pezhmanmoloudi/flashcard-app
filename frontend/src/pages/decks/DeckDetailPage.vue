<script setup lang="ts">
import { useRoute, useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'

const route = useRoute()
const router = useRouter()
const deckId = route.params.id as string
</script>

<template>
  <div>
    <div class="flex items-center justify-between mb-6">
      <div>
        <button
          class="text-sm text-gray-400 hover:text-gray-600 mb-1"
          @click="router.push({ name: ROUTE_NAMES.DECKS })"
        >
          ← Back to Decks
        </button>
        <h2 class="text-xl font-semibold text-gray-900">
          Deck #{{ deckId }}
        </h2>
      </div>

      <button
        class="px-4 py-2 border border-gray-200 text-sm rounded-lg hover:bg-gray-50 transition-colors"
        @click="router.push({ name: ROUTE_NAMES.DECK_EDIT, params: { id: deckId } })"
      >
        Edit
      </button>
    </div>

    <p class="text-gray-400 text-sm">
      No flashcards yet.
    </p>
  </div>
</template>
