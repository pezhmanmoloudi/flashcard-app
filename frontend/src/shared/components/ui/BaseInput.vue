<script setup lang="ts">
interface Props {
  modelValue: string
  label?: string
  type?: string
  placeholder?: string
  error?: string
  hint?: string
  required?: boolean
  disabled?: boolean
  autocomplete?: string
  id?: string
}

const {
  type = 'text',
  label = undefined,
  placeholder = undefined,
  error = undefined,
  hint = undefined,
  required = false,
  disabled = false,
  autocomplete = undefined,
  id = undefined,
} = defineProps<Props>()

const emit = defineEmits<{
  'update:modelValue': [value: string]
}>()

const inputId = id ?? `input-${Math.random().toString(36).slice(2, 7)}`
</script>

<template>
  <div class="flex flex-col gap-1">
    <label
      v-if="label"
      :for="inputId"
      class="text-sm font-medium text-gray-700"
    >
      {{ label }}
      <span
        v-if="required"
        class="text-red-500 ml-0.5"
        aria-hidden="true"
      >*</span>
    </label>

    <input
      :id="inputId"
      :value="modelValue"
      :type="type"
      :placeholder="placeholder"
      :required="required"
      :disabled="disabled"
      :autocomplete="autocomplete"
      :aria-describedby="error ? `${inputId}-error` : hint ? `${inputId}-hint` : undefined"
      :aria-invalid="!!error"
      class="w-full rounded-lg border px-3 py-2 text-sm text-gray-900 placeholder-gray-400 transition-colors focus:outline-none focus:ring-2 focus:ring-[var(--color-primary)] focus:border-transparent disabled:bg-gray-50 disabled:text-gray-400"
      :class="error ? 'border-red-400 bg-red-50' : 'border-[var(--color-border)] bg-white'"
      @input="emit('update:modelValue', ($event.target as HTMLInputElement).value)"
    >

    <p
      v-if="error"
      :id="`${inputId}-error`"
      role="alert"
      class="text-xs text-red-600"
    >
      {{ error }}
    </p>
    <p
      v-else-if="hint"
      :id="`${inputId}-hint`"
      class="text-xs text-gray-400"
    >
      {{ hint }}
    </p>
  </div>
</template>
