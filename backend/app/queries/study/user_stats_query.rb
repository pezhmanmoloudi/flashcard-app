module Study
  class UserStatsQuery
    MASTERY_THRESHOLD = 3

    UserStats = Struct.new(
      :total_cards_studied, :total_sessions, :study_streak, :cards_mastered,
      keyword_init: true
    )

    def self.call(user:)
      new(user: user).call
    end

    def initialize(user:)
      @user = user
    end

    def call
      completed = @user.study_sessions.completed

      UserStats.new(
        total_cards_studied: completed.sum(:cards_studied),
        total_sessions:      completed.count,
        study_streak:        compute_streak,
        cards_mastered:      @user.card_progresses.where(repetitions: MASTERY_THRESHOLD..).count
      )
    end

    private

    def compute_streak
      dates = @user.study_sessions
                   .completed
                   .where.not(completed_at: nil)
                   .pluck(Arel.sql("DATE(completed_at)"))
                   .map(&:to_date)
                   .uniq
                   .sort
                   .reverse

      return 0 if dates.empty?
      return 0 if dates.first < Date.current - 1

      streak   = 0
      expected = dates.first
      dates.each do |date|
        break if date < expected

        streak  += 1
        expected -= 1
      end
      streak
    end
  end
end
