class CardProgress < ApplicationRecord
  belongs_to :user
  belongs_to :flashcard

  validates :repetitions,    numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :easiness_factor, numericality: { greater_than_or_equal_to: 1.3 }
  validates :interval_days,  numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :flashcard_id,   uniqueness: { scope: :user_id, message: "progress already exists for this flashcard" }

  scope :due_for_review, -> { where("next_review_at <= ?", Time.current) }
  scope :not_yet_studied, -> { where(repetitions: 0) }
  scope :ordered_by_due, -> { order(next_review_at: :asc) }

  def due?
    next_review_at.nil? || next_review_at <= Time.current
  end
end
