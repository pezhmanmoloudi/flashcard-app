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
      resources :decks do
        resources :flashcards,     shallow: true
        resources :study_sessions, only: [:create]
        get :due_flashcards, to: "flashcards#due", on: :member
        get :stats,          to: "decks#stats",    on: :member
      end

      resources :study_sessions, only: [:index, :update]

      resources :flashcards, only: [] do
        resource :progress, only: [:show, :create, :update], controller: "card_progresses" do
          post :review, on: :member
        end
      end
    end
  end
end
