<script setup lang="ts">
import { BaseCard } from '@/shared/components/ui'
import type { AuthUser } from '@/features/auth/types'

defineProps<{ user: AuthUser }>()
</script>

<template>
  <BaseCard>
    <h2 class="text-sm font-semibold text-gray-900 mb-4">
      Profile
    </h2>

    <dl class="space-y-3">
      <div class="flex justify-between text-sm">
        <dt class="text-gray-500">
          Email
        </dt>
        <dd class="text-gray-900 font-medium">
          {{ user.email }}
        </dd>
      </div>
      <div class="flex justify-between text-sm">
        <dt class="text-gray-500">
          Account ID
        </dt>
        <dd class="text-gray-400 font-mono text-xs">
          #{{ user.id }}
        </dd>
      </div>
    </dl>
  </BaseCard>
</template>
