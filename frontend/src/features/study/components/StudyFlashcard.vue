<script setup lang="ts">
import type { Flashcard } from '@/features/flashcards/types'

interface Props {
  flashcard: Flashcard
  flipped: boolean
}

defineProps<Props>()

const emit = defineEmits<{ flip: [] }>()

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
        class="absolute inset-0 flex flex-col items-center justify-center gap-3 p-8 bg-white border border-[var(--color-border)] rounded-[var(--radius-card)] shadow-sm [backface-visibility:hidden]"
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
        class="absolute inset-0 flex flex-col items-center justify-center gap-3 p-8 bg-[var(--color-surface-alt)] border border-[var(--color-border)] rounded-[var(--radius-card)] shadow-sm [backface-visibility:hidden] [transform:rotateY(180deg)]"
      >
        <p class="text-2xl sm:text-3xl font-bold text-[var(--color-primary)] text-center leading-snug">
          {{ flashcard.back_text }}
        </p>
        <span class="text-xs text-gray-400 uppercase tracking-widest">
          {{ formatLanguage(flashcard.target_language) }}
        </span>
        <p
          v-if="flashcard.example_sentence"
          class="mt-3 text-sm text-gray-500 italic text-center max-w-xs leading-relaxed"
        >
          "{{ flashcard.example_sentence }}"
        </p>
      </div>
    </div>
  </div>
</template>
