import { defineStore } from 'pinia'
import { ref } from 'vue'

type Theme = 'light' | 'dark'

export const useSettingsStore = defineStore('settings', () => {
  const theme = ref<Theme>('light')

  function setTheme(newTheme: Theme) {
    theme.value = newTheme
  }

  return { theme, setTheme }
})
