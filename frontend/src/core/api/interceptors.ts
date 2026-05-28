import { apiClient } from './client'
import { router } from '@/core/router'
import { useAuthStore } from '@/core/stores/auth.store'
import { ROUTE_NAMES } from '@/core/router/route-names'

export function setupInterceptors() {
  apiClient.interceptors.request.use((config) => {
    const token = localStorage.getItem('auth_token')
    if (token) {
      config.headers.Authorization = `Bearer ${token}`
    }
    return config
  })

  apiClient.interceptors.response.use(
    (response) => response,
    (error) => {
      if (error.response?.status === 401) {
        useAuthStore().clearAuth()
        router.push({ name: ROUTE_NAMES.AUTH_LOGIN })
      }
      return Promise.reject(error)
    },
  )
}
