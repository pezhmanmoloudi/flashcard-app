module Study
  class CreateStudySessionService < ApplicationService
    def initialize(user:, deck:)
      @user = user
      @deck = deck
    end

    def call
      session = @deck.study_sessions.build(user: @user)
      return Failure(session.errors.full_messages) unless session.save

      Success(session)
    end
  end
end
