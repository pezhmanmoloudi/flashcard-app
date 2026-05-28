<script setup lang="ts">
import { useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BasePageHeader, BaseButton } from '@/shared/components/ui'

const router = useRouter()
</script>

<template>
  <div>
    <BasePageHeader title="New Deck">
      <template #actions>
        <BaseButton
          variant="ghost"
          @click="router.push({ name: ROUTE_NAMES.DECKS })"
        >
          Cancel
        </BaseButton>
      </template>
    </BasePageHeader>

    <p class="text-sm text-gray-400">
      Deck creation form coming in Part 4.1.
    </p>
  </div>
</template>
