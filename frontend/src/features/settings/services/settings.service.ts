import { apiClient } from '@/core/api/client'
import type { AuthUser } from '@/features/auth/types'
import type { UpdateEmailPayload, UpdatePasswordPayload } from '../types'

export const settingsService = {
  async updateEmail(payload: UpdateEmailPayload): Promise<AuthUser> {
    const { data } = await apiClient.patch<{ data: AuthUser }>('/profile/email', {
      email: payload,
    })
    return data.data
  },

  async updatePassword(payload: UpdatePasswordPayload): Promise<void> {
    await apiClient.patch('/profile/password', { password: payload })
  },
}
