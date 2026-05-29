export const LEARNING_MODE_ORDER = ['de_to_fa', 'de_to_en', 'en_to_fa'] as const
export type LearningMode = (typeof LEARNING_MODE_ORDER)[number]

export interface LearningModeConfig {
  label: string
  sourceFlag: string
  targetFlag: string
}

export const LEARNING_MODE_CONFIG: Record<LearningMode, LearningModeConfig> = {
  de_to_fa: { label: 'German → فارسی',  sourceFlag: '🇩🇪', targetFlag: '🇮🇷' },
  de_to_en: { label: 'German → English', sourceFlag: '🇩🇪', targetFlag: '🇬🇧' },
  en_to_fa: { label: 'English → فارسی',  sourceFlag: '🇬🇧', targetFlag: '🇮🇷' },
}

/** Runtime type-guard — validates an unknown value before use as LearningMode */
export function isLearningMode(value: unknown): value is LearningMode {
  return LEARNING_MODE_ORDER.includes(value as LearningMode)
}
