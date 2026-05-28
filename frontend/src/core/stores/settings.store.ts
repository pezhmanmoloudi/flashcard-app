import { defineStore } from 'pinia'
import { ref, watch } from 'vue'

type Theme = 'light' | 'dark'

export const useSettingsStore = defineStore('settings', () => {
  const theme = ref<Theme>((localStorage.getItem('settings_theme') as Theme) ?? 'light')

  watch(theme, (val) => localStorage.setItem('settings_theme', val))

  function setTheme(newTheme: Theme) {
    theme.value = newTheme
  }

  return { theme, setTheme }
})
