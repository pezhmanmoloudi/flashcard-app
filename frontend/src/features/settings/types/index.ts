export interface UserSettings {
  daily_study_goal: number
  preferred_language_pair?: {
    source: string
    target: string
  }
  notifications_enabled: boolean
}

export interface UpdateEmailPayload {
  email: string
}

export interface UpdatePasswordPayload {
  current_password: string
  password: string
  password_confirmation: string
}

export type PasswordStrength = 'weak' | 'fair' | 'strong'
