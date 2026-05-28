<script setup lang="ts">
import { ref } from 'vue'

interface Props {
  src: string
}

defineProps<Props>()

const audioEl = ref<HTMLAudioElement | null>(null)

function play() {
  audioEl.value?.play().catch(() => {})
}

defineExpose({ play })
</script>

<template>
  <div>
    <button
      type="button"
      class="flex items-center justify-center w-9 h-9 rounded-full bg-white/90 backdrop-blur-sm shadow-sm border border-gray-100 text-gray-500 hover:text-[var(--color-primary)] hover:border-[var(--color-primary-light)] transition-colors active:scale-95"
      aria-label="Play pronunciation"
      @click.stop="play"
    >
      <svg
        class="w-4 h-4"
        fill="currentColor"
        viewBox="0 0 24 24"
        aria-hidden="true"
      >
        <path d="M8 5v14l11-7z" />
      </svg>
    </button>
    <audio
      ref="audioEl"
      :src="src"
      preload="none"
    />
  </div>
</template>
