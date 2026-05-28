<script setup lang="ts">
import { useRoute, useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BasePageHeader, BaseButton } from '@/shared/components/ui'

const route = useRoute()
const router = useRouter()
const deckId = route.params.id as string
</script>

<template>
  <div>
    <BasePageHeader title="Edit Deck">
      <template #actions>
        <BaseButton
          variant="ghost"
          @click="router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: deckId } })"
        >
          Cancel
        </BaseButton>
      </template>
    </BasePageHeader>

    <p class="text-sm text-gray-400">
      Deck edit form coming in Part 4.1.
    </p>
  </div>
</template>
