<script setup lang="ts">
import { ref, watch } from 'vue'
import type { DeckParams } from '../types'
import { BaseInput, BaseTextarea, BaseButton, BaseAlert } from '@/shared/components/ui'

interface Props {
  initialValues?: DeckParams
  loading?: boolean
  error?: string | null
  submitLabel?: string
}

const {
  initialValues,
  loading = false,
  error = null,
  submitLabel = 'Save',
} = defineProps<Props>()

const emit = defineEmits<{
  submit: [params: DeckParams]
  cancel: []
}>()

const name = ref(initialValues?.name ?? '')
const description = ref(initialValues?.description ?? '')
const nameError = ref<string | null>(null)

watch(
  () => initialValues,
  (val) => {
    if (val) {
      name.value = val.name
      description.value = val.description ?? ''
    }
  },
)

function validate(): boolean {
  nameError.value = null
  if (!name.value.trim()) {
    nameError.value = 'Name is required'
    return false
  }
  return true
}

function handleSubmit() {
  if (!validate()) return
  emit('submit', {
    name: name.value.trim(),
    description: description.value.trim() || undefined,
  })
}
</script>

<template>
  <form
    class="space-y-4 max-w-lg"
    novalidate
    @submit.prevent="handleSubmit"
  >
    <BaseAlert
      v-if="error"
      variant="error"
      :message="error"
    />

    <BaseInput
      v-model="name"
      label="Name"
      placeholder="e.g. German Vocabulary"
      :error="nameError ?? undefined"
      :disabled="loading"
      required
    />

    <BaseTextarea
      v-model="description"
      label="Description"
      placeholder="Optional — add some context for this deck."
      :rows="3"
      :disabled="loading"
      hint="Describe what this deck covers."
    />

    <div class="flex items-center gap-3 pt-2">
      <BaseButton
        type="submit"
        :loading="loading"
        :disabled="loading"
      >
        {{ submitLabel }}
      </BaseButton>
      <BaseButton
        variant="ghost"
        type="button"
        :disabled="loading"
        @click="emit('cancel')"
      >
        Cancel
      </BaseButton>
    </div>
  </form>
</template>
