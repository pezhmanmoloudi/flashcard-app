module Api
  module V1
    class UserStatsSerializer
      def self.call(stats)
        {
          total_cards_studied: stats.total_cards_studied,
          total_sessions:      stats.total_sessions,
          study_streak:        stats.study_streak,
          cards_mastered:      stats.cards_mastered
        }
      end
    end
  end
end
