module Study
  class ListStudySessionsQuery
    def self.call(user:)
      new(user: user).call
    end

    def initialize(user:)
      @user = user
    end

    def call
      @user.study_sessions.ordered
    end
  end
end
