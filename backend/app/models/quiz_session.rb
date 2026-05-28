class QuizSession < ApplicationRecord
  QUIZ_TYPES = %w[fill_in_blank word_meaning mixed].freeze

  belongs_to :user
  belongs_to :deck
  has_many :quiz_questions, -> { order(position: :asc) }, dependent: :destroy

  validates :quiz_type,       presence: true, inclusion: { in: QUIZ_TYPES }
  validates :total_questions, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :correct_answers, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  scope :completed,   -> { where.not(completed_at: nil) }
  scope :in_progress, -> { where(completed_at: nil) }
  scope :ordered,     -> { order(created_at: :desc) }

  def completed?
    completed_at.present?
  end

  def score
    return 0 if total_questions.zero?
    ((correct_answers.to_f / total_questions) * 100).round(1)
  end
end
