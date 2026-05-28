<script setup lang="ts">
interface Props {
  variant?: 'error' | 'success' | 'warning' | 'info'
  message: string
}

const { variant = 'error' } = defineProps<Props>()

const variantClasses = {
  error: 'bg-red-50 border-red-200 text-red-700',
  success: 'bg-green-50 border-green-200 text-green-700',
  warning: 'bg-amber-50 border-amber-200 text-amber-700',
  info: 'bg-blue-50 border-blue-200 text-blue-700',
}

const roleMap = {
  error: 'alert',
  success: 'status',
  warning: 'alert',
  info: 'status',
} as const
</script>

<template>
  <div
    :role="roleMap[variant]"
    class="rounded-lg border px-4 py-3 text-sm"
    :class="variantClasses[variant]"
  >
    {{ message }}
  </div>
</template>
