module Study
  class FindCardProgressQuery
    def self.call(user:, flashcard:)
      new(user: user, flashcard: flashcard).call
    end

    def initialize(user:, flashcard:)
      @user      = user
      @flashcard = flashcard
    end

    def call
      @user.card_progresses.find_by(flashcard: @flashcard)
    end
  end
end
