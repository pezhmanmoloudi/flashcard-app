<script setup lang="ts">
import { ROUTE_NAMES } from '@/core/router/route-names'
</script>

<template>
  <div>
    <h2 class="text-lg font-semibold text-gray-900 mb-6">
      Sign in
    </h2>

    <p class="text-gray-400 text-sm mb-4">
      Auth form coming in Part 3.3.
    </p>

    <p class="text-center text-sm text-gray-500">
      No account?
      <RouterLink
        :to="{ name: ROUTE_NAMES.AUTH_REGISTER }"
        class="text-gray-900 font-medium hover:underline"
      >
        Create one
      </RouterLink>
    </p>
  </div>
</template>
