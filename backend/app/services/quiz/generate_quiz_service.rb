module Quiz
  class GenerateQuizService < ApplicationService
    DEFAULT_QUESTION_COUNT = 10
    DISTRACTORS_PER_QUESTION = 3

    def initialize(user:, deck:, quiz_type: "mixed", count: DEFAULT_QUESTION_COUNT)
      @user      = user
      @deck      = deck
      @quiz_type = quiz_type
      @count     = [count.to_i, 1].max
    end

    def call
      return Failure(["Quiz type is invalid"]) unless QuizSession::QUIZ_TYPES.include?(@quiz_type)

      flashcards = @deck.flashcards.ordered.to_a
      return Failure(["Deck has no flashcards"]) if flashcards.empty?

      selected = flashcards.sample(@count)

      ActiveRecord::Base.transaction do
        session = build_session(selected.size)
        return Failure(session.errors.full_messages) unless session.save

        build_questions(session, selected, flashcards)
        session.reload

        Success(session)
      end
    rescue ActiveRecord::RecordInvalid => e
      Failure([e.message])
    end

    private

    def build_session(question_count)
      @deck.quiz_sessions.build(
        user:            @user,
        quiz_type:       @quiz_type,
        total_questions: question_count,
        correct_answers: 0
      )
    end

    def build_questions(session, selected, all_flashcards)
      selected.each_with_index do |flashcard, index|
        type    = resolve_question_type
        prompt  = build_prompt(flashcard, type)
        correct = correct_answer(flashcard, type)
        options = build_options(flashcard, type, all_flashcards, correct)

        session.quiz_questions.create!(
          flashcard:     flashcard,
          question_type: type,
          prompt:        prompt,
          options:       options,
          correct_answer: correct,
          position:      index
        )
      end
    end

    def resolve_question_type
      return @quiz_type unless @quiz_type == "mixed"
      QuizQuestion::QUESTION_TYPES.sample
    end

    def build_prompt(flashcard, type)
      case type
      when "fill_in_blank"
        "What is the translation of \"#{flashcard.front_text}\"?"
      when "word_meaning"
        if flashcard.example_sentence.present?
          "In the sentence \"#{flashcard.example_sentence}\", what does \"#{flashcard.back_text}\" mean?"
        else
          "What does \"#{flashcard.back_text}\" mean?"
        end
      end
    end

    def correct_answer(flashcard, type)
      type == "fill_in_blank" ? flashcard.back_text : flashcard.front_text
    end

    def build_options(flashcard, type, all_flashcards, correct)
      distractors = all_flashcards
        .reject { |f| f.id == flashcard.id }
        .sample(DISTRACTORS_PER_QUESTION)
        .map { |f| type == "fill_in_blank" ? f.back_text : f.front_text }

      (distractors + [correct]).shuffle
    end
  end
end
