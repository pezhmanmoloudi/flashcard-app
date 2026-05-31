module ReviewSessions
  class CompleteSessionService < ApplicationService
    def initialize(review_session:)
      @review_session = review_session
    end

    def call
      return Success(@review_session) if @review_session.completed?

      return Failure(@review_session.errors.full_messages) unless @review_session.update(completed_at: Time.current)

      Success(@review_session)
    end
  end
end
