<script setup lang="ts">
import { toRef, computed } from 'vue'
import { useAudio } from '../composables/useAudio'

interface Props {
  text: string
  audioSrc?: string | null
}

const props = defineProps<Props>()

const { isPlaying, play } = useAudio(toRef(props, 'audioSrc'))
const hasAudio = computed(() => !!props.audioSrc)

function handleInteract() {
  play()
}
</script>

<!--
  Root is a single <span> so this component composes into any text context.
  Class/style attrs from the parent fall through automatically.

  Two-layer interaction guard so tapping the word NEVER flips the card:

  Primary:   @click.stop — stops the click from bubbling to the card's
             flip handler. Works correctly now that useCardSwipe uses
             document-level listeners instead of setPointerCapture
             (pointer capture used to re-route click synthesis to the
             capturing element, bypassing this stop entirely).

  Secondary: data-audio-zone attribute — StudyCard's handleCardClick
             checks target.closest('[data-audio-zone]') as a fallback,
             so flip is blocked even in edge cases where stopPropagation
             does not help. Also enforces "no flip when no audio" because
             the attribute is always present regardless of audioSrc.
-->
<template>
  <span
    data-audio-zone
    class="relative transition-colors duration-200"
    :class="{
      'cursor-pointer': hasAudio,
      'is-playing': isPlaying,
    }"
    :role="hasAudio ? 'button' : undefined"
    :tabindex="hasAudio ? 0 : undefined"
    :aria-label="hasAudio ? `Play pronunciation of ${text}` : undefined"
    @click.stop="handleInteract"
    @keydown.space.prevent.stop="handleInteract"
    @keydown.enter.prevent.stop="handleInteract"
  >{{ text }}</span>
</template>

<style scoped>
/* Playing: shift to primary color */
.is-playing {
  color: var(--color-primary);
}

/* Pulsing underline while audio plays — uses ::after to avoid layout shift */
.is-playing::after {
  content: '';
  position: absolute;
  bottom: -3px;
  left: 0;
  right: 0;
  height: 2px;
  border-radius: 1px;
  background-color: var(--color-primary);
  animation: audio-playing 0.9s ease-in-out infinite;
}

@keyframes audio-playing {
  0%, 100% { opacity: 1;   transform: scaleX(1);    }
  50%       { opacity: 0.3; transform: scaleX(0.72); }
}
</style>
