class Deck < ApplicationRecord
  belongs_to :user
  has_many :flashcards,     dependent: :destroy
  has_many :study_sessions, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 500 }, allow_blank: true

  scope :ordered, -> { order(created_at: :desc) }
end
