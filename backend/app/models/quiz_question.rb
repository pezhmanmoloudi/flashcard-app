class QuizQuestion < ApplicationRecord
  QUESTION_TYPES = %w[fill_in_blank word_meaning].freeze

  belongs_to :quiz_session
  belongs_to :flashcard

  validates :question_type,  presence: true, inclusion: { in: QUESTION_TYPES }
  validates :prompt,         presence: true
  validates :correct_answer, presence: true
  validates :position,       numericality: { greater_than_or_equal_to: 0, only_integer: true }

  scope :answered,   -> { where.not(user_answer: nil) }
  scope :unanswered, -> { where(user_answer: nil) }
  scope :correct,    -> { where(answered_correctly: true) }

  def answered?
    user_answer.present?
  end
end
