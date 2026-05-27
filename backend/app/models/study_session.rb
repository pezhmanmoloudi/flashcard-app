class StudySession < ApplicationRecord
  belongs_to :user
  belongs_to :deck

  validates :cards_studied, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  scope :completed,   -> { where.not(completed_at: nil) }
  scope :in_progress, -> { where(completed_at: nil) }
  scope :ordered,     -> { order(created_at: :desc) }

  def completed?
    completed_at.present?
  end
end
