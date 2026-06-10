<script setup lang="ts">
import { ref, watch } from 'vue'
import type { FlashcardParams } from '../types'
import { LANGUAGES } from '@/shared/constants'
import { BaseInput, BaseTextarea, BaseButton, BaseAlert, BaseSelect } from '@/shared/components/ui'

const LANGUAGE_OPTIONS = [
  { value: LANGUAGES.DE, label: 'German' },
  { value: LANGUAGES.EN, label: 'English' },
  { value: LANGUAGES.FA, label: 'Persian' },
]

interface Props {
  initialValues?: FlashcardParams
  loading?: boolean
  error?: string | null
  submitLabel?: string
  showActions?: boolean
}

const {
  initialValues,
  loading = false,
  error = null,
  submitLabel = 'Save',
  showActions = true,
} = defineProps<Props>()

const emit = defineEmits<{
  submit: [params: FlashcardParams]
  cancel: []
  change: [values: { front_text: string; back_text: string; source_language: string; target_language: string }]
}>()

const frontText = ref(initialValues?.front_text ?? '')
const backText = ref(initialValues?.back_text ?? '')
const sourceLanguage = ref(initialValues?.source_language ?? '')
const targetLanguage = ref(initialValues?.target_language ?? '')
const exampleSentence = ref(initialValues?.example_sentence ?? '')
const translatedSentence = ref(initialValues?.translated_sentence ?? '')
const grammarNotes = ref(initialValues?.grammar_notes ?? '')

const frontTextError = ref<string | null>(null)
const backTextError = ref<string | null>(null)
const sourceLangError = ref<string | null>(null)
const targetLangError = ref<string | null>(null)

watch(
  () => initialValues,
  (val) => {
    if (val) {
      frontText.value = val.front_text
      backText.value = val.back_text
      sourceLanguage.value = val.source_language
      targetLanguage.value = val.target_language
      exampleSentence.value = val.example_sentence ?? ''
      translatedSentence.value = val.translated_sentence ?? ''
      grammarNotes.value = val.grammar_notes ?? ''
    }
  },
)

watch([frontText, backText, sourceLanguage, targetLanguage], () => {
  emit('change', {
    front_text:      frontText.value,
    back_text:       backText.value,
    source_language: sourceLanguage.value,
    target_language: targetLanguage.value,
  })
})

function validate(): boolean {
  frontTextError.value = null
  backTextError.value = null
  sourceLangError.value = null
  targetLangError.value = null
  let valid = true

  if (!frontText.value.trim()) {
    frontTextError.value = 'Front text is required'
    valid = false
  }
  if (!backText.value.trim()) {
    backTextError.value = 'Back text is required'
    valid = false
  }
  if (!sourceLanguage.value) {
    sourceLangError.value = 'Source language is required'
    valid = false
  }
  if (!targetLanguage.value) {
    targetLangError.value = 'Target language is required'
    valid = false
  }

  return valid
}

function handleSubmit() {
  if (!validate()) return
  emit('submit', {
    front_text:          frontText.value.trim(),
    back_text:           backText.value.trim(),
    source_language:     sourceLanguage.value,
    target_language:     targetLanguage.value,
    example_sentence:    exampleSentence.value.trim() || undefined,
    translated_sentence: translatedSentence.value.trim() || undefined,
    grammar_notes:       grammarNotes.value.trim() || undefined,
  })
}
</script>

<template>
  <form
    class="space-y-4 max-w-xl"
    novalidate
    @submit.prevent="handleSubmit"
  >
    <BaseAlert
      v-if="error"
      variant="error"
      :message="error"
    />

    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
      <BaseInput
        v-model="frontText"
        label="Front"
        placeholder="e.g. das Haus"
        :error="frontTextError ?? undefined"
        :disabled="loading"
        required
      />
      <BaseInput
        v-model="backText"
        label="Back"
        placeholder="e.g. the house"
        :error="backTextError ?? undefined"
        :disabled="loading"
        required
      />
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
      <BaseSelect
        v-model="sourceLanguage"
        label="Source language"
        placeholder="Select..."
        :options="LANGUAGE_OPTIONS"
        :error="sourceLangError ?? undefined"
        :disabled="loading"
        required
      />
      <BaseSelect
        v-model="targetLanguage"
        label="Target language"
        placeholder="Select..."
        :options="LANGUAGE_OPTIONS"
        :error="targetLangError ?? undefined"
        :disabled="loading"
        required
      />
    </div>

    <BaseTextarea
      v-model="exampleSentence"
      label="Example sentence"
      placeholder="Optional — add a sentence using this word in context."
      :rows="2"
      :disabled="loading"
      hint="Optional."
    />

    <BaseTextarea
      v-model="translatedSentence"
      label="Sentence translation"
      placeholder="Optional — translation of the example sentence."
      :rows="2"
      :disabled="loading"
      hint="Optional."
    />

    <BaseTextarea
      v-model="grammarNotes"
      label="Grammar notes"
      placeholder="Optional — grammatical gender, case, verb form, usage notes…"
      :rows="2"
      :disabled="loading"
      hint="Optional."
    />

    <div
      v-if="showActions"
      class="flex items-center gap-3 pt-2"
    >
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
