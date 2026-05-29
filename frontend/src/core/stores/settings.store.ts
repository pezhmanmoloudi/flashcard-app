import { defineStore } from 'pinia'
import { ref, watch } from 'vue'
import { isLearningMode, type LearningMode } from '@/shared/constants/learningModes'

type Theme = 'light' | 'dark'

export const useSettingsStore = defineStore('settings', () => {
  const theme = ref<Theme>((localStorage.getItem('settings_theme') as Theme) ?? 'light')

  const _storedMode = localStorage.getItem('settings_preferred_learning_mode')
  const preferredLearningMode = ref<LearningMode | null>(
    isLearningMode(_storedMode) ? _storedMode : null,
  )

  watch(theme, (val) => localStorage.setItem('settings_theme', val))

  watch(preferredLearningMode, (val) => {
    if (val) localStorage.setItem('settings_preferred_learning_mode', val)
    else localStorage.removeItem('settings_preferred_learning_mode')
  })

  function setTheme(newTheme: Theme) {
    theme.value = newTheme
  }

  function setPreferredLearningMode(mode: LearningMode | null) {
    preferredLearningMode.value = mode
  }

  return { theme, setTheme, preferredLearningMode, setPreferredLearningMode }
})
