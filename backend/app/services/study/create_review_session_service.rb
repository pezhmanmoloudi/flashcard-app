module Study
  class CreateReviewSessionService < ApplicationService
    def initialize(user:, language_pair:)
      @user          = user
      @language_pair = language_pair
    end

    def call
      existing = @user.review_sessions
                      .in_progress
                      .where("DATE(created_at AT TIME ZONE 'UTC') = ?", Date.current)
                      .where(language_pair: @language_pair)
                      .first
      return Success(existing) if existing

      session = @user.review_sessions.build(language_pair: @language_pair)
      return Failure(session.errors.full_messages) unless session.save

      Success(session)
    end
  end
end
