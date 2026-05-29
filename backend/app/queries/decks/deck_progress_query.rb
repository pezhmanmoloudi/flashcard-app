module Decks
  # Returns per-deck card progress counts for the given user.
  # Used to derive is_completed, progress_percentage, and unlock status.
  # Result: { deck_id => { completed_count: N, total_count: M } }
  class DeckProgressQuery
    def self.call(user:, decks:)
      new(user: user, decks: decks).call
    end

    def initialize(user:, decks:)
      @user  = user
      @decks = decks
    end

    def call
      return {} if @decks.empty?

      rows = Deck
        .joins(flashcard_sets: :flashcards)
        .joins(
          "LEFT JOIN card_progresses cp " \
          "ON cp.flashcard_id = flashcards.id " \
          "AND cp.user_id = #{@user.id.to_i} " \
          "AND cp.repetitions >= 1"
        )
        .where(id: @decks.map(&:id))
        .group("decks.id")
        .having("COUNT(flashcards.id) > 0")
        .pluck("decks.id, COUNT(flashcards.id), COUNT(cp.id)")

      rows.each_with_object({}) do |(deck_id, total, completed), hash|
        hash[deck_id] = { completed_count: completed, total_count: total }
      end
    end
  end
end
