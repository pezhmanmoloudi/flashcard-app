module Study
  class CreateStudySessionService < ApplicationService
    def initialize(user:, deck:)
      @user = user
      @deck = deck
    end

    def call
      existing = @deck.study_sessions
                      .in_progress
                      .where("DATE(created_at AT TIME ZONE 'UTC') = ?", Date.current)
                      .where(user: @user)
                      .first
      return Success(existing) if existing

      session = @deck.study_sessions.build(user: @user)
      return Failure(session.errors.full_messages) unless session.save

      Success(session)
    end
  end
end
