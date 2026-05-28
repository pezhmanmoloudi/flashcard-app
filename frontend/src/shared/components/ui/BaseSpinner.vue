<script setup lang="ts">
interface Props {
  size?: 'sm' | 'md' | 'lg'
  inheritColor?: boolean
}

const { size = 'md', inheritColor = false } = defineProps<Props>()

const sizeClasses = {
  sm: 'w-3.5 h-3.5 border-2',
  md: 'w-5 h-5 border-2',
  lg: 'w-8 h-8 border-[3px]',
}
</script>

<template>
  <span
    role="status"
    aria-label="Loading"
    class="inline-block rounded-full animate-spin border-solid border-r-transparent"
    :class="[
      sizeClasses[size],
      inheritColor ? 'border-current border-r-transparent' : 'border-[var(--color-primary)] border-r-transparent',
    ]"
  />
</template>
