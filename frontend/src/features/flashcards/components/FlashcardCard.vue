<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { ROUTE_NAMES } from '@/core/router/route-names'
import { BaseCard, BaseButton, BaseBadge } from '@/shared/components/ui'
import type { Flashcard } from '../types'

interface Props {
  flashcard: Flashcard
}

const props = defineProps<Props>()

const emit = defineEmits<{
  delete: [flashcard: Flashcard]
}>()

const router = useRouter()
const confirmingDelete = ref(false)

function formatLanguage(lang: string): string {
  return lang.charAt(0).toUpperCase() + lang.slice(1)
}
</script>

<template>
  <BaseCard padding="md">
    <div class="flex items-start justify-between gap-3">
      <div class="flex-1 min-w-0">
        <div
          v-if="flashcard.image_url"
          class="mb-2 rounded-lg overflow-hidden border border-[var(--color-border)] max-h-28"
        >
          <img
            :src="flashcard.image_url"
            :alt="`Image for ${flashcard.front_text}`"
            class="w-full h-full object-cover"
          >
        </div>

        <p class="text-sm font-semibold text-gray-900">
          {{ flashcard.front_text }}
        </p>
        <p class="mt-1 text-sm text-gray-500">
          {{ flashcard.back_text }}
        </p>
        <p
          v-if="flashcard.example_sentence"
          class="mt-1.5 text-xs text-gray-400 italic line-clamp-1"
        >
          {{ flashcard.example_sentence }}
        </p>

        <div class="mt-2 flex items-center gap-2 flex-wrap">
          <BaseBadge>
            {{ formatLanguage(flashcard.source_language) }} → {{ formatLanguage(flashcard.target_language) }}
          </BaseBadge>
          <BaseBadge
            v-if="flashcard.audio_url"
            variant="primary"
          >
            ♪ Audio
          </BaseBadge>
        </div>
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
            @click="emit('delete', flashcard)"
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
            @click="router.push({ name: ROUTE_NAMES.FLASHCARD_EDIT, params: { id: flashcard.id } })"
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
