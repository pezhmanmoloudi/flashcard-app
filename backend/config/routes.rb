require "sidekiq/web"

Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # Sidekiq web UI — restrict to authenticated admins once auth is in place
  mount Sidekiq::Web => "/sidekiq" if Rails.env.development?

  namespace :api do
    namespace :v1 do
      get  "health",       to: "health#show"
      post "auth/signup",  to: "auth#signup"
      post "auth/login",   to: "auth#login"
      get   "profile",          to: "profiles#show"
      patch "profile/email",    to: "profiles#update_email"
      patch "profile/password", to: "profiles#update_password"
      get  "stats",        to: "stats#show"
      get  "study/queue",  to: "study_queue#index"

      resources :decks do
        # Deck-level flashcard listing and due-cards — still accessible at deck scope
        resources :flashcards, only: [:index], shallow: false
        get :due_flashcards, to: "flashcards#due", on: :member
        get :stats,          to: "decks#stats",    on: :member

        resources :study_sessions, only: [:create]
        resources :quiz_sessions,  only: [:create]

        # FlashcardSets are always scoped to a deck
        resources :flashcard_sets, only: [:index, :create], shallow: false
      end

      # Shallow set/flashcard routes — no deck_id needed for member actions
      resources :flashcard_sets, only: [:show, :update, :destroy] do
        resources :flashcards, only: [:create], shallow: false
      end

      # Flashcard member actions — shallow (no deck or set nesting needed)
      resources :flashcards, only: [:show, :update, :destroy] do
        resource :progress, only: [:show, :create, :update], controller: "card_progresses" do
          post :review, on: :member
        end
      end

      resources :study_sessions, only: [:index, :update] do
        resources :reviews, only: [:create], controller: "study_session_reviews"
        post :complete, on: :member
      end
      resources :quiz_sessions,  only: [:index, :show, :update]
      resources :quiz_questions, only: [] do
        post :answer, on: :member
      end
    end
  end
end
