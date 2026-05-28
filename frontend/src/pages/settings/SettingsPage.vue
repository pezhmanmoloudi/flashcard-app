<script setup lang="ts">
import { BasePageHeader, BaseCard } from '@/shared/components/ui'
import { useAuthStore } from '@/core/stores/auth.store'

const authStore = useAuthStore()
</script>

<template>
  <div>
    <BasePageHeader title="Settings" />

    <BaseCard>
      <div class="space-y-1">
        <p class="text-sm font-medium text-gray-700">
          Account
        </p>
        <p class="text-sm text-gray-500">
          {{ authStore.user?.email ?? '—' }}
        </p>
      </div>
    </BaseCard>
  </div>
</template>
