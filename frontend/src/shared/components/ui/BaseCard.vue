<script setup lang="ts">
interface Props {
  padding?: 'none' | 'sm' | 'md' | 'lg'
  hoverable?: boolean
}

const { padding = 'md', hoverable = false } = defineProps<Props>()

const paddingClasses = {
  none: '',
  sm: 'p-3',
  md: 'p-5',
  lg: 'p-6',
}
</script>

<template>
  <div
    class="bg-white border border-[var(--color-border)] rounded-[var(--radius-card)]"
    :class="[paddingClasses[padding], hoverable ? 'transition-shadow hover:shadow-md cursor-pointer' : '']"
  >
    <slot />
  </div>
</template>
