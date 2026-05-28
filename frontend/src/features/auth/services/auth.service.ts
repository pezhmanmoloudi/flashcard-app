import { apiClient } from '@/core/api/client'
import type { AuthUser, AuthApiResponse, LoginCredentials, RegisterCredentials } from '../types'

export const authService = {
  async login(credentials: LoginCredentials): Promise<{ token: string; user: AuthUser }> {
    const { data } = await apiClient.post<AuthApiResponse>('/auth/login', { user: credentials })
    return data.data
  },

  async register(credentials: RegisterCredentials): Promise<{ token: string; user: AuthUser }> {
    const { data } = await apiClient.post<AuthApiResponse>('/auth/signup', { user: credentials })
    return data.data
  },

  async fetchProfile(): Promise<AuthUser> {
    const { data } = await apiClient.get<{ data: AuthUser }>('/profile')
    return data.data
  },
}
