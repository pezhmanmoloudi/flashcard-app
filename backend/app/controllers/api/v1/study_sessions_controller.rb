module Api
  module V1
    class StudySessionsController < BaseController
      include Authenticatable

      before_action :set_deck,          only: [:create]
      before_action :set_study_session, only: [:update]

      def index
        sessions = current_user.study_sessions.ordered
        render_ok(sessions.map { |s| serialize(s) })
      end

      def create
        session = @deck.study_sessions.build(user: current_user)

        if session.save
          render_created(serialize(session))
        else
          render_error(session.errors.full_messages.join(", "))
        end
      end

      def update
        if @study_session.update(study_session_params)
          render_ok(serialize(@study_session))
        else
          render_error(@study_session.errors.full_messages.join(", "))
        end
      end

      private

      def set_deck
        @deck = current_user.decks.find(params[:deck_id])
      end

      def set_study_session
        @study_session = current_user.study_sessions.find(params[:id])
      end

      def study_session_params
        params.require(:study_session).permit(:cards_studied, :completed_at)
      end

      def serialize(session)
        {
          id:            session.id,
          deck_id:       session.deck_id,
          cards_studied: session.cards_studied,
          completed:     session.completed?,
          completed_at:  session.completed_at,
          created_at:    session.created_at
        }
      end
    end
  end
end
