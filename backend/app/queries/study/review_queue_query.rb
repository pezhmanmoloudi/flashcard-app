module Study
  # Returns decks that have cards due for review for the given user,
  # grouped with per-set due counts. Only decks accessible to the user
  # (own decks or system decks) are included.
  class ReviewQueueQuery
    def self.call(user:)
      new(user: user).call
    end

    def initialize(user:)
      @user = user
    end

    def call
      rows = FlashcardSet
        .joins(:deck)
        .joins("INNER JOIN flashcards ON flashcards.flashcard_set_id = flashcard_sets.id")
        .joins(user_progress_join)
        .where(
          "decks.user_id = :uid OR decks.is_system = :sys",
          uid: @user.id, sys: true
        )
        .where(
          "card_progresses.id IS NOT NULL " \
          "AND card_progresses.next_review_at <= :now " \
          "AND card_progresses.needs_review = false",
          now: Time.current
        )
        .group(
          "decks.id", "decks.name", "decks.description",
          "decks.level", "decks.language_pair", "decks.position",
          "flashcard_sets.id", "flashcard_sets.name", "flashcard_sets.position"
        )
        .order("decks.position ASC, flashcard_sets.position ASC")
        .select(
          "decks.id              AS deck_id",
          "decks.name            AS deck_name",
          "decks.description     AS deck_description",
          "decks.level           AS deck_level",
          "decks.language_pair   AS deck_language_pair",
          "flashcard_sets.id     AS set_id",
          "flashcard_sets.name   AS set_name",
          "flashcard_sets.position AS set_position",
          "COUNT(flashcards.id)  AS due_count"
        )

      build_queue(rows)
    end

    private

    def user_progress_join
      # INNER JOIN: we only want cards that have been reviewed at least once.
      # @user.id is an integer PK — safe to interpolate.
      "INNER JOIN card_progresses " \
      "ON card_progresses.flashcard_id = flashcards.id " \
      "AND card_progresses.user_id = #{@user.id.to_i}"
    end

    def build_queue(rows)
      deck_index = {}
      deck_order = []

      rows.each do |row|
        deck_id = row.deck_id.to_i

        unless deck_index.key?(deck_id)
          deck_index[deck_id] = {
            id:            deck_id,
            name:          row.deck_name,
            description:   row.deck_description,
            level:         row.deck_level,
            language_pair: row.deck_language_pair,
            total_due:     0,
            flashcard_sets: []
          }
          deck_order << deck_id
        end

        due = row.due_count.to_i
        deck_index[deck_id][:flashcard_sets] << {
          id:        row.set_id.to_i,
          name:      row.set_name,
          position:  row.set_position.to_i,
          due_count: due
        }
        deck_index[deck_id][:total_due] += due
      end

      deck_order.map { |id| deck_index[id] }
    end
  end
end
