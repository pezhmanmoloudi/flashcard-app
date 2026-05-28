import { ref, computed, onUnmounted } from 'vue'
import type { CSSProperties } from 'vue'

interface UseCardSwipeOptions {
  threshold?: number
  onSwipeRight?: () => void
  onSwipeLeft?: () => void
}

export function useCardSwipe(options: UseCardSwipeOptions = {}) {
  const { threshold = 100, onSwipeRight, onSwipeLeft } = options

  const dragX = ref(0)
  const dragY = ref(0)
  const isDragging = ref(false)
  const isAnimating = ref(false)
  const wasDragged = ref(false)

  let startX = 0
  let startY = 0
  let lastX = 0
  let velocityX = 0
  let activePointerId = -1

  const TAP_THRESHOLD = 8

  const rotation = computed(() => dragX.value * 0.06)

  const rightOpacity = computed(() =>
    Math.min(Math.max(dragX.value / threshold, 0), 1),
  )
  const leftOpacity = computed(() =>
    Math.min(Math.max(-dragX.value / threshold, 0), 1),
  )

  const cardStyle = computed((): CSSProperties => ({
    transform: `translate(${dragX.value}px, ${dragY.value}px) rotate(${rotation.value}deg)`,
    transition: isAnimating.value
      ? 'transform 0.38s cubic-bezier(0.25, 0.46, 0.45, 0.94)'
      : 'none',
    cursor: isDragging.value ? 'grabbing' : 'grab',
    userSelect: 'none',
    willChange: 'transform',
    touchAction: 'none',
  }))

  // ── Document-level handlers ──────────────────────────────────────────────
  //
  // Why document listeners instead of setPointerCapture:
  //
  // setPointerCapture redirects ALL pointer events for that pointerId to the
  // capturing element, including the browser's click synthesis that follows
  // pointerup. This means the synthesised click fires on the outer card div
  // (the capturing element) rather than on the element actually under the
  // pointer (e.g. the WordAudio span). As a result, @click.stop on WordAudio
  // never executes and every word-tap also triggers a card flip.
  //
  // Document-level listeners give the same reliable drag tracking across the
  // full viewport without hijacking click dispatch, so @click.stop on
  // WordAudio works as expected.

  function onDocumentPointerMove(e: PointerEvent) {
    if (!isDragging.value || e.pointerId !== activePointerId) return
    velocityX = e.clientX - lastX
    lastX = e.clientX
    dragX.value = e.clientX - startX
    dragY.value = (e.clientY - startY) * 0.25
    if (Math.abs(dragX.value) > TAP_THRESHOLD || Math.abs(dragY.value) > TAP_THRESHOLD) {
      wasDragged.value = true
    }
  }

  function detach() {
    document.removeEventListener('pointermove', onDocumentPointerMove)
    document.removeEventListener('pointerup', onDocumentPointerUp)
    document.removeEventListener('pointercancel', onDocumentPointerCancel)
  }

  function onDocumentPointerUp(e: PointerEvent) {
    if (!isDragging.value || e.pointerId !== activePointerId) return
    isDragging.value = false
    detach()

    const dx = dragX.value
    const dy = dragY.value

    if (Math.abs(dx) >= threshold || Math.abs(velocityX) > 12) {
      const direction = dx > 0 ? 1 : -1
      isAnimating.value = true
      dragX.value = direction * (window.innerWidth + 200)
      dragY.value = dy * 2

      setTimeout(() => {
        isAnimating.value = false
        dragX.value = 0
        dragY.value = 0
        if (direction > 0) onSwipeRight?.()
        else onSwipeLeft?.()
      }, 350)
    } else {
      // Spring back to center
      isAnimating.value = true
      dragX.value = 0
      dragY.value = 0
      setTimeout(() => { isAnimating.value = false }, 420)
    }
  }

  function onDocumentPointerCancel(e: PointerEvent) {
    if (!isDragging.value || e.pointerId !== activePointerId) return
    isDragging.value = false
    detach()
    isAnimating.value = true
    dragX.value = 0
    dragY.value = 0
    setTimeout(() => { isAnimating.value = false }, 420)
  }

  // ── Element handler (only pointerdown stays on the card element) ─────────

  function onPointerDown(e: PointerEvent) {
    if (isAnimating.value || isDragging.value) return
    isDragging.value = true
    wasDragged.value = false
    activePointerId = e.pointerId
    startX = e.clientX
    startY = e.clientY
    lastX = e.clientX
    velocityX = 0
    dragX.value = 0
    dragY.value = 0
    document.addEventListener('pointermove', onDocumentPointerMove)
    document.addEventListener('pointerup', onDocumentPointerUp)
    document.addEventListener('pointercancel', onDocumentPointerCancel)
  }

  onUnmounted(detach)

  return {
    dragX,
    isDragging,
    isAnimating,
    wasDragged,
    rightOpacity,
    leftOpacity,
    cardStyle,
    // Only pointerdown is bound to the card element itself.
    // Move / up / cancel are tracked at document level (see above).
    handlers: {
      onPointerdown: onPointerDown,
    },
  }
}
