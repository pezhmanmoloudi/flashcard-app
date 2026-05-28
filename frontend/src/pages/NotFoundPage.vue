<script setup lang="ts">
import { useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BaseButton } from '@/shared/components/ui'

const router = useRouter()
</script>

<template>
  <div class="min-h-screen flex flex-col items-center justify-center gap-4 px-4">
    <p class="text-5xl font-bold text-gray-200">
      404
    </p>
    <h1 class="text-lg font-semibold text-gray-900">
      Page not found
    </h1>
    <p class="text-sm text-gray-400">
      The page you're looking for doesn't exist.
    </p>
    <BaseButton
      variant="secondary"
      @click="router.push({ name: ROUTE_NAMES.DECKS })"
    >
      Go to Decks
    </BaseButton>
  </div>
</template>
