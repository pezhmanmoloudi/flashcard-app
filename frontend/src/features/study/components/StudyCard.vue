<script setup lang="ts">
import { ref, computed, watch } from 'vue'
import type { Flashcard } from '@/features/flashcards/types'
import { useCardSwipe } from '../composables/useCardSwipe'
import { getPlaceholderColor } from '../utils/placeholder'
import AudioButton from './AudioButton.vue'

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

const audioBtn = ref<InstanceType<typeof AudioButton> | null>(null)

const { cardStyle, rightOpacity, leftOpacity, handlers } = useCardSwipe({
  onTap: () => emit('flip'),
  onSwipeRight: () => emit('swipeRight'),
  onSwipeLeft: () => emit('swipeLeft'),
})

// Auto-play pronunciation when card is revealed
watch(
  () => props.isFlipped,
  (flipped) => {
    if (flipped && props.flashcard.audio_url) {
      audioBtn.value?.play()
    }
  },
)

const placeholder = computed(() => getPlaceholderColor(props.flashcard.id))

const flipStyle = computed(() => ({
  transform: props.isFlipped ? 'rotateY(180deg)' : 'rotateY(0deg)',
  transition: 'transform 0.5s cubic-bezier(0.4, 0, 0.2, 1)',
}))
</script>

<template>
  <!--
    Outer div: drag physics (translate + tilt via cardStyle).
    Inner flip container: rotateY for 3D flip.
    Keeping these on separate elements prevents the two transforms from conflicting.
  -->
  <div
    class="relative w-full select-none"
    :style="cardStyle"
    v-bind="handlers"
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
      <div
        class="relative w-full rounded-2xl shadow-md overflow-hidden [transform-style:preserve-3d]"
        :style="[flipStyle, { minHeight: '440px' }]"
      >
        <!-- ── Front face ── -->
        <div class="absolute inset-0 [backface-visibility:hidden] flex flex-col overflow-hidden rounded-2xl bg-white">
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

            <div
              v-if="flashcard.audio_url"
              class="absolute bottom-3 right-3"
            >
              <AudioButton :src="flashcard.audio_url" />
            </div>
          </div>

          <!-- Word strip -->
          <div class="bg-white px-5 py-4 border-t border-gray-100/80">
            <p class="text-2xl font-bold text-gray-900 leading-tight">
              {{ flashcard.front_text }}
            </p>
            <p class="mt-0.5 text-[11px] text-gray-400 uppercase tracking-widest">
              {{ flashcard.source_language }}
            </p>
          </div>
        </div>

        <!-- ── Back face ── -->
        <div class="absolute inset-0 [backface-visibility:hidden] [transform:rotateY(180deg)] flex flex-col overflow-hidden rounded-2xl bg-white">
          <div class="flex-1 flex flex-col items-center justify-center gap-4 px-6 py-8">
            <p class="text-3xl font-bold text-[var(--color-primary)] text-center leading-tight">
              {{ flashcard.back_text }}
            </p>
            <p class="text-[11px] text-gray-400 uppercase tracking-widest">
              {{ flashcard.target_language }}
            </p>

            <div
              v-if="flashcard.example_sentence"
              class="mt-2 w-full px-4 py-3 bg-gray-50 rounded-xl"
            >
              <p class="text-sm text-gray-500 italic text-center leading-relaxed">
                "{{ flashcard.example_sentence }}"
              </p>
            </div>
          </div>

          <div
            v-if="flashcard.audio_url"
            class="pb-5 flex justify-center"
          >
            <AudioButton
              ref="audioBtn"
              :src="flashcard.audio_url"
            />
          </div>
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
        tap to reveal · swipe to answer
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
