<script setup lang="ts">
import { ref } from 'vue'
import { BaseButton, BaseSpinner } from '@/shared/components/ui'
import { flashcardService } from '../services/flashcard.service'
import { extractError } from '@/shared/utils'
import type { Flashcard } from '../types'

interface Props {
  flashcardId: number
  imageUrl?: string
}

const props = defineProps<Props>()
const emit = defineEmits<{ updated: [flashcard: Flashcard] }>()

const ALLOWED_TYPES = ['image/jpeg', 'image/png', 'image/gif', 'image/webp']
const MAX_SIZE_MB = 5

const loading = ref(false)
const error = ref<string | null>(null)
const fileInput = ref<HTMLInputElement | null>(null)

async function handleFileSelect(e: Event) {
  const file = (e.target as HTMLInputElement).files?.[0]
  if (!file) return

  if (!ALLOWED_TYPES.includes(file.type)) {
    error.value = 'Only JPG, PNG, GIF, and WebP are allowed.'
    return
  }
  if (file.size > MAX_SIZE_MB * 1024 * 1024) {
    error.value = `Image must be under ${MAX_SIZE_MB}MB.`
    return
  }

  loading.value = true
  error.value = null
  try {
    const updated = await flashcardService.uploadImage(props.flashcardId, file)
    emit('updated', updated)
  } catch (e) {
    error.value = extractError(e)
  } finally {
    loading.value = false
    if (fileInput.value) fileInput.value.value = ''
  }
}

async function handleRemove() {
  loading.value = true
  error.value = null
  try {
    const updated = await flashcardService.removeImage(props.flashcardId)
    emit('updated', updated)
  } catch (e) {
    error.value = extractError(e)
  } finally {
    loading.value = false
  }
}
</script>

<template>
  <div class="space-y-2">
    <p class="text-sm font-medium text-gray-700">
      Image
    </p>

    <div
      v-if="imageUrl"
      class="relative rounded-lg overflow-hidden border border-[var(--color-border)]"
    >
      <img
        :src="imageUrl"
        alt="Flashcard image"
        class="w-full max-h-48 object-cover"
      >
      <button
        class="absolute top-2 right-2 w-6 h-6 rounded-full bg-black/50 text-white text-sm flex items-center justify-center hover:bg-black/70 transition-colors disabled:opacity-50"
        :disabled="loading"
        aria-label="Remove image"
        @click="handleRemove"
      >
        ×
      </button>
    </div>

    <button
      v-else
      type="button"
      class="w-full border-2 border-dashed border-[var(--color-border)] rounded-lg p-6 text-center hover:border-[var(--color-primary)] transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
      :disabled="loading"
      @click="fileInput?.click()"
    >
      <div
        v-if="loading"
        class="flex justify-center"
      >
        <BaseSpinner />
      </div>
      <template v-else>
        <p class="text-xs text-gray-500">Click to upload image</p>
        <p class="mt-0.5 text-[10px] text-gray-400">
          JPG, PNG, GIF, WebP · max 5MB
        </p>
      </template>
    </button>

    <div
      v-if="imageUrl"
      class="flex gap-2"
    >
      <BaseButton
        size="sm"
        variant="secondary"
        :loading="loading"
        :disabled="loading"
        type="button"
        @click="fileInput?.click()"
      >
        Replace
      </BaseButton>
    </div>

    <p
      v-if="error"
      role="alert"
      class="text-xs text-red-600"
    >
      {{ error }}
    </p>

    <input
      ref="fileInput"
      type="file"
      accept="image/jpeg,image/png,image/gif,image/webp"
      class="sr-only"
      @change="handleFileSelect"
    >
  </div>
</template>
