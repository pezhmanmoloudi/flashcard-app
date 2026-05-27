module Study
  class CreateCardProgressService < ApplicationService
    def initialize(user:, flashcard:, params:)
      @user      = user
      @flashcard = flashcard
      @params    = params
    end

    def call
      progress = CardProgress.new(@params.merge(user: @user, flashcard: @flashcard))
      return Failure(progress.errors.full_messages) unless progress.save

      Success(progress)
    end
  end
end
