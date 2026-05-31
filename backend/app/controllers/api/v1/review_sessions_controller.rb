module Api
  module V1
    class ReviewSessionsController < BaseController
      include Authenticatable

      before_action :set_review_session, only: [:cards, :create_review, :complete]

      # GET /api/v1/study/review
      # Returns per-language-pair due counts (inbox + SM-2 combined).
      def summary
        data = Study::ReviewQueueSummaryQuery.call(user: current_user)
        render_ok(data)
      end

      # POST /api/v1/review_sessions
      # Body: { language_pair: "de_to_fa" }
      def create
        result = Study::CreateReviewSessionService.call(
          user:          current_user,
          language_pair: review_session_params[:language_pair]
        )
        if result.success?
          render_created(Api::V1::ReviewSessionSerializer.call(result.value!))
        else
          render_error(result.failure.join(", "))
        end
      end

      # GET /api/v1/review_sessions/:id/cards
      # Optional param: ?include_waiting=true to include inbox cards not yet due.
      def cards
        flashcards = Study::FlatReviewCardsQuery.call(
          user:            current_user,
          language_pair:   @review_session.language_pair,
          include_waiting: params[:include_waiting] == 'true'
        )
        render_ok(Api::V1::ReviewCardSerializer.collection(flashcards))
      end

      # POST /api/v1/review_sessions/:id/reviews
      def create_review
        result = ReviewSessions::RecordReviewService.call(
          review_session:   @review_session,
          flashcard_id:     review_params[:flashcard_id],
          result:           review_params[:result],
          response_time_ms: review_params[:response_time_ms]
        )
        if result.success?
          render_created(Api::V1::CardProgressSerializer.call(result.value!))
        else
          render_error(result.failure.join(", "))
        end
      end

      # POST /api/v1/review_sessions/:id/complete
      def complete
        result = ReviewSessions::CompleteSessionService.call(review_session: @review_session)
        if result.success?
          render_ok(Api::V1::ReviewSessionSerializer.call(result.value!))
        else
          render_error(result.failure.join(", "))
        end
      end

      private

      def set_review_session
        @review_session = current_user.review_sessions.find(params[:id])
      end

      def review_session_params
        params.permit(:language_pair)
      end

      def review_params
        params.permit(:flashcard_id, :result, :response_time_ms)
      end
    end
  end
end
