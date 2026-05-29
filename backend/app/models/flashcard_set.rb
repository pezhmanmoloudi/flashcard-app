class FlashcardSet < ApplicationRecord
  belongs_to :deck
  has_many :flashcards, dependent: :destroy

  validates :name,        presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 500 }, allow_blank: true
  validates :position,    numericality: { greater_than_or_equal_to: 0, only_integer: true }

  scope :ordered, -> { order(position: :asc, created_at: :asc) }
end
