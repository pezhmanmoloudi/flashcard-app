class Deck < ApplicationRecord
  LANGUAGE_PAIRS = %w[de_to_fa de_to_en en_to_fa].freeze
  LEVELS         = %w[A1 A2 B1 B2 C1 C2].freeze

  belongs_to :user, optional: true
  has_many :flashcard_sets, dependent: :destroy
  has_many :flashcards,     through: :flashcard_sets
  has_many :study_sessions, dependent: :destroy
  has_many :quiz_sessions,  dependent: :destroy

  validates :name,          presence: true, length: { maximum: 100 }
  validates :description,   length: { maximum: 500 }, allow_blank: true
  validates :language_pair, inclusion: { in: LANGUAGE_PAIRS }, allow_nil: true
  validates :level,         inclusion: { in: LEVELS },         allow_nil: true
  validate  :user_required_for_non_system_deck

  scope :system_decks,    -> { where(is_system: true) }
  scope :for_user,        ->(user) { where(user: user) }
  scope :accessible_to,  ->(user) { where(user: user).or(where(is_system: true)) }
  scope :ordered,         -> { order(position: :asc, created_at: :desc) }

  private

  def user_required_for_non_system_deck
    errors.add(:user, "must be present for non-system decks") if !is_system && user_id.nil?
  end
end
