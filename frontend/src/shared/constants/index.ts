export const LANGUAGES = {
  DE: 'german',
  EN: 'english',
  FA: 'persian',
} as const

export type Language = (typeof LANGUAGES)[keyof typeof LANGUAGES]

export const LANGUAGE_PAIRS = [
  { source: LANGUAGES.DE, target: LANGUAGES.FA },
  { source: LANGUAGES.DE, target: LANGUAGES.EN },
  { source: LANGUAGES.EN, target: LANGUAGES.FA },
] as const
