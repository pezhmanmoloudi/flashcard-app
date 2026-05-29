module FlashcardSets
  # Returns a Set of flashcard_set IDs that the given user has fully completed.
  # A set is complete when every flashcard in it has a CardProgress record
  # with repetitions >= 1 (studied at least once).
  class SetCompletionQuery
    def self.call(user:, sets:)
      new(user: user, sets: sets).call
    end

    def initialize(user:, sets:)
      @user = user
      @sets = sets
    end

    def call
      return ::Set.new if @sets.empty?

      completed_ids = FlashcardSet
        .joins(:flashcards)
        .joins(
          "LEFT JOIN card_progresses cp " \
          "ON cp.flashcard_id = flashcards.id " \
          "AND cp.user_id = #{@user.id.to_i} " \
          "AND cp.repetitions >= 1"
        )
        .where(id: @sets.map(&:id))
        .group("flashcard_sets.id")
        .having("COUNT(flashcards.id) > 0 AND COUNT(flashcards.id) = COUNT(cp.id)")
        .pluck("flashcard_sets.id")

      ::Set.new(completed_ids)
    end
  end
end
