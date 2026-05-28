class User < ApplicationRecord
  has_secure_password

  has_many :decks,          dependent: :destroy
  has_many :study_sessions, dependent: :destroy
  has_many :card_progresses, dependent: :destroy
  has_many :quiz_sessions,  dependent: :destroy

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 8 }, allow_nil: true

  before_save { self.email = email.downcase }
end
