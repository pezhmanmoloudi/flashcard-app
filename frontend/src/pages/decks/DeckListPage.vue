<script setup lang="ts">
import { useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'

const router = useRouter()
</script>

<template>
  <div>
    <div class="flex items-center justify-between mb-6">
      <h2 class="text-xl font-semibold text-gray-900">
        My Decks
      </h2>
      <button
        class="px-4 py-2 bg-gray-900 text-white text-sm rounded-lg hover:bg-gray-700 transition-colors"
        @click="router.push({ name: ROUTE_NAMES.DECK_NEW })"
      >
        New Deck
      </button>
    </div>

    <p class="text-gray-400 text-sm">
      No decks yet. Create one to get started.
    </p>
  </div>
</template>
