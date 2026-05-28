import { ref, computed } from 'vue'
import { extractError } from '@/shared/utils'
import type { PasswordStrength } from '../types'
import { settingsService } from '../services/settings.service'

export function useUpdatePassword() {
  const currentPassword = ref('')
  const password = ref('')
  const passwordConfirmation = ref('')
  const loading = ref(false)
  const error = ref<string | null>(null)
  const success = ref(false)

  const passwordStrength = computed<PasswordStrength>(() => {
    const p = password.value
    if (p.length < 8) return 'weak'
    let score = 0
    if (/[a-z]/.test(p)) score++
    if (/[A-Z]/.test(p)) score++
    if (/[0-9]/.test(p)) score++
    if (/[^a-zA-Z0-9]/.test(p)) score++
    if (score <= 2) return 'weak'
    if (score === 3) return 'fair'
    return 'strong'
  })

  const confirmError = computed(() => {
    if (passwordConfirmation.value && password.value !== passwordConfirmation.value) {
      return 'Passwords do not match'
    }
    return undefined
  })

  function validate(): string | null {
    if (!currentPassword.value) return 'Current password is required'
    if (!password.value) return 'New password is required'
    if (password.value.length < 8) return 'Password must be at least 8 characters'
    if (password.value !== passwordConfirmation.value) return 'Passwords do not match'
    return null
  }

  async function submit(): Promise<boolean> {
    error.value = null
    success.value = false

    const validationError = validate()
    if (validationError) {
      error.value = validationError
      return false
    }

    loading.value = true
    try {
      await settingsService.updatePassword({
        current_password: currentPassword.value,
        password: password.value,
        password_confirmation: passwordConfirmation.value,
      })
      success.value = true
      currentPassword.value = ''
      password.value = ''
      passwordConfirmation.value = ''
      return true
    } catch (e) {
      error.value = extractError(e)
      return false
    } finally {
      loading.value = false
    }
  }

  return {
    currentPassword,
    password,
    passwordConfirmation,
    passwordStrength,
    confirmError,
    loading,
    error,
    success,
    submit,
  }
}
