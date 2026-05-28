<script setup lang="ts">
interface Option {
  value: string
  label: string
}

interface Props {
  modelValue: string
  options: Option[]
  label?: string
  placeholder?: string
  error?: string
  hint?: string
  required?: boolean
  disabled?: boolean
  id?: string
}

const {
  label = undefined,
  placeholder = undefined,
  error = undefined,
  hint = undefined,
  required = false,
  disabled = false,
  id = undefined,
} = defineProps<Props>()

const emit = defineEmits<{
  'update:modelValue': [value: string]
}>()

const inputId = id ?? `select-${Math.random().toString(36).slice(2, 7)}`
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

    <div class="relative">
      <select
        :id="inputId"
        :value="modelValue"
        :required="required"
        :disabled="disabled"
        :aria-describedby="error ? `${inputId}-error` : hint ? `${inputId}-hint` : undefined"
        :aria-invalid="!!error"
        class="w-full rounded-lg border px-3 py-2 text-sm text-gray-900 bg-white appearance-none pr-8 transition-colors focus:outline-none focus:ring-2 focus:ring-[var(--color-primary)] focus:border-transparent disabled:bg-gray-50 disabled:text-gray-400"
        :class="error ? 'border-red-400 bg-red-50' : 'border-[var(--color-border)]'"
        @change="emit('update:modelValue', ($event.target as HTMLSelectElement).value)"
      >
        <option
          v-if="placeholder"
          value=""
          disabled
          :selected="modelValue === ''"
        >
          {{ placeholder }}
        </option>
        <option
          v-for="opt in options"
          :key="opt.value"
          :value="opt.value"
        >
          {{ opt.label }}
        </option>
      </select>

      <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center pr-2.5">
        <svg
          class="w-4 h-4 text-gray-400"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
          stroke-width="2"
          aria-hidden="true"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M19 9l-7 7-7-7"
          />
        </svg>
      </div>
    </div>

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
