<script setup lang="ts">
import { ROUTE_NAMES } from '@/core/router/route-names'
</script>

<template>
  <div>
    <h2 class="text-lg font-semibold text-gray-900 mb-6">
      Create account
    </h2>

    <p class="text-gray-400 text-sm mb-4">
      Registration form coming in Part 3.3.
    </p>

    <p class="text-center text-sm text-gray-500">
      Already have an account?
      <RouterLink
        :to="{ name: ROUTE_NAMES.AUTH_LOGIN }"
        class="text-gray-900 font-medium hover:underline"
      >
        Sign in
      </RouterLink>
    </p>
  </div>
</template>
