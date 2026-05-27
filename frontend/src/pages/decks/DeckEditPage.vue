<script setup lang="ts">
import { useRoute, useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'

const route = useRoute()
const router = useRouter()
const deckId = route.params.id as string
</script>

<template>
  <div>
    <div class="mb-6">
      <button
        class="text-sm text-gray-400 hover:text-gray-600 mb-1"
        @click="router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: deckId } })"
      >
        ← Back to Deck
      </button>
      <h2 class="text-xl font-semibold text-gray-900">
        Edit Deck
      </h2>
    </div>

    <p class="text-gray-400 text-sm">
      Deck edit form coming in Part 4.1.
    </p>
  </div>
</template>
