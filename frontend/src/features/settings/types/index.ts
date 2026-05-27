export interface UserSettings {
  daily_study_goal: number
  preferred_language_pair?: {
    source: string
    target: string
  }
  notifications_enabled: boolean
}
