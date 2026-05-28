<script setup lang="ts">
import { computed } from 'vue'
import type { Flashcard } from '@/features/flashcards/types'
import { useCardSwipe } from '../composables/useCardSwipe'
import { getPlaceholderColor } from '../utils/placeholder'
import WordAudio from './WordAudio.vue'

interface Props {
  flashcard: Flashcard
  isFlipped: boolean
}

const props = defineProps<Props>()
const emit = defineEmits<{
  flip: []
  swipeRight: []
  swipeLeft: []
}>()

const { cardStyle, wasDragged, rightOpacity, leftOpacity, handlers } = useCardSwipe({
  onSwipeRight: () => emit('swipeRight'),
  onSwipeLeft: () => emit('swipeLeft'),
})

/*
 * Primary guard:  WordAudio uses @click.stop, which now works correctly
 *                 because useCardSwipe no longer calls setPointerCapture.
 *
 * Secondary guard: even if the click reaches here, skip flip when it
 *                 originated inside [data-audio-zone]. This also enforces
 *                 "do nothing when no audio" — the attribute is always
 *                 present on the word span regardless of audioSrc.
 *
 * wasDragged:     blocks any synthetic click browsers fire after a
 *                 spring-back gesture (drag below threshold → release).
 */
function handleCardClick(e: MouseEvent) {
  if (wasDragged.value) return
  if ((e.target as HTMLElement).closest('[data-audio-zone]')) return
  emit('flip')
}

const placeholder = computed(() => getPlaceholderColor(props.flashcard.id))

const flipStyle = computed(() => ({
  transform: props.isFlipped ? 'rotateY(180deg)' : 'rotateY(0deg)',
  transition: 'transform 0.5s cubic-bezier(0.4, 0, 0.2, 1)',
}))
</script>

<template>
  <!--
    Two-element transform split:
      Outer div  → translate + rotateZ (drag physics via cardStyle)
      Inner div  → rotateY             (3D flip)
    Keeping them on separate elements prevents the transforms from fighting.

    Flip is on @click here; WordAudio uses @click.stop, so tapping
    the word plays audio without triggering this handler.
  -->
  <div
    class="relative w-full select-none"
    :style="cardStyle"
    v-bind="handlers"
    @click="handleCardClick($event)"
  >
    <!-- Swipe feedback labels -->
    <div
      class="absolute top-5 left-5 z-20 px-3 py-1.5 rounded-lg border-2 border-emerald-400 text-emerald-500 font-bold text-sm tracking-wider uppercase pointer-events-none rotate-[-12deg]"
      :style="{ opacity: rightOpacity }"
      aria-hidden="true"
    >
      Know it
    </div>
    <div
      class="absolute top-5 right-5 z-20 px-3 py-1.5 rounded-lg border-2 border-rose-400 text-rose-500 font-bold text-sm tracking-wider uppercase pointer-events-none rotate-[12deg]"
      :style="{ opacity: leftOpacity }"
      aria-hidden="true"
    >
      Again
    </div>

    <!-- 3D perspective wrapper -->
    <div style="perspective: 1400px">
      <!--
        overflow-hidden must NOT be on the preserve-3d element.
        Per the CSS spec it is a "grouping property" that flattens the 3D
        rendering context: children get composited into a flat 2D surface
        first, so the back face's rotateY(180deg) bakes in as scaleX(-1)
        (a 2D mirror) before the parent flip applies — producing reversed text.
        shadow-md and overflow-hidden belong on each face individually.
      -->
      <div
        class="relative w-full [transform-style:preserve-3d]"
        :style="[flipStyle, { minHeight: '440px' }]"
      >
        <!-- ── Front face ── -->
        <div class="absolute inset-0 [backface-visibility:hidden] flex flex-col overflow-hidden rounded-2xl bg-white shadow-md">
          <!-- Image / placeholder -->
          <div
            class="flex-1 relative flex items-center justify-center overflow-hidden"
            :style="{ background: placeholder.bg }"
          >
            <img
              v-if="flashcard.image_url"
              :src="flashcard.image_url"
              :alt="flashcard.front_text"
              class="w-full h-full object-cover"
              draggable="false"
            />
            <span
              v-else
              class="text-[9rem] font-black leading-none pointer-events-none"
              :style="{ color: placeholder.text, opacity: 0.15 }"
              aria-hidden="true"
            >
              {{ flashcard.front_text.charAt(0).toUpperCase() }}
            </span>
          </div>

          <!-- Word strip — tap the word to hear pronunciation -->
          <div class="bg-white px-5 py-4 border-t border-gray-100/80">
            <WordAudio
              :text="flashcard.front_text"
              :audio-src="flashcard.audio_url"
              class="text-2xl font-bold text-gray-900 leading-tight"
            />
            <p class="mt-0.5 text-[11px] text-gray-400 uppercase tracking-widest">
              {{ flashcard.source_language }}
            </p>
          </div>
        </div>

        <!-- ── Back face ── -->
        <div class="absolute inset-0 [backface-visibility:hidden] [transform:rotateY(180deg)] flex flex-col overflow-hidden rounded-2xl bg-white shadow-md">

          <!-- TOP: translation — most prominent element -->
          <div class="flex flex-col items-center justify-center text-center px-6 pt-8 pb-6">
            <WordAudio
              :text="flashcard.back_text"
              :audio-src="flashcard.audio_url"
              class="text-3xl font-bold text-[var(--color-primary)] leading-tight"
            />
            <p class="mt-1.5 text-[11px] text-gray-400 uppercase tracking-widest">
              {{ flashcard.target_language }}
            </p>
          </div>

          <!-- BOTTOM: learning context — translated sentence, grammar -->
          <div
            v-if="flashcard.translated_sentence || flashcard.grammar_notes"
            class="flex-1 px-5 pb-5 pt-2 space-y-2 overflow-y-auto"
          >
            <div
              v-if="flashcard.translated_sentence"
              class="rounded-xl bg-gray-50 px-4 py-3"
            >
              <p class="text-sm text-gray-700 leading-relaxed">
                {{ flashcard.translated_sentence }}
              </p>
            </div>

            <div
              v-if="flashcard.grammar_notes"
              class="rounded-xl bg-indigo-50 px-4 py-3"
            >
              <p class="text-[10px] font-semibold text-indigo-400 uppercase tracking-wider mb-1">
                Grammar
              </p>
              <p class="text-sm text-indigo-700 leading-relaxed">
                {{ flashcard.grammar_notes }}
              </p>
            </div>
          </div>

          <!-- Spacer when there is no contextual content -->
          <div
            v-else
            class="flex-1"
          />
        </div>
      </div>
    </div>

    <!-- Contextual hint -->
    <Transition
      name="hint"
      mode="out-in"
    >
      <p
        v-if="!isFlipped"
        key="front-hint"
        class="mt-3 text-center text-xs text-gray-400"
      >
        tap word to hear · swipe to answer
      </p>
      <p
        v-else
        key="back-hint"
        class="mt-3 text-center text-xs text-gray-400"
      >
        swipe right to know it · swipe left to retry
      </p>
    </Transition>
  </div>
</template>

<style scoped>
.hint-enter-active,
.hint-leave-active {
  transition: opacity 0.18s ease;
}
.hint-enter-from,
.hint-leave-to {
  opacity: 0;
}
</style>
