export interface Deck {
  id: number
  name: string
  description?: string
  flashcards_count: number
  created_at: string
  updated_at: string
}

export interface Flashcard {
  id: number
  front_text: string
  back_text: string
  source_language: string
  target_language: string
  example_sentence?: string
  deck_id: number
  created_at: string
  updated_at: string
}
