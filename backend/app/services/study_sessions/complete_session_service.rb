module StudySessions
  class CompleteSessionService < ApplicationService
    def initialize(study_session:)
      @study_session = study_session
    end

    def call
      return Success(@study_session) if @study_session.completed?

      return Failure(@study_session.errors.full_messages) unless @study_session.update(completed_at: Time.current)

      Success(@study_session)
    end
  end
end
