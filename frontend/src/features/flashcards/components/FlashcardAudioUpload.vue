<script setup lang="ts">
import { ref } from 'vue'
import { BaseButton, BaseSpinner } from '@/shared/components/ui'
import { flashcardService } from '../services/flashcard.service'
import { extractError } from '@/shared/utils'
import type { Flashcard } from '../types'

interface Props {
  flashcardId: number
  audioUrl?: string
}

const props = defineProps<Props>()
const emit = defineEmits<{ updated: [flashcard: Flashcard] }>()

const ALLOWED_TYPES = ['audio/mpeg', 'audio/wav', 'audio/ogg', 'audio/mp4']
const MAX_SIZE_MB = 10

const loading = ref(false)
const error = ref<string | null>(null)
const fileInput = ref<HTMLInputElement | null>(null)

async function handleFileSelect(e: Event) {
  const file = (e.target as HTMLInputElement).files?.[0]
  if (!file) return

  if (!ALLOWED_TYPES.includes(file.type)) {
    error.value = 'Only MP3, WAV, OGG, and M4A audio files are allowed.'
    return
  }
  if (file.size > MAX_SIZE_MB * 1024 * 1024) {
    error.value = `Audio must be under ${MAX_SIZE_MB}MB.`
    return
  }

  loading.value = true
  error.value = null
  try {
    const updated = await flashcardService.uploadAudio(props.flashcardId, file)
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
    const updated = await flashcardService.removeAudio(props.flashcardId)
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
      Audio
    </p>

    <div
      v-if="audioUrl"
      class="flex items-center gap-3 p-3 border border-[var(--color-border)] rounded-lg"
    >
      <audio
        :src="audioUrl"
        controls
        class="flex-1 h-8 min-w-0"
      />
      <button
        type="button"
        class="text-xs text-gray-400 hover:text-red-500 transition-colors shrink-0 disabled:opacity-50"
        :disabled="loading"
        @click="handleRemove"
      >
        Remove
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
        <p class="text-xs text-gray-500">Click to upload audio</p>
        <p class="mt-0.5 text-[10px] text-gray-400">
          MP3, WAV, OGG, M4A · max 10MB
        </p>
      </template>
    </button>

    <div
      v-if="audioUrl"
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
      accept="audio/mpeg,audio/wav,audio/ogg,audio/mp4"
      class="sr-only"
      @change="handleFileSelect"
    >
  </div>
</template>
