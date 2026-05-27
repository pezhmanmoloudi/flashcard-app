module Study
  class UpdateStudySessionService < ApplicationService
    def initialize(study_session:, params:)
      @study_session = study_session
      @params        = params
    end

    def call
      return Failure(@study_session.errors.full_messages) unless @study_session.update(@params)

      Success(@study_session)
    end
  end
end
