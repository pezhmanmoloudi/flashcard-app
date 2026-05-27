<script setup lang="ts">
import { useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'

const router = useRouter()
</script>

<template>
  <div>
    <div class="mb-6">
      <button
        class="text-sm text-gray-400 hover:text-gray-600 mb-1"
        @click="router.push({ name: ROUTE_NAMES.DECKS })"
      >
        ← Back to Decks
      </button>
      <h2 class="text-xl font-semibold text-gray-900">
        New Deck
      </h2>
    </div>

    <p class="text-gray-400 text-sm">
      Deck creation form coming in Part 4.1.
    </p>
  </div>
</template>
