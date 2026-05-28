<script setup lang="ts">
import BaseSpinner from './BaseSpinner.vue'

interface Props {
  variant?: 'primary' | 'secondary' | 'ghost' | 'danger'
  size?: 'sm' | 'md' | 'lg'
  type?: 'button' | 'submit' | 'reset'
  loading?: boolean
  disabled?: boolean
  fullWidth?: boolean
}

const {
  variant = 'primary',
  size = 'md',
  type = 'button',
  loading = false,
  disabled = false,
  fullWidth = false,
} = defineProps<Props>()

const variantClasses = {
  primary: 'bg-[var(--color-primary)] text-white hover:opacity-90',
  secondary: 'bg-white border border-[var(--color-border)] text-gray-700 hover:bg-gray-50',
  ghost: 'text-gray-600 hover:bg-gray-100',
  danger: 'bg-red-600 text-white hover:bg-red-700',
}

const sizeClasses = {
  sm: 'px-3 py-1.5 text-xs',
  md: 'px-4 py-2 text-sm',
  lg: 'px-6 py-3 text-base',
}
</script>

<template>
  <button
    :type="type"
    :disabled="disabled || loading"
    class="inline-flex items-center justify-center gap-2 font-medium rounded-[var(--radius-btn)] transition-all focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[var(--color-primary)] focus-visible:ring-offset-2 disabled:opacity-50 disabled:cursor-not-allowed"
    :class="[variantClasses[variant], sizeClasses[size], fullWidth ? 'w-full' : '']"
  >
    <BaseSpinner
      v-if="loading"
      size="sm"
      :inherit-color="true"
    />
    <slot />
  </button>
</template>
