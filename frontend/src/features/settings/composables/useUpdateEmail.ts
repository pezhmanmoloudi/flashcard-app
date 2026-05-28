import { ref, computed } from 'vue'
import { extractError } from '@/shared/utils'
import type { AuthUser } from '@/features/auth/types'
import { settingsService } from '../services/settings.service'

export function useUpdateEmail(currentEmail: string) {
  const email = ref(currentEmail)
  const loading = ref(false)
  const error = ref<string | null>(null)
  const success = ref(false)

  const isDirty = computed(() => email.value.trim() !== currentEmail)

  function validate(): string | null {
    if (!email.value.trim()) return 'Email is required'
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value)) return 'Enter a valid email address'
    if (!isDirty.value) return 'This is already your current email'
    return null
  }

  async function submit(): Promise<AuthUser | null> {
    error.value = null
    success.value = false

    const validationError = validate()
    if (validationError) {
      error.value = validationError
      return null
    }

    loading.value = true
    try {
      const user = await settingsService.updateEmail({ email: email.value.trim() })
      success.value = true
      return user
    } catch (e) {
      error.value = extractError(e)
      return null
    } finally {
      loading.value = false
    }
  }

  return { email, loading, error, success, isDirty, submit }
}
