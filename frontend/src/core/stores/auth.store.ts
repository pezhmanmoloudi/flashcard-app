import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import type { AuthUser, LoginCredentials, RegisterCredentials } from '@/features/auth/types'
import { authService } from '@/features/auth/services/auth.service'

export const useAuthStore = defineStore('auth', () => {
  const token = ref<string | null>(localStorage.getItem('auth_token'))
  const user = ref<AuthUser | null>(null)
  const loading = ref(false)

  const isAuthenticated = computed(() => !!token.value)

  function _persist(newToken: string) {
    token.value = newToken
    localStorage.setItem('auth_token', newToken)
  }

  function clearAuth() {
    token.value = null
    user.value = null
    localStorage.removeItem('auth_token')
  }

  async function login(credentials: LoginCredentials) {
    loading.value = true
    try {
      const result = await authService.login(credentials)
      _persist(result.token)
      user.value = result.user
    } finally {
      loading.value = false
    }
  }

  async function register(credentials: RegisterCredentials) {
    loading.value = true
    try {
      const result = await authService.register(credentials)
      _persist(result.token)
      user.value = result.user
    } finally {
      loading.value = false
    }
  }

  async function initialize() {
    if (!token.value) return
    try {
      user.value = await authService.fetchProfile()
    } catch {
      clearAuth()
    }
  }

  function logout() {
    clearAuth()
  }

  return {
    token,
    user,
    loading,
    isAuthenticated,
    clearAuth,
    login,
    register,
    initialize,
    logout,
  }
})
