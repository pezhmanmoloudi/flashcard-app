export interface OnboardingStep {
  id: string
  title: string
  description: string
  completed: boolean
}

export type OnboardingState = 'pending' | 'in_progress' | 'completed'
