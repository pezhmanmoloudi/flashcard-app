class Flashcard < ApplicationRecord
  SUPPORTED_LANGUAGES = %w[german english persian].freeze

  belongs_to :deck
  has_one :card_progress, dependent: :destroy

  validates :front_text,      presence: true
  validates :back_text,       presence: true
  validates :source_language, presence: true, inclusion: { in: SUPPORTED_LANGUAGES }
  validates :target_language, presence: true, inclusion: { in: SUPPORTED_LANGUAGES }
  validate  :languages_must_differ

  scope :ordered, -> { order(created_at: :asc) }

  private

  def languages_must_differ
    return unless source_language.present? && target_language.present?
    errors.add(:target_language, "must differ from source language") if source_language == target_language
  end
end
