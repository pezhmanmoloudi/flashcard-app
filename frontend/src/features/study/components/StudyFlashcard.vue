<script setup lang="ts">
import { ref, watch } from 'vue'
import type { Flashcard } from '@/features/flashcards/types'

interface Props {
  flashcard: Flashcard
  flipped: boolean
}

const props = defineProps<Props>()

const emit = defineEmits<{ flip: [] }>()

const audioEl = ref<HTMLAudioElement | null>(null)

watch(
  () => props.flipped,
  (flipped) => {
    if (flipped && props.flashcard.audio_url && audioEl.value) {
      audioEl.value.play().catch(() => {})
    }
  },
)

function formatLanguage(lang: string): string {
  return lang.charAt(0).toUpperCase() + lang.slice(1)
}
</script>

<template>
  <div
    class="w-full max-w-lg mx-auto cursor-pointer select-none"
    style="perspective: 1200px;"
    role="button"
    :tabindex="flipped ? -1 : 0"
    :aria-label="flipped ? 'Card answer revealed' : 'Tap to reveal answer'"
    @click="!flipped && emit('flip')"
    @keydown.space.prevent="!flipped && emit('flip')"
    @keydown.enter.prevent="!flipped && emit('flip')"
  >
    <div
      class="relative w-full min-h-[260px] sm:min-h-[300px] transition-transform duration-500 [transform-style:preserve-3d]"
      :style="{ transform: flipped ? 'rotateY(180deg)' : 'rotateY(0deg)' }"
    >
      <!-- Front -->
      <div
        class="absolute inset-0 flex flex-col items-center justify-center gap-3 p-8 bg-white border border-[var(--color-border)] rounded-[var(--radius-card)] shadow-sm [backface-visibility:hidden] overflow-hidden"
      >
        <img
          v-if="flashcard.image_url"
          :src="flashcard.image_url"
          :alt="`Image for ${flashcard.front_text}`"
          class="max-h-24 rounded-lg object-contain mb-1"
        >
        <p class="text-2xl sm:text-3xl font-bold text-gray-900 text-center leading-snug">
          {{ flashcard.front_text }}
        </p>
        <span class="text-xs text-gray-400 uppercase tracking-widest">
          {{ formatLanguage(flashcard.source_language) }}
        </span>
        <span class="mt-4 text-xs text-[var(--color-primary)] opacity-50">
          tap to reveal
        </span>
      </div>

      <!-- Back -->
      <div
        class="absolute inset-0 flex flex-col items-center justify-center gap-3 p-8 bg-[var(--color-surface-alt)] border border-[var(--color-border)] rounded-[var(--radius-card)] shadow-sm [backface-visibility:hidden] [transform:rotateY(180deg)] overflow-hidden"
      >
        <p class="text-2xl sm:text-3xl font-bold text-[var(--color-primary)] text-center leading-snug">
          {{ flashcard.back_text }}
        </p>
        <span class="text-xs text-gray-400 uppercase tracking-widest">
          {{ formatLanguage(flashcard.target_language) }}
        </span>
        <p
          v-if="flashcard.example_sentence"
          class="mt-2 text-sm text-gray-500 italic text-center max-w-xs leading-relaxed"
        >
          "{{ flashcard.example_sentence }}"
        </p>

        <button
          v-if="flashcard.audio_url"
          type="button"
          class="mt-2 flex items-center gap-1.5 px-3 py-1.5 rounded-full bg-[var(--color-primary-light)] text-[var(--color-primary)] text-xs font-medium hover:opacity-80 transition-opacity"
          aria-label="Play pronunciation"
          @click.stop="audioEl?.play()"
        >
          <svg
            class="w-3.5 h-3.5"
            fill="currentColor"
            viewBox="0 0 24 24"
            aria-hidden="true"
          >
            <path d="M8 5v14l11-7z" />
          </svg>
          Play
        </button>

        <audio
          v-if="flashcard.audio_url"
          ref="audioEl"
          :src="flashcard.audio_url"
          preload="none"
        />
      </div>
    </div>
  </div>
</template>
