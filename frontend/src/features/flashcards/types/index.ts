export interface Deck {
  id: number
  name: string
  description?: string
  is_system: boolean
  level?: string
  language_pair?: string
  position: number
  flashcard_set_count: number
  flashcard_count: number
  created_at: string
}

export interface DeckParams {
  name: string
  description?: string
  level?: string
  language_pair?: string
}

export interface FlashcardSet {
  id: number
  deck_id: number
  name: string
  description?: string
  position: number
  flashcard_count: number
  created_at: string
}

export interface FlashcardSetParams {
  name: string
  description?: string
  position?: number
}

export interface Flashcard {
  id: number
  flashcard_set_id: number
  deck_id: number
  front_text: string
  back_text: string
  source_language: string
  target_language: string
  example_sentence?: string
  translated_sentence?: string
  grammar_notes?: string
  image_url?: string
  audio_url?: string
  created_at: string
}

export interface FlashcardParams {
  front_text: string
  back_text: string
  source_language: string
  target_language: string
  example_sentence?: string
  translated_sentence?: string
  grammar_notes?: string
}
