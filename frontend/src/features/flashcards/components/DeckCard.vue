<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BaseCard, BaseButton } from '@/shared/components/ui'
import { formatRelativeDate } from '@/shared/utils'
import type { Deck } from '../types'

interface Props {
  deck: Deck
}

const props = defineProps<Props>()

const emit = defineEmits<{
  edit: [deck: Deck]
  delete: [deck: Deck]
}>()

const router = useRouter()
const confirmingDelete = ref(false)

function navigate() {
  if (!confirmingDelete.value) {
    router.push({ name: ROUTE_NAMES.DECK_SHOW, params: { id: props.deck.id } })
  }
}
</script>

<template>
  <BaseCard
    hoverable
    padding="md"
    @click="navigate"
  >
    <div class="flex items-start justify-between gap-3">
      <div class="flex-1 min-w-0">
        <h3 class="text-sm font-semibold text-gray-900 truncate">
          {{ deck.name }}
        </h3>
        <p
          v-if="deck.description"
          class="mt-1 text-xs text-gray-500 line-clamp-2"
        >
          {{ deck.description }}
        </p>
        <p class="mt-2 text-xs text-gray-400">
          {{ formatRelativeDate(deck.created_at) }}
        </p>
      </div>

      <div
        class="flex items-center gap-1 shrink-0"
        @click.stop
      >
        <template v-if="confirmingDelete">
          <span class="text-xs text-red-600 mr-1">Delete?</span>
          <BaseButton
            size="sm"
            variant="danger"
            @click="emit('delete', deck)"
          >
            Yes
          </BaseButton>
          <BaseButton
            size="sm"
            variant="ghost"
            @click="confirmingDelete = false"
          >
            No
          </BaseButton>
        </template>
        <template v-else>
          <BaseButton
            size="sm"
            variant="ghost"
            @click="emit('edit', deck)"
          >
            Edit
          </BaseButton>
          <BaseButton
            size="sm"
            variant="ghost"
            @click="confirmingDelete = true"
          >
            Delete
          </BaseButton>
        </template>
      </div>
    </div>
  </BaseCard>
</template>
