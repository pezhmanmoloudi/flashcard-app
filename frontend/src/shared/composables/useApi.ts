import { ref } from 'vue'
import type { ApiError } from '@/shared/types'

export function useApi<T>() {
  const data = ref<T | null>(null)
  const loading = ref(false)
  const error = ref<ApiError | null>(null)

  async function execute(fn: () => Promise<T>) {
    loading.value = true
    error.value = null
    try {
      data.value = await fn()
    } catch (e: unknown) {
      error.value = (e as { response?: { data?: ApiError } })?.response?.data ?? {
        message: 'An unexpected error occurred',
      }
    } finally {
      loading.value = false
    }
  }

  return { data, loading, error, execute }
}
