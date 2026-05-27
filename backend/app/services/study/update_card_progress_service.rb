module Study
  class UpdateCardProgressService < ApplicationService
    def initialize(progress:, params:)
      @progress = progress
      @params   = params
    end

    def call
      return Failure(@progress.errors.full_messages) unless @progress.update(@params)

      Success(@progress)
    end
  end
end
