module Api
  module V1
    class BaseController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :not_found
      rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
      rescue_from ActionController::ParameterMissing, with: :bad_request

      private

      # Response helpers

      def render_ok(data)
        render json: data, status: :ok
      end

      def render_created(data)
        render json: data, status: :created
      end

      def render_no_content
        head :no_content
      end

      def render_error(message, status: :unprocessable_entity)
        render json: { error: message }, status: status
      end

      # Error handlers

      def not_found
        render json: { error: "Resource not found" }, status: :not_found
      end

      def unprocessable_entity(exception)
        render json: { error: exception.record.errors.full_messages.join(", ") }, status: :unprocessable_entity
      end

      def bad_request(exception)
        render json: { error: exception.message }, status: :bad_request
      end
    end
  end
end
