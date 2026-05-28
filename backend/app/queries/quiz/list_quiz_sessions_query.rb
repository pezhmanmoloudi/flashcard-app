module Quiz
  class ListQuizSessionsQuery
    def self.call(user:)
      new(user: user).call
    end

    def initialize(user:)
      @user = user
    end

    def call
      @user.quiz_sessions
           .includes(:deck, quiz_questions: :flashcard)
           .ordered
    end
  end
end
