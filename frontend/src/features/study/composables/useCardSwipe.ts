import { ref, computed } from 'vue'
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
  // True if the pointer moved beyond the tap threshold during this gesture.
  // The card's click handler reads this to skip the flip when the user
  // was dragging (spring-back path) rather than tapping.
  const wasDragged = ref(false)

  let startX = 0
  let startY = 0
  let lastX = 0
  let velocityX = 0

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

  function onPointerDown(e: PointerEvent) {
    if (isAnimating.value || isDragging.value) return
    isDragging.value = true
    wasDragged.value = false
    startX = e.clientX
    startY = e.clientY
    lastX = e.clientX
    velocityX = 0
    dragX.value = 0
    dragY.value = 0
    ;(e.currentTarget as HTMLElement)?.setPointerCapture(e.pointerId)
  }

  function onPointerMove(e: PointerEvent) {
    if (!isDragging.value) return
    velocityX = e.clientX - lastX
    lastX = e.clientX
    dragX.value = e.clientX - startX
    dragY.value = (e.clientY - startY) * 0.25
    if (Math.abs(dragX.value) > TAP_THRESHOLD || Math.abs(dragY.value) > TAP_THRESHOLD) {
      wasDragged.value = true
    }
  }

  function onPointerUp() {
    if (!isDragging.value) return
    isDragging.value = false

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

  function onPointerCancel() {
    if (!isDragging.value) return
    isDragging.value = false
    isAnimating.value = true
    dragX.value = 0
    dragY.value = 0
    setTimeout(() => { isAnimating.value = false }, 420)
  }

  return {
    dragX,
    isDragging,
    isAnimating,
    wasDragged,
    rightOpacity,
    leftOpacity,
    cardStyle,
    handlers: {
      onPointerdown: onPointerDown,
      onPointermove: onPointerMove,
      onPointerup: onPointerUp,
      onPointercancel: onPointerCancel,
    },
  }
}
