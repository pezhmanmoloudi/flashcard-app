class ReviewSession < ApplicationRecord
  belongs_to :user

  LANGUAGE_PAIRS = %w[de_to_fa de_to_en en_to_fa].freeze

  validates :language_pair, presence: true, inclusion: { in: LANGUAGE_PAIRS }
  validates :cards_reviewed, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  scope :completed,   -> { where.not(completed_at: nil) }
  scope :in_progress, -> { where(completed_at: nil) }
  scope :ordered,     -> { order(created_at: :desc) }

  def completed?
    completed_at.present?
  end
end
