class CreateFlashcards < ActiveRecord::Migration[8.0]
  def change
    create_table :flashcards do |t|
      t.references :deck, null: false, foreign_key: true
      t.string :front_text,       null: false
      t.string :back_text,        null: false
      t.string :source_language,  null: false
      t.string :target_language,  null: false
      t.text   :example_sentence
      t.string :image_url
      t.string :audio_url

      t.timestamps
    end
  end
end
