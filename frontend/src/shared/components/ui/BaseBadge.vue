<script setup lang="ts">
interface Props {
  variant?: 'default' | 'primary' | 'success' | 'warning' | 'danger'
}

const { variant = 'default' } = defineProps<Props>()

const variantClasses = {
  default: 'bg-gray-100 text-gray-600',
  primary: 'bg-[var(--color-primary-light)] text-[var(--color-primary)]',
  success: 'bg-green-100 text-green-700',
  warning: 'bg-amber-100 text-amber-700',
  danger: 'bg-red-100 text-red-700',
}
</script>

<template>
  <span
    class="inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-medium"
    :class="variantClasses[variant]"
  >
    <slot />
  </span>
</template>
