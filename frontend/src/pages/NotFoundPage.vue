<script setup lang="ts">
import { useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'

const router = useRouter()
</script>

<template>
  <div class="min-h-screen flex flex-col items-center justify-center gap-4">
    <h1 class="text-4xl font-bold text-gray-900">
      404
    </h1>
    <p class="text-gray-500">
      Page not found
    </p>
    <button
      class="text-sm text-gray-900 hover:underline"
      @click="router.push({ name: ROUTE_NAMES.DECKS })"
    >
      Go to Decks
    </button>
  </div>
</template>
