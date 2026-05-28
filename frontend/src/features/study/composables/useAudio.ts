import { ref, watchEffect, onUnmounted } from 'vue'
import type { MaybeRefOrGetter } from 'vue'
import { toValue } from 'vue'

export function useAudio(src: MaybeRefOrGetter<string | null | undefined>) {
  const isPlaying = ref(false)

  let audio: HTMLAudioElement | null = null

  function onEnded() {
    isPlaying.value = false
  }

  function teardown() {
    if (!audio) return
    audio.pause()
    audio.removeEventListener('ended', onEnded)
    audio = null
    isPlaying.value = false
  }

  // Re-runs whenever src changes, cleaning up the previous Audio element first
  watchEffect(() => {
    const resolved = toValue(src)
    teardown()
    if (!resolved) return
    audio = new Audio(resolved)
    audio.preload = 'auto'
    audio.addEventListener('ended', onEnded)
  })

  function play() {
    if (!audio) return
    // Capture reference so the async callback can detect stale state
    const target = audio
    target.currentTime = 0
    target.play()
      .then(() => {
        if (audio === target) isPlaying.value = true
      })
      .catch(() => {
        if (audio === target) isPlaying.value = false
      })
  }

  function stop() {
    if (!audio) return
    audio.pause()
    audio.currentTime = 0
    isPlaying.value = false
  }

  onUnmounted(teardown)

  return { isPlaying, play, stop }
}
