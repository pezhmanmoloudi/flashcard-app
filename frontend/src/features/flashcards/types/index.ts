export interface Deck {
  id: number
  name: string
  description?: string
  flashcard_count: number
  created_at: string
}

export interface DeckParams {
  name: string
  description?: string
}

export interface Flashcard {
  id: number
  deck_id: number
  front_text: string
  back_text: string
  source_language: string
  target_language: string
  example_sentence?: string
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
}
