module Api
  module V1
    class DeckStatsSerializer
      def self.call(stats)
        {
          total_cards:    stats.total_cards,
          new_count:      stats.new_count,
          due_count:      stats.due_count,
          mastered_count: stats.mastered_count,
          learning_count: stats.learning_count
        }
      end
    end
  end
end
